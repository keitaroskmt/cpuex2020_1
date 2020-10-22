#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <map>
#include <errno.h>
#include <unistd.h>
#include "sim.h"

int cur_opnum;
op_info *ops;
core_env cur_env;
std::map<std::string, int> label_pos;
int jump_num = 1;
unsigned int *stack = (unsigned int *)malloc(sizeof(unsigned int) * 1000000);
int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos);
int load_ops(FILE *fp);
void print_state(core_env env);
int exec_step(bool print_process);
void print_stats();

int main(int argc, char *argv[])
{
    int opt;
    bool is_step = false;
    bool is_stat = false;
    bool print_process = false;
    // int n = 1;

    // while ((opt = getopt(argc, argv, "scpn:")) != -1)
    while ((opt = getopt(argc, argv, "scp")) != -1)
    {
        switch (opt)
        {
        case 's':
            is_step = true;
            break;

        case 'c':
            is_stat = true;
            break;

        case 'p':
            print_process = true;
            break;

            // case 'n':
            //     n = atoi(optarg);
            //     break;

        default:
            // printf("Usage: %s [-s] [-c] [-p] [-n argment] \n", argv[0]);
            printf("Usage: %s [-s] [-c] [-p] \n", argv[0]);
            break;
        }
    }

    FILE *fp;
    std::string cmd;
    std::smatch cmd_re;
    int end;
    int errno;
    int line = 0;
    int loop = 0;
    char buf[256];

    cur_env.PC = 0;
    // 事前に行数取得
    if ((fp = fopen("./fib.s", "r")) == NULL)
        perror("fopen error");

    while (fgets(buf, 256, fp) != NULL)
        line++;

    fclose(fp);

    ops = (op_info *)malloc(sizeof(op_info) * line);

    if ((fp = fopen("./fib.s", "r")) == NULL)
        perror("fopen error");

    cur_opnum = 0;
    // 命令のパース
    if ((end = load_ops(fp)) == 0)
        return 0;

    fclose(fp);
    // stackはとりあえず100万要素確保
    cur_env.GPR[reg_name.at("%sp")] = 4000000;
    // フィボナッチに最初に渡すn
    // (10/22 仕様変更に伴い使えなくなった。)
    // cur_env.GPR[reg_name.at("%a0")] = n;

    // step実行
    while (cur_opnum < end)
    {
        if (is_step && loop == 0)
        {
            while (true)
            {
                cmd = get_line(100);
                if (cmd == "s\n")
                {
                    loop = 1;
                    break;
                }
                else if (regex_match(cmd, cmd_re, std::regex("^(\\d+)s\n$")))
                {
                    loop = stoi(cmd_re[1].str());
                    break;
                }
                else if (cmd == "pr\n")
                    print_state(cur_env);
                else if (cmd == "ps\n")
                    print_stats();
                else if (cmd == "r\n")
                {
                    loop = -1;
                    break;
                }
                else if (cmd == "h\n")
                    printf("1 step: 's', Nstep: 'Ns'(N=int), run all: 'r', print reg: 'pr', print stat: 'ps', exit: 'exit'\n");
                else if (cmd == "exit\n")
                    return 0;
            }
        }
        if (exec_step(print_process))
            break;
        loop--;
    }
    printf("ans: %d\n", cur_env.GPR[reg_name.at("%v0")]);
    if (is_stat)
        print_stats();

    return 0;
}

// アセンブリをパースして命令列にする
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
        // ex. lw  $a0, 0(%sp)
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
        // ex ret
        else if (regex_match(s1, results, std::regex("^\t(.+?)\n?$")))
        {
            ops[i].type = 0;
            ops[i].opland_num = 0;
            ops[i].opcode = results[1].str();
        }
        // ex. Label:
        else if (regex_match(s1, results, std::regex("^(.+?):\n?$")))
        {
            ops[i].type = 1;
            ops[i].label = results[1].str();
            label_pos[ops[i].label] = i;
        }
        // ex. .global
        else if (regex_match(s1, results, std::regex("^[.](.+?)\t.+?\n?$")))
        {
            ops[i].type = 2;
            ops[i].other = results[1].str();
            if (results[1].str() == "global")
                cur_opnum = i;
        }
        // 例外処理
        else
        {
            printf("there is a something wrong with '%s'", s1.c_str());
            return 0;
        }
        i++;
    }
    return i;
}

