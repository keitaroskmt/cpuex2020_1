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
#include "exec_cmd.h"
#include "file_io.h"
#include "print_bytecode.h"

int cur_opnum, cur_in;
std::vector<op_info> ops;
core_env cur_env;
std::map<std::string, int> label_pos, label_pos_bc;
int *stack = (int *)malloc(sizeof(int) * 1000000);
int exec_step(bool print_process, bool print_calc, bool print_bytecode);

int main(int argc, char *argv[])
{
    int opt;
    bool is_step = false;
    bool is_stat = true;
    bool print_process = false;
    bool print_calc = false;
    bool print_bc = false;
    bool mandelbrot = false;
    bool is_in = false;
    bool is_out = false;
    std::string n = "fib";
    std::string infile = "ball";

    while ((opt = getopt(argc, argv, "sbcpn:i:om")) != -1)
    {
        switch (opt)
        {
        case 's':
            is_step = true;
            break;

        case 'c':
            print_calc = true;
            break;

        case 'b':
            print_bc = true;
            break;

        case 'p':
            print_process = true;
            break;

        case 'n':
            n = optarg;
            break;

        case 'i':
            is_in = true;
            infile = optarg;
            break;

        case 'o':
            is_out = true;
            break;

        case 'm':
            mandelbrot = true;
            break;

        default:
            printf("Usage: %s [-s] [-b] [-c] [-p] [-n arg] [-i arg] [-o]\n", argv[0]);
            break;
        }
    }

    FILE *fp;

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

    // sldファイルの読み込み
    if (is_in)
    {
        infile = "io/in/" + infile;
        read_file(infile);
    }

    cur_opnum = 0;
    cur_in = 0;

    // step実行
    while (cur_opnum < end)
    {
        if (is_step && loop == 0)
            // コマンド受付 & 実行
            if (exec_cmd(&loop, &is_stat, &print_bc, &print_calc, &print_process))
                return 0;

        if (exec_step(print_process, print_calc, print_bc))
            break;

        if (ops[cur_opnum].type == 0)
            loop--;
    }

    printf("register state\n");
    print_state();
    printf("v0: %d\n", cur_env.GPR[reg_name.at("%v0")]);
    printf("f0: %f\n", cur_env.FPR[reg_name.at("%f0") - 32]);
    if (is_stat)
    {
        printf("\ninstruction statistics\n");
        print_stats();
    }
    free(stack);
    if (is_out)
        write_file("io/out/out.txt", mandelbrot);

    return 0;
}

// 1step実行する 命令なら実行し、その他なら読み飛ばす
int exec_step(bool print_process, bool print_calc, bool print_bc)
{
    if (ops[cur_opnum].type == 0)
    {
        if (print_process)
            printf("%d\t%d\t%s\t%s\t%s\t%s\t%d\n", cur_env.PC, 4 * ops[cur_opnum].op_idx, ops[cur_opnum].opcode.c_str(), ops[cur_opnum].opland[0].c_str(), ops[cur_opnum].opland[1].c_str(), ops[cur_opnum].opland[2].c_str(), ops[cur_opnum].offset);

        if (print_bc)
            print_bytecode(ops[cur_opnum]);

        if (exec_op(ops[cur_opnum], print_calc))
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