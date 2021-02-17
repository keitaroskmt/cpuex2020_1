#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <algorithm>
#include <vector>
#include <map>
#include <unistd.h>
#include "load_op.h"
#include "sim.h"
#include "myutil.h"

int reg_label_2_num(int end);
const std::vector<std::string> compare_inst{"beq", "bne", "blt", "fbeq", "fbne", "fblt", "beqi", "blti"};
const std::vector<std::string> store_inst{"sw", "fsw"};
const std::vector<std::string> load_inst{"lw", "flw"};
const std::vector<std::string> jr_inst{"jalr", "jr"};
const std::vector<std::string> j_inst{"jal", "j"};
const std::vector<std::string> jal_inst{"jal", "jalr"};
const std::vector<std::string> src2{"add", "sub", "and", "or", "nor", "beq", "bne", "blt", "fadd", "fsub", "fmul", "fdiv", "fbeq", "fbne", "fblt"};
const std::vector<std::string> src1{"addi", "sll", "srl", "ori", "out", "lw", "sw", "flw", "fsw", "itof", "jr", "jalr", "beqi", "blti", "fneg", "fabs", "fsqrt", "fmov", "ftoi", "floor"};
const std::vector<std::string> is_imm{"addi", "sll", "srl", "ori", "lui", "lw", "sw", "flw", "fsw", "beqi", "blti"};

// アセンブリをパースして命令列にする
int load_ops(FILE *fp)
{
    std::smatch results;
    std::string s1;
    bool valid_op;
    char buf[100];
    int i = 0;
    int idx = 0;

    while (fgets(buf, 100, fp) != NULL)
    {
        valid_op = false;
        op_info new_op = {0};
        new_op.wb = true;
        new_op.load = false;
        new_op.store = false;
        new_op.comp = false;
        new_op.j = false;
        new_op.jr = false;
        new_op.jal = false;
        new_op.opnum = i;
        s1 = buf;
        // 空行読み飛ばし
        if (s1 == "\n")
            continue;
        // コメント行読み飛ばし
        else if (regex_match(s1, results, std::regex("^\t?#.+?\n?$")))
            continue;
        // %g0を含む行の読み飛ばし
        else if (regex_match(s1, results, std::regex("^.*?%g0.*?\n$")))
            continue;
        // ex. add  $a0, $a0, $a1
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (.+?), (.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 3;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            new_op.opland[1] = results[3].str();
            new_op.opland[2] = results[4].str();
            valid_op = true;
        }
        // ex. lw  $a0, 0(%sp)
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (\\d+)\\((.+?)\\)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 3;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            new_op.offset = stoi(results[3].str());
            new_op.opland[1] = results[4].str();
            valid_op = true;
        }
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 2;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            new_op.opland[1] = results[3].str();
            valid_op = true;
        }
        // ex. j    Return
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 1;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            valid_op = true;
        }
        // ex ret
        else if (regex_match(s1, results, std::regex("^\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 0;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            valid_op = true;
        }
        // ex. Label:
        else if (regex_match(s1, results, std::regex("^(.+?):\n?$")))
        {
            new_op.type = 1;
            new_op.label = results[1].str();
            label_pos[new_op.label] = i;
            label_pos_bc[new_op.label] = idx;
            label_counter[new_op.label] = 0;
            valid_op = true;
        }
        // ex. .global
        else if (regex_match(s1, results, std::regex("^[.](.+?)\t(.+?)\n?$")))
        {
            new_op.type = 2;
            new_op.other = results[1].str();
            valid_op = true;
        }
        // 例外処理
        else
        {
            printf("there is a something wrong with '%s'", s1.c_str());
            return 0;
        }

        if (valid_op)
        {
            if (std::find(compare_inst.begin(), compare_inst.end(), new_op.opcode) != compare_inst.end())
            {
                new_op.wb = false;
                new_op.comp = true;
            }
            if (std::find(jr_inst.begin(), jr_inst.end(), new_op.opcode) != jr_inst.end())
            {
                new_op.jr = true;
                new_op.wb = false;
            }
            if (std::find(j_inst.begin(), j_inst.end(), new_op.opcode) != j_inst.end())
            {
                new_op.j = true;
                new_op.wb = false;
            }
            if (std::find(store_inst.begin(), store_inst.end(), new_op.opcode) != store_inst.end())
            {
                new_op.wb = false;
                new_op.store = true;
            }
            if (std::find(load_inst.begin(), load_inst.end(), new_op.opcode) != load_inst.end())
                new_op.load = true;
            if (std::find(jal_inst.begin(), jal_inst.end(), new_op.opcode) != jal_inst.end())
                new_op.jal = true;
            if (std::find(is_imm.begin(), is_imm.end(), new_op.opcode) != is_imm.end())
                new_op.is_imm = true;
            if (std::find(src2.begin(), src2.end(), new_op.opcode) != src2.end())
                new_op.source_type = 1;
            else if (std::find(src1.begin(), src1.end(), new_op.opcode) != src1.end())
                new_op.source_type = 2;

            if (new_op.opcode == "out")
                new_op.wb = false;

            ops.push_back(new_op);
            if (new_op.type == 0)
                idx++;
        }
        i++;
        posbc2pos[idx] = i;
        pos2posbc[i] = idx;
    }
    reg_label_2_num(i);
    return i;
}

int reg_label_2_num(int end)
{
    int j = 0;
    while (j < end)
    {
        if (ops[j].type == 1)
            ops[j].label_num = label_pos[ops[j].label];
        for (int k = 0; k < 3; k++)
        {
            if (ops[j].opland[k].find("%") != std::string::npos)
                ops[j].opland_bit[k] = reg_name.at(ops[j].opland[k]);
            else if (label_pos.find(ops[j].opland[k]) != label_pos.end())
                ops[j].opland_bit[k] = pos2posbc[label_pos[ops[j].opland[k]]];
            else if (ops[j].opland[k] != "")
                ops[j].opland_bit[k] = stoi(ops[j].opland[k]);
        }

        j++;
    }
    return 0;
}