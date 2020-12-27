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
#include "reg_fetch.h"
#include "pipeline.h"

const pipereg_info NOP{0};
int cur_opnum, cur_in, stall;
bool flash;
std::vector<op_info> ops;
std::vector<pipereg_info> pipe_reg(6);
core_env cur_env;
std::map<std::string, int> label_pos, label_pos_bc;
std::map<std::string, long long int> label_counter;
std::map<int, int> posbc2pos, pos2posbc;
std::vector<std::pair<int, unsigned long long int>> stack(1000000, std::make_pair(0, 0));
int exec_step(bool print_process, bool print_calc, bool print_bytecode, bool label_count, bool use_fpu);
int exec_clock(bool print_process, bool print_calc, bool print_bc, bool label_count, bool use_fpu);

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
    std::string n = "fib";
    std::string infile = "sin.txt";
    std::string outfile = "out.txt";
    std::string datafile = "data/";

    while ((opt = getopt(argc, argv, "sbcpn:i:o:mdlf")) != -1)
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
    char buf[256];

    cur_env.PC = 0;
    cur_env.clk = 0;
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
    flash = false;

    datafile = datafile + n + "_data.mem";
    data_load(datafile);

    // step実行
    while (pipe_reg[5].op.opcode != "ret")
    {
        if (is_step && loop == 0)
            // コマンド受付 & 実行
            if (exec_cmd(&loop, &is_stat, &print_bc, &print_calc, &print_process))
                return 0;

        if (exec_clock(print_process, print_calc, print_bc, label_count, use_fpu))
            break;

        if (debug_mode)
        {
            if (cur_env.clk && cur_env.clk % 1000000000 == 0)
                std::cout << cur_env.clk / 1000000000 << "G..." << std::flush;
            if (cur_env.REG[29].i > max_sp)
                max_sp = cur_env.REG[29].i;
            if (cur_env.REG[28].i > max_hp)
                max_hp = cur_env.REG[28].i;
        }

        loop--;
        // for (int i = 0; i < 6; i++)
        //     std::cout << i << "\t" << pipe_reg[i].op.opcode << std::endl;
    }

    printf("register state\n");
    print_state();
    printf("v0: %d\n", cur_env.REG[reg_name.at("%v0")].i);
    printf("f0: %f\n", cur_env.REG[reg_name.at("%f0")].f);
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

int exec_clock(bool print_process, bool print_calc, bool print_bc, bool label_count, bool use_fpu)
{
    inst_terminate(print_process, print_calc, print_bc);
    write_back();
    memory_acc();
    exec_op(use_fpu);
    reg_fetch();
    inst_fetch(label_count);
    if (stall > 0)
        stall--;
    cur_env.clk++;
    return 0;
}
