#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <algorithm>
#include <vector>
#include <unistd.h>
#include "load_op.h"
#include "make_vliw.h"

const std::vector<std::string> ls_inst{"sw", "fsw", "lw", "flw"};
const std::vector<std::string> ex_inst{"add", "sub", "and", "or", "nor", "addi", "sll", "srl", "ori", "lui", "fadd", "fsub", "fmul", "fdiv", "fneg", "fabs", "fsqrt", "fmov", "ftoi", "itof", "floor"};
const std::vector<std::string> j_inst{"jalr", "jr", "jal", "j", "beq", "bne", "blt", "fbeq", "fbne", "fblt", "beqi", "blti", "ret"};
const std::vector<std::string> io_inst{"in", "fin", "out"};

const std::vector<std::string> d1s2{"add", "sub", "and", "or", "nor", "fadd", "fsub", "fmul", "fdiv"};
const std::vector<std::string> d1s1{"sll", "srl", "fmov", "addi", "ori", "lw", "fneg", "fabs", "fsqrt", "flw", "ftoi", "itof", "floor"};
const std::vector<std::string> s2{"blt", "beq", "bne", "fbeq", "fbne", "fblt"};
const std::vector<std::string> s1{"blti", "jr", "beqi", "out"};
const std::vector<std::string> d1{"lui", "in", "fin"};

// アセンブリをパースして命令列にする
int load_ops(FILE *fp)
{
    std::smatch results;
    std::string s_1, s_2;
    bool valid_op;
    char buf[100];
    int i = 0;
    int idx = 0;

    while (fgets(buf, 100, fp) != NULL)
    {
        valid_op = false;
        op_info new_op = {0};
        new_op.slot_1 = false;
        new_op.slot_2 = false;
        new_op.slot_3 = false;
        new_op.slot_4 = false;
        new_op.assigned = false;
        new_op.jump = false;
        new_op.opnum = i;
        s_1 = buf;
        s_2 = buf;
        new_op.op_str = s_2.erase(0, 1).erase(s_2.size() - 1);
        // 空行読み飛ばし
        if (s_1 == "\n")
            continue;
        // コメント行読み飛ばし
        else if (regex_match(s_1, results, std::regex("^\t?#.+?\n?$")))
            continue;
        // %g0を含む行の読み飛ばし
        else if (regex_match(s_1, results, std::regex("^.*?%g0.*?\n$")))
            continue;
        // ex. add  $a0, $a0, $a1
        else if (regex_match(s_1, results, std::regex("^\t(.+?)\t(.+?), (.+?), (.+?)\n?$")))
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
        else if (regex_match(s_1, results, std::regex("^\t(.+?)\t(.+?), (\\d+)\\((.+?)\\)\n?$")))
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
        else if (regex_match(s_1, results, std::regex("^\t(.+?)\t(.+?), (.+?)\n?$")))
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
        else if (regex_match(s_1, results, std::regex("^\t(.+?)\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 1;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            new_op.opland[0] = results[2].str();
            valid_op = true;
        }
        // ex ret
        else if (regex_match(s_1, results, std::regex("^\t(.+?)\n?$")))
        {
            new_op.type = 0;
            new_op.opland_num = 0;
            new_op.op_idx = idx;
            new_op.opcode = results[1].str();
            valid_op = true;
        }
        // ex. Label:
        else if (regex_match(s_1, results, std::regex("^(.+?):\n?$")))
        {
            new_op.type = 1;
            new_op.label = results[1].str();
            valid_op = true;
        }
        // ex. .global
        else if (regex_match(s_1, results, std::regex("^[.](.+?)\t(.+?)\n?$")))
        {
            new_op.type = 2;
            new_op.other = results[1].str();
            valid_op = true;
        }
        // 例外処理
        else
        {
            printf("there is a something wrong with '%s'", s_1.c_str());
            return 0;
        }

        if (valid_op)
        {
            if (std::find(ls_inst.begin(), ls_inst.end(), new_op.opcode) != ls_inst.end())
            {
                new_op.slot_1 = true;
                new_op.slot_2 = true;
            }
            if (std::find(ex_inst.begin(), ex_inst.end(), new_op.opcode) != ex_inst.end())
            {
                new_op.slot_3 = true;
                new_op.slot_4 = true;
            }
            if (std::find(j_inst.begin(), j_inst.end(), new_op.opcode) != j_inst.end())
            {
                new_op.slot_4 = true;
                new_op.jump = true;
            }
            if (std::find(io_inst.begin(), io_inst.end(), new_op.opcode) != io_inst.end())
            {
                new_op.slot_4 = true;
            }

            if (std::find(d1s2.begin(), d1s2.end(), new_op.opcode) != d1s2.end())
            {
                new_op.dest_reg = new_op.opland[0];
                new_op.src_reg1 = new_op.opland[1];
                new_op.src_reg2 = new_op.opland[2];
            }
            else if (std::find(d1s1.begin(), d1s1.end(), new_op.opcode) != d1s1.end())
            {
                new_op.dest_reg = new_op.opland[0];
                new_op.src_reg1 = new_op.opland[1];
            }
            else if (std::find(s2.begin(), s2.end(), new_op.opcode) != s2.end())
            {
                new_op.src_reg1 = new_op.opland[0];
                new_op.src_reg2 = new_op.opland[1];
            }
            else if (std::find(d1.begin(), d1.end(), new_op.opcode) != d1.end())
            {
                new_op.dest_reg = new_op.opland[0];
            }
            else if (std::find(s1.begin(), s1.end(), new_op.opcode) != s1.end())
            {
                new_op.src_reg1 = new_op.opland[0];
            }
            else if (new_op.opcode == "sw" || new_op.opcode == "fsw")
            {
                new_op.dest_reg = new_op.opland[1];
                new_op.src_reg1 = new_op.opland[0];
            }
            else if (new_op.opcode == "jal")
            {
                new_op.dest_reg = "%ra";
            }
            else if (new_op.opcode == "jalr")
            {
                new_op.dest_reg = "%ra";
                new_op.src_reg1 = new_op.opland[0];
            }

            ops.push_back(new_op);
            if (new_op.type == 0)
                idx++;
        }
        i++;
    }
    return i;
}
