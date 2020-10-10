#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <map>
#include <errno.h>
#include "sim.h"

int cur_opnum;
op_info *ops;
core_env cur_env;
std::map<std::string, int> reg_name;
std::map<std::string, int> label_pos;
int jump_num = 1;
unsigned int *stack = (unsigned int *)malloc(sizeof(unsigned int) * 1000000);
int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos);
int load_ops(FILE *fp);
void reg_name_set();

int main(void)
{
    FILE *fp;
    int end;
    int errno;

    cur_env.PC = 0;
    fp = fopen("./test.s", "r");
    if (fp == NULL)
    {
        perror("fopen error");
    }
    // とりあえず100行までのプログラム前提(動的にやるにはwcコマンドなど?)
    ops = (op_info *)malloc(sizeof(op_info) * 100);

    reg_name_set();
    end = load_ops(fp);
    cur_opnum = 0;
    // stackはとりあえず100万要素確保
    cur_env.GPR[reg_name["$sp"]] = 4000000;
    cur_env.GPR[reg_name["$a0"]] = 5;

    while (cur_opnum < end)
    {
        if (ops[cur_opnum].type == 0)
        {
            printf("%d\t%d\t%s\t%s\t%s\t%s\t%d\n", cur_env.PC, cur_opnum, ops[cur_opnum].opcode.c_str(), ops[cur_opnum].opland[0].c_str(), ops[cur_opnum].opland[1].c_str(), ops[cur_opnum].opland[2].c_str(), ops[cur_opnum].offset);
            if (exec_op(ops[cur_opnum], cur_env, label_pos))
                break;
            cur_env.PC++;
        }
        cur_opnum++;
    }
    printf("%d\n", cur_env.GPR[reg_name["$v0"]]);

    return 0;
}

int load_ops(FILE *fp)
{
    std::smatch results;
    std::string s1;
    char buf[100];
    int i = 0;

    while (fgets(buf, 100, fp) != NULL)
    {
        s1 = buf;
        // 空行読み飛ばし
        if (s1 == "\n")
            continue;
        // ex. add  $a0, $a0, $a1
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (.+?), (.+?)\n?$")))
        {
            ops[i].type = 0;
            ops[i].opland_num = 3;
            ops[i].opcode = results[1].str();
            ops[i].opland[0] = results[2].str();
            ops[i].opland[1] = results[3].str();
            ops[i].opland[2] = results[4].str();
        }
        // ex. lw  $a0, 0($sp)
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (\\d+)\\((.+?)\\)\n?$")))
        {
            ops[i].type = 0;
            ops[i].opland_num = 3;
            ops[i].opcode = results[1].str();
            ops[i].opland[0] = results[2].str();
            ops[i].offset = stoi(results[3].str());
            ops[i].opland[1] = results[4].str();
        }
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (.+?)\n?$")))
        {
            ops[i].type = 0;
            ops[i].opland_num = 2;
            ops[i].opcode = results[1].str();
            ops[i].opland[0] = results[2].str();
            ops[i].opland[1] = results[3].str();
        }
        // ex. j    Return
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?)\n?$")))
        {
            ops[i].type = 0;
            ops[i].opland_num = 1;
            ops[i].opcode = results[1].str();
            ops[i].opland[0] = results[2].str();
        }
        // ex. Label:
        else if (regex_match(s1, results, std::regex("^(.+?):\n?$")))
        {
            ops[i].type = 1;
            ops[i].label = results[1];
            label_pos[ops[i].label] = i;
        }
        // ex. .global
        else if (regex_match(s1, results, std::regex("^[.](.+?)\n?$")))
        {
            ops[i].type = 2;
            ops[i].other = results[1];
        }
        i++;
    }
    return i;
}