// 1step実行する 命令なら実行し、その他なら読み飛ばす
int exec_step(bool print_process)
{
    if (ops[cur_opnum].type == 0)
    {
        if (print_process)
            printf("%d\t%d\t%s\t%s\t%s\t%s\t%d\n", cur_env.PC, cur_opnum, ops[cur_opnum].opcode.c_str(), ops[cur_opnum].opland[0].c_str(), ops[cur_opnum].opland[1].c_str(), ops[cur_opnum].opland[2].c_str(), ops[cur_opnum].offset);
        if (exec_op(ops[cur_opnum], cur_env, label_pos))
            return 1;
        cur_env.PC++;
    }
    else if (ops[cur_opnum].type == 1)
    {
        if (print_process)
            printf("%s:\n", ops[cur_opnum].label.c_str());
    }
    cur_opnum++;
    return 0;
}

// 1命令実行する
int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos)
{
    int rs, rt, imm, sp;
    std::string label;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rs + rt;
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name.at(op.opland[0])] = rs + imm;
    }
    else if (op.opcode == "bgt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs > rt)
            cur_opnum = label_pos[label];
    }
    else if (op.opcode == "slt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        if (rs < rt)
            cur_env.GPR[reg_name.at(op.opland[0])] = 1;
        else
            cur_env.GPR[reg_name.at(op.opland[0])] = 0;
    }
    else if (op.opcode == "j")
    {
        label = op.opland[0];
        cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "jal")
    {
        label = op.opland[0];
        cur_env.GPR[31] = cur_opnum + 1;
        cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "jr")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        cur_opnum = rs - 1;
    }
    else if (op.opcode == "bne")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs != rt)
            cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "lw")
    {
        sp = cur_env.GPR[reg_name.at("%sp")] + op.offset;
        cur_env.GPR[reg_name.at(op.opland[0])] = stack[sp / 4];
    }
    else if (op.opcode == "sw")
    {
        sp = cur_env.GPR[reg_name.at("%sp")] + op.offset;
        stack[sp / 4] = cur_env.GPR[reg_name.at(op.opland[0])];
    }
    else if (op.opcode == "move")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rt;
    }
    else if (op.opcode == "ret")
    {
        return 1;
    }
    else if (op.opcode == "nop")
    {
        ;
    }
    // 例外処理
    else
    {
        printf("%s is not supported\n", op.opcode.c_str());
        return 1;
    }
    op_counter[op.opcode] += 1;
    op_counter["total"] += 1;
    return 0;
}

// レジスタの状態を出力する
void print_state(core_env env)
{
    printf("%d\t", env.PC);
    printf("GPR\n0-3\t%d\t%d\t%d\t%d\n4-7\t%d\t%d\t%d\t%d\n8-11\t%d\t%d\t%d\t%d\n12-15\t%d\t%d\t%d\t%d\n16-19\t%d\t%d\t%d\t%d\n20-23\t%d\t%d\t%d\t%d\n24-27\t%d\t%d\t%d\t%d\n28-31\t%d\t%X\t%X\t%d\nFPR FPCC: %s\n0-3\t%f\t%f\t%f\t%f\n4-7\t%f\t%f\t%f\t%f\n8-11\t%f\t%f\t%f\t%f\n12-15\t%f\t%f\t%f\t%f\n16-19\t%f\t%f\t%f\t%f\n20-23\t%f\t%f\t%f\t%f\n24-27\t%f\t%f\t%f\t%f\n28-31\t%f\t%f\t%f\t%f\n\n", env.GPR[0], env.GPR[1], env.GPR[2], env.GPR[3], env.GPR[4], env.GPR[5], env.GPR[6], env.GPR[7], env.GPR[8], env.GPR[9], env.GPR[10], env.GPR[11], env.GPR[12], env.GPR[13], env.GPR[14], env.GPR[15], env.GPR[16], env.GPR[17], env.GPR[18], env.GPR[19], env.GPR[20], env.GPR[21], env.GPR[22], env.GPR[23], env.GPR[24], env.GPR[25], env.GPR[26], env.GPR[27], env.GPR[28], env.GPR[29], env.GPR[30], env.GPR[31], env.FPCC, env.FPR[0], env.FPR[1], env.FPR[2], env.FPR[3], env.FPR[4], env.FPR[5], env.FPR[6], env.FPR[7], env.FPR[8], env.FPR[9], env.FPR[10], env.FPR[11], env.FPR[12], env.FPR[13], env.FPR[14], env.FPR[15], env.FPR[16], env.FPR[17], env.FPR[18], env.FPR[19], env.FPR[20], env.FPR[21], env.FPR[22], env.FPR[23], env.FPR[24], env.FPR[25], env.FPR[26], env.FPR[27], env.FPR[28], env.FPR[29], env.FPR[30], env.FPR[31]);
    return;
}

// 命令実行数を出力する
void print_stats()
{
    for (auto itr = op_counter.begin(); itr != op_counter.end(); ++itr)
    {
        printf("%s:\t%d\n", (itr->first).c_str(), itr->second);
    }
    return;
}