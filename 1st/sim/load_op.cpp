#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <vector>
#include <map>
#include <unistd.h>
#include "sim.h"
#include "myutil.h"

// アセンブリをパースして命令列にする
int load_ops(FILE *fp)
{
    std::smatch results;
    std::string s1;
    op_info new_op = {0};
    char buf[100];
    int i = 0;
    int idx = 0;

    while (fgets(buf, 100, fp) != NULL)
    {
        s1 = buf;
        // 空行読み飛ばし
        if (s1 == "\n")
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
            ops.push_back(new_op);
        }
        // ex. .global
        else if (regex_match(s1, results, std::regex("^[.](.+?)\t(.+?)\n?$")))
        {
            new_op.type = 2;
            new_op.other = results[1].str();
            if (results[1].str() == "global")
                global_start = i;
            else if (results[1].str() == "section" && results[2].str() == "\".text\"")
                initialize_end = i;
            ops.push_back(new_op);
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
