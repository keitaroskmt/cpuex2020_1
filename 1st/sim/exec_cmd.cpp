#include <string>
#include <regex>
#include <stdio.h>
#include <iostream>
#include <bitset>
#include <map>
#include "exec_cmd.h"
#include "sim.h"
#include "myutil.h"
#include "file_io.h"

int exec_cmd(int *loop, bool *is_stat, bool *print_bc, bool *print_calc, bool *print_process)
{
    std::string cmd;
    std::string base;
    std::smatch cmd_re;
    std::string reg;
    int sp, j, offset;
    fi subst;
    while (true)
    {
        cmd = get_line(100);
        if (cmd == "s\n")
        {
            *loop = 1;
            break;
        }
        else if (regex_match(cmd, cmd_re, std::regex("^(\\d+)s\n$")))
        {
            *loop = stoi(cmd_re[1].str());
            break;
        }
        // stack表示 絶対アドレス指定
        else if (regex_match(cmd, cmd_re, std::regex("^stack (\\d+) (\\d+)\n?$")))
        {
            sp = stoi(cmd_re[1].str());
            j = stoi(cmd_re[2].str());

            for (int i = sp - 4 * j; i <= sp + 4 * j; i += 4)
                printf("stack[%d] = (hex) %08X\t(dec) %d\tPC = %llu\n", i, stack[i / 4].first, stack[i / 4].first, stack[i / 4].second);
        }
        // stack代入 絶対アドレス指定
        else if (regex_match(cmd, cmd_re, std::regex("^stackin (\\d+) ([0-9A-Fa-f.]+)\\s?(.*?)\n?$")))
        {
            sp = stoi(cmd_re[1].str());
            base = cmd_re[3].str();
            if (base == "hex" || base == "16")
                subst.i = stoi(cmd_re[2].str(), nullptr, 16);
            else if (base == "float" || base == "f")
                subst.f = stof(cmd_re[2].str());
            else
                subst.i = stoi(cmd_re[2].str());
            stack[sp / 4].first = subst.i;
        }
        // stack表示 相対アドレス指定
        else if (regex_match(cmd, cmd_re, std::regex("^stack (-?\\d+)\\((.+?)\\) (\\d+)\n?$")))
        {
            offset = stoi(cmd_re[1].str());
            reg = cmd_re[2].str();
            sp = cur_env.GPR[reg_name.at(reg)] + offset;
            j = stoi(cmd_re[3].str());

            for (int i = sp - 4 * j; i <= sp + 4 * j; i += 4)
                printf("stack[%d] = (hex) %08X\t(dec) %d\tPC = %llu\n", i, stack[i / 4].first, stack[i / 4].first, stack[i / 4].second);
        }
        // stack代入 相対アドレス指定
        else if (regex_match(cmd, cmd_re, std::regex("^stackin (-?\\d+)\\((.+?)\\) ([0-9A-Fa-f]+)\\s?(.*?)\n?$")))
        {
            offset = stoi(cmd_re[1].str());
            reg = cmd_re[2].str();
            sp = cur_env.GPR[reg_name.at(reg)] + offset;
            base = cmd_re[4].str();
            if (base == "hex" || base == "16")
                subst.i = stoi(cmd_re[3].str(), nullptr, 16);
            else if (base == "float" || base == "f")
                subst.f = stof(cmd_re[2].str());
            else
                subst.i = stoi(cmd_re[3].str());
            stack[sp / 4].first = subst.i;
        }
        // レジスタ代入
        else if (regex_match(cmd, cmd_re, std::regex("^regin (.+?) ([0-9A-Fa-f]+)\\s?(.*?)\n?$")))
        {
            reg = cmd_re[1].str();
            base = cmd_re[3].str();
            if (base == "hex" || base == "16")
                subst.i = stoi(cmd_re[2].str(), nullptr, 16);
            else
                subst.i = stoi(cmd_re[2].str());
            cur_env.GPR[reg_name.at(reg)] = subst.i;
        }
        // レジスタ代入 浮動小数
        else if (regex_match(cmd, cmd_re, std::regex("^regfin (.+?) ([0-9A-Fa-f\\.]+)\\s?(.*?)\n?$")))
        {
            reg = cmd_re[1].str();
            base = cmd_re[3].str();
            if (base == "hex" || base == "16")
                subst.i = stoi(cmd_re[2].str(), nullptr, 16);
            else
                subst.f = stof(cmd_re[2].str());
            cur_env.FPR[reg_name.at(reg) - 32] = subst.f;
        }
        else if (cmd == "pr\n")
            print_state();
        else if (cmd == "ps\n")
            print_stats();
        else if (cmd == "pls\n")
            print_label_stats();
        else if (cmd == "nopfs\n")
            *is_stat = false;
        else if (cmd == "pb\n")
            *print_bc = true;
        else if (cmd == "endpb\n")
            *print_bc = false;
        else if (cmd == "pc\n")
            *print_calc = true;
        else if (cmd == "endpc\n")
            *print_calc = false;
        else if (cmd == "pp\n")
            *print_process = true;
        else if (cmd == "endpp\n")
            *print_process = false;
        else if (cmd == "pi\n")
        {
            for (int i = 0; i < in_bytes.size(); i++)
                std::cout << std::bitset<8>(in_bytes[i]) << std::endl;
        }
        else if (cmd == "r\n")
        {
            *loop = -1;
            break;
        }
        else if (cmd == "h\n")
        {
            printf("please read README.md\n");
        }
        else if (cmd == "exit\n")
            return 1;
        else if (cmd == "\n")
            ;
        else
            printf("command not found\n");
    }
    return 0;
}