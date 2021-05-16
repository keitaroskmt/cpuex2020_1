#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <regex>
#include <utility>
#include <map>
#include <vector>
#include <errno.h>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include <iostream>
#include "sim.h"
#include "exec_op.h"
#include "load_op.h"
#include "myutil.h"
#include "exec_cmd.h"
#include "file_io.h"
#include "print_bytecode.h"
#include "ftable.h"
#include "fpu.h"

int cur_opnum, cur_in;
std::vector<op_info> ops;
core_env cur_env;
std::map<std::string, int> label_pos, label_pos_bc;
std::map<std::string, long long int> label_counter;
std::map<int, int> posbc2pos, pos2posbc;
std::vector<std::pair<int, unsigned long long int>> stack(1000000, std::make_pair(0, 0));
int exec_step(bool print_process, bool print_calc, bool print_bytecode, bool label_count, bool use_fpu, bool vliw);

int main(int argc, char *argv[])
{
    clock_t start_time = clock();
    int opt;
    bool is_step = false;
    bool is_stat = true;
    bool print_process = false;
    bool print_calc = false;
    bool print_bc = false;
    bool mandelbrot = false;
    bool label_count = false;
    bool is_in = false;
    bool is_out = false;
    bool debug_mode = false;
    bool use_fpu = false;
    bool vliw = false;
    std::string n = "fib";
    std::string infile = "sin.txt";
    std::string outfile = "out.txt";
    std::string datafile = "data/";

    while ((opt = getopt(argc, argv, "sbcpn:i:o:mdlfva")) != -1)
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
            outfile = optarg;
            break;

        case 'm':
            mandelbrot = true;
            break;

        case 'd':
            debug_mode = true;
            break;

        case 'l':
            label_count = true;
            break;

        case 'f':
            use_fpu = true;
            break;

        case 'v':
            vliw = true;
            break;

        case 'a':
            vliw = true;
            use_fpu = true;
            is_step = true;
            break;

        default:
            printf("Usage: %s [-s] [-b] [-c] [-p] [-n arg] [-i arg] [-o arg]\n", argv[0]);
            break;
        }
    }

    FILE *fp;

    std::string file_name;
    int end;
    int errno;
    int line = 0;
    int loop = 0;
    int max_sp = 0;
    int max_hp = 0;
    int loop_unit = (vliw) ? 4 : 1;
    char buf[256];

    cur_env.PC = 0;
    // 事前に行数取得
    file_name = "assembly/" + n + ".s";
    if ((fp = fopen(file_name.c_str(), "r")) == NULL)
    {
        perror("fopen error");
        return 1;
    }

    while (fgets(buf, 256, fp) != NULL)
        line++;

    fclose(fp);

    if ((fp = fopen(file_name.c_str(), "r")) == NULL)
    {
        perror("fopen error");
        return 1;
    }

    // 命令のパース
    if ((end = load_ops(fp)) == 0)
        return 0;

    fclose(fp);

    if (use_fpu)
        ftable_init();

    // sldファイルの読み込み
    if (is_in)
    {
        infile = "io/in/" + infile;
        if (read_file(infile))
            return 1;
    }

    cur_opnum = 0;
    cur_in = 0;

    datafile = datafile + n + "_data.mem";
    data_load(datafile);

    // step実行
    while (cur_opnum < end)
    {
        if (is_step && loop == 0)
            // コマンド受付 & 実行
            if (exec_cmd(&loop, &is_stat, &print_bc, &print_calc, &print_process, &vliw))
                return 0;

        if ((print_bc || print_process || print_calc) && (loop % loop_unit == 0) && vliw)
            printf("%lld\t%d\n", cur_env.PC / 4, ops[cur_opnum].op_idx / 4);

        if (exec_step(print_process, print_calc, print_bc, label_count, use_fpu, vliw))
            break;

        if ((print_bc || print_process || print_calc) && (loop - 1) % loop_unit == 0)
            printf("\n");

        if (ops[cur_opnum].type == 0)
        {
            if (debug_mode)
            {
                if (cur_env.PC && cur_env.PC % 1000000000 == 0)
                    std::cout << cur_env.PC / 1000000000 << "G..." << std::flush;
                if (cur_env.GPR[29] > max_sp)
                    max_sp = cur_env.GPR[29];
                if (cur_env.GPR[28] > max_hp)
                    max_hp = cur_env.GPR[28];
            }
            loop--;
        }
    }

    printf("register state\n");
    print_state(vliw);
    printf("v0: %d\n", cur_env.GPR[reg_name.at("%v0")]);
    printf("f0: %f\n", cur_env.FPR[reg_name.at("%f0") - 32]);
    if (is_stat)
        print_stats();
    if (label_count)
        print_label_stats();

    if (is_out)
        write_file("io/out/" + outfile, mandelbrot);

    if (debug_mode)
    {
        print_time(start_time);
        printf("max sp: %d\nmax hp %d\n", max_sp, max_hp);
    }

    return 0;
}

// 1step実行する 命令なら実行し、その他なら読み飛ばす
int exec_step(bool print_process, bool print_calc, bool print_bc, bool label_count, bool use_fpu, bool vliw)
{
    if (ops[cur_opnum].type == 0)
    {
        if (print_process)
            printf("%llu\t%d\t%s\t%s\t%s\t%s\t%d\n", cur_env.PC, ops[cur_opnum].op_idx, ops[cur_opnum].opcode.c_str(), ops[cur_opnum].opland[0].c_str(), ops[cur_opnum].opland[1].c_str(), ops[cur_opnum].opland[2].c_str(), ops[cur_opnum].offset);

        if (print_bc)
            print_bytecode(ops[cur_opnum], vliw);

        if (exec_op(ops[cur_opnum], print_calc, use_fpu, vliw))
            return 1;

        cur_env.PC++;
    }
    else if (ops[cur_opnum].type == 1)
    {
        std::string label = ops[cur_opnum].label;
        if (print_process)
            printf("%s:\n", label.c_str());
        if (label_count)
            label_counter[label]++;
    }
    cur_opnum++;
    return 0;
}