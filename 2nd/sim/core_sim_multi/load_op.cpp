#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <vector>
#include <map>
#include <unistd.h>
#include "load_op.h"
#include "sim.h"
#include "myutil.h"

int reg_label_2_num(int end);

// アセンブリをパースして命令列にする
int load_ops(FILE *fp)
{
    std::smatch results;
    std::string s1;
    char buf[100];
    int i = 0;
    int idx = 0;

    while (fgets(buf, 100, fp) != NULL)
    {
        op_info new_op = {0};
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
            ops.push_back(new_op);
            idx++;
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
            ops.push_back(new_op);
            idx++;
        }
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?), (.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 2;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            new_op.opland[1] = results[3].str();
            ops.push_back(new_op);
            idx++;
        }
        // ex. j    Return
        else if (regex_match(s1, results, std::regex("^\t(.+?)\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 1;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            ops.push_back(new_op);
            idx++;
        }
        // ex ret
        else if (regex_match(s1, results, std::regex("^\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 0;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            ops.push_back(new_op);
            idx++;
        }
        // ex. Label:
        else if (regex_match(s1, results, std::regex("^(.+?):\n?$")))
        {
            new_op.type = 1;
            new_op.label = results[1].str();
            label_pos[new_op.label] = i;
            label_pos_bc[new_op.label] = idx;
            label_counter[new_op.label] = 0;
            ops.push_back(new_op);
        }
        // ex. .global
        else if (regex_match(s1, results, std::regex("^[.](.+?)\t(.+?)\n?$")))
        {
            new_op.type = 2;
            new_op.other = results[1].str();
            ops.push_back(new_op);
        }
        // 例外処理
        else
        {
            printf("there is a something wrong with '%s'", s1.c_str());
            return 0;
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
                ops[j].opland_bit[k] = reg_name.at(ops[j].opland[k]) % 32;
            else if (label_pos.find(ops[j].opland[k]) != label_pos.end())
                ops[j].opland_bit[k] = pos2posbc[label_pos[ops[j].opland[k]]];
            else if (ops[j].opland[k] != "")
                ops[j].opland_bit[k] = stoi(ops[j].opland[k]);
        }

        j++;
    }
    return 0;
}