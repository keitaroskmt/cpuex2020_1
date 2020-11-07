#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <map>
#include <unistd.h>
#include "sim.h"
#include "myutil.h"

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