int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos)
{
    int rs, rt, imm, sp;
    std::string label;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[reg_name[op.opland[1]]];
        rt = cur_env.GPR[reg_name[op.opland[2]]];
        cur_env.GPR[reg_name[op.opland[0]]] = rs + rt;
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[reg_name[op.opland[1]]];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name[op.opland[0]]] = rs + imm;
    }
    else if (op.opcode == "bgt")
    {
        rs = cur_env.GPR[reg_name[op.opland[0]]];
        rt = cur_env.GPR[reg_name[op.opland[1]]];
        label = op.opland[2];
        if (rs > rt)
            cur_opnum = label_pos[label];
    }
    else if (op.opcode == "j")
    {
        label = op.opland[0];
        cur_opnum = label_pos[label];
    }
    else if (op.opcode == "jal")
    {
        label = op.opland[0];
        cur_env.GPR[31] = cur_opnum + 1;
        cur_opnum = label_pos[label];
    }
    else if (op.opcode == "jr")
    {
        rs = cur_env.GPR[reg_name[op.opland[0]]];
        if (rs < 50)
            cur_opnum = rs - 1;
        else
            return 1;
    }
    else if (op.opcode == "lw")
    {
        sp = cur_env.GPR[reg_name["$sp"]] + op.offset;
        cur_env.GPR[reg_name[op.opland[0]]] = stack[sp / 4];
    }
    else if (op.opcode == "sw")
    {
        sp = cur_env.GPR[reg_name["$sp"]] + op.offset;
        stack[sp / 4] = cur_env.GPR[reg_name[op.opland[0]]];
    }
    else if (op.opcode == "move")
    {
        rt = cur_env.GPR[reg_name[op.opland[1]]];
        cur_env.GPR[reg_name[op.opland[0]]] = rt;
    }
    return 0;
}

void reg_name_set()
{
    reg_name["$zero"] = 0;
    reg_name["$at"] = 1;
    reg_name["$v0"] = 2;
    reg_name["$v1"] = 3;
    reg_name["$a0"] = 4;
    reg_name["$a1"] = 5;
    reg_name["$a2"] = 6;
    reg_name["$a3"] = 7;
    reg_name["$t0"] = 8;
    reg_name["$t1"] = 9;
    reg_name["$t2"] = 10;
    reg_name["$t3"] = 11;
    reg_name["$t4"] = 12;
    reg_name["$t5"] = 13;
    reg_name["$t6"] = 14;
    reg_name["$t7"] = 15;
    reg_name["$s0"] = 16;
    reg_name["$s1"] = 17;
    reg_name["$s2"] = 18;
    reg_name["$s3"] = 19;
    reg_name["$s4"] = 20;
    reg_name["$s5"] = 21;
    reg_name["$s6"] = 22;
    reg_name["$s7"] = 23;
    reg_name["$t8"] = 24;
    reg_name["$t9"] = 25;
    reg_name["$k0"] = 26;
    reg_name["$k1"] = 27;
    reg_name["$gp"] = 28;
    reg_name["$fp"] = 29;
    reg_name["$sp"] = 30;
    reg_name["$ra"] = 31;
    reg_name["$f0"] = 32;
    reg_name["$f1"] = 33;
    reg_name["$f2"] = 34;
    reg_name["$f3"] = 35;
    reg_name["$f4"] = 36;
    reg_name["$f5"] = 37;
    reg_name["$f6"] = 38;
    reg_name["$f7"] = 39;
    reg_name["$f8"] = 40;
    reg_name["$f9"] = 41;
    reg_name["$f10"] = 42;
    reg_name["$f11"] = 43;
    reg_name["$f12"] = 44;
    reg_name["$f13"] = 45;
    reg_name["$f14"] = 46;
    reg_name["$f15"] = 47;
    reg_name["$f16"] = 48;
    reg_name["$f17"] = 49;
    reg_name["$f18"] = 50;
    reg_name["$f19"] = 51;
    reg_name["$f20"] = 52;
    reg_name["$f21"] = 53;
    reg_name["$f22"] = 54;
    reg_name["$f23"] = 55;
    reg_name["$f24"] = 56;
    reg_name["$f25"] = 57;
    reg_name["$f26"] = 58;
    reg_name["$f27"] = 59;
    reg_name["$f28"] = 60;
    reg_name["$f29"] = 61;
    reg_name["$f30"] = 62;
    reg_name["$f31"] = 63;
    return;
}