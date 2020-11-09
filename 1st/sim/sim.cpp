#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <map>
#include <vector>
#include <errno.h>
#include <unistd.h>
#include <math.h>
#include "sim.h"
#include "exec_op.h"
#include "load_op.h"
#include "myutil.h"

int cur_opnum;
int initialize_end;
int global_start;
std::vector<op_info> ops;
core_env cur_env;
std::map<std::string, int> label_pos;
unsigned int *stack = (unsigned int *)malloc(sizeof(unsigned int) * 1000000);
int exec_step(bool print_process);

int main(int argc, char *argv[])
{
    int opt;
    bool is_step = false;
    bool is_stat = false;
    bool print_process = false;
    std::string n = "fib";

    while ((opt = getopt(argc, argv, "scpn:")) != -1)
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

        case 'n':
            n = optarg;
            break;

        default:
            printf("Usage: %s [-s] [-c] [-p] [-n argment] \n", argv[0]);
            break;
        }
    }

    FILE *fp;
    std::string cmd;
    std::smatch cmd_re;
    std::string file_name;
    int end;
    int errno;
    int line = 0;
    int loop = 0;
    char buf[256];

    cur_env.PC = 0;
    // 事前に行数取得
    file_name = "assembly/" + n + ".s";
    if ((fp = fopen(file_name.c_str(), "r")) == NULL)
        perror("fopen error");

    while (fgets(buf, 256, fp) != NULL)
        line++;

    fclose(fp);

    if ((fp = fopen(file_name.c_str(), "r")) == NULL)
        perror("fopen error");

    // 命令のパース
    if ((end = load_ops(fp)) == 0)
        return 0;

    fclose(fp);
    // stackはとりあえず100万要素確保
    // (2020/11/08) アセンブリの方で最初に確保するようになったのでこの処理は不要
    // cur_env.GPR[reg_name.at("%sp")] = 4000000;

    cur_opnum = 0;

    // step実行
    while (cur_opnum < end)
    {
        if (cur_opnum == initialize_end)
            cur_opnum = global_start;

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
    printf("register state\n");
    print_state(cur_env);
    printf("v0: %d\n", cur_env.GPR[reg_name.at("%v0")]);
    printf("f0: %f\n", cur_env.FPR[reg_name.at("%f0") - 32]);
    if (is_stat)
    {
        printf("\ninstruction statistics\n");
        print_stats();
    }
    free(stack);
    return 0;
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
