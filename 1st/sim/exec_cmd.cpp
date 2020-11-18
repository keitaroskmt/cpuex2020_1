#include <string>
#include <regex>
#include <stdio.h>
#include <map>
#include "sim.h"
#include "myutil.h"

int exec_cmd(int *loop, bool *is_stat, bool *print_bytecode, bool *print_calc, bool *print_process)
{
    std::string cmd;
    std::smatch cmd_re;
    std::string reg;
    int sp;
    int j;
    int offset;
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
        else if (regex_match(cmd, cmd_re, std::regex("^stack (\\d+) (\\d+)\n?$")))
        {
            sp = stoi(cmd_re[1].str());
            j = stoi(cmd_re[2].str());

            for (int i = sp - 4 * j; i <= sp + 4 * j; i += 4)
                printf("stack[%d] = (hex) %08X\t(dec) %d\n", i, stack[i / 4], stack[i / 4]);
        }
        else if (regex_match(cmd, cmd_re, std::regex("^stack (-?\\d+)\\((.+?)\\) (\\d+)\n?$")))
        {
            offset = stoi(cmd_re[1].str());
            reg = cmd_re[2].str();
            sp = cur_env.GPR[reg_name.at(reg)] + offset;
            j = stoi(cmd_re[3].str());

            for (int i = sp - 4 * j; i <= sp + 4 * j; i += 4)
                printf("stack[%d] = (hex) %08X\t(dec) %d\n", i, stack[i / 4], stack[i / 4]);
        }
        else if (cmd == "pr\n")
            print_state(cur_env);
        else if (cmd == "ps\n")
            print_stats();
        else if (cmd == "nopfs\n")
            *is_stat = false;
        else if (cmd == "pb\n")
            *print_bytecode = true;
        else if (cmd == "endpb\n")
            *print_bytecode = false;
        else if (cmd == "pc\n")
            *print_calc = true;
        else if (cmd == "endpc\n")
            *print_calc = false;
        else if (cmd == "pp\n")
            *print_process = true;
        else if (cmd == "endpp\n")
            *print_process = false;
        else if (cmd == "r\n")
        {
            *loop = -1;
            break;
        }
        else if (cmd == "h\n")
        {
            printf("1 step: 's', Nstep: 'Ns'(N=int), run all: 'r', print reg: 'pr'\n");
            printf("print stat: 'ps', (end) print process: '(end)pp'\n");
            printf("no print final stat: 'nopfs', print stack[N]: 'stack N k'\n");
            printf("print stack[n(%%reg)]: 'stack n(%%reg) k', (end) print culc: '(end)pc'\nexit: 'exit'\n");
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