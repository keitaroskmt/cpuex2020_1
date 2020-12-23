#include <stdio.h>
#include <string>
#include <map>
#include <vector>
#include <errno.h>
#include <time.h>
#include "myutil.h"
#include "sim.h"

// レジスタの状態を出力する
void print_state()
{
    printf("PC: %llu\nGPR\n", cur_env.PC);
    for (int i = 0; i < 32; i += 4)
    {
        printf("%d-%d\t%d\t%d\t%d\t%d\n", i, i + 3, cur_env.REG[i].i, cur_env.REG[i + 1].i, cur_env.REG[i + 2].i, cur_env.REG[i + 3].i);
    }
    printf("\nFPR FPCC: %s\n", cur_env.FPCC);
    for (int i = 32; i < 64; i += 4)
    {
        printf("%d-%d\treal\t%f\t%f\t%f\t%f\n", i, i + 3, cur_env.REG[i].f, cur_env.REG[i + 1].f, cur_env.REG[i + 2].f, cur_env.REG[i + 3].f);
        printf("\thex\t%08X\t%08X\t%08X\t%08X\n", cur_env.REG[i].i, cur_env.REG[i + 1].i, cur_env.REG[i + 2].i, cur_env.REG[i + 3].i);
    }
    printf("\n");
    return;
}

// 命令実行数を出力する
void print_stats()
{
    printf("\ninstruction statistics\n");
    for (auto itr = op_counter.begin(); itr != op_counter.end(); ++itr)
    {
        // 使った命令だけを表示
        if (itr->second != 0)
            printf("%s:\t%lld\n", (itr->first).c_str(), itr->second);
    }
    return;
}
void print_label_stats()
{
    printf("\nlabel statistics\n");
    for (auto itr = label_counter.begin(); itr != label_counter.end(); ++itr)
    {
        // 使った命令だけを表示
        if (itr->second != 0)
            printf("%s:\t%lld\n", (itr->first).c_str(), itr->second);
    }
    return;
}

void print_time(clock_t start_time)
{
    clock_t end_time = clock();
    const double time = static_cast<double>(end_time - start_time) / CLOCKS_PER_SEC * 1000.0;
    fprintf(stderr, "time %.1lf[s]\n", time / 1000);
}

// step実行時のコマンド取得
std::string get_line(int size)
{

    printf("cmd(help:'h'):");
    char s[size];

    while (fgets(s, size, stdin) == NULL)
    {
        if (errno == EINTR)
            continue;
        return NULL;
    }
    std::string str = s;

    return str;
}

bool isnum(std::string s)
{
    for (int i = 0; i < (int)s.size(); ++i)
    {
        if (i == 0 && s[i] == '-')
            continue;
        if (!('0' <= s[i] && s[i] <= '9'))
            return false;
    }
    return true;
}

// レジスタ名を番号に変換する
const std::map<std::string, int> reg_name = {
    {"%zero", 0},
    {"%at", 1},
    {"%v0", 2},
    {"%v1", 3},
    {"%a0", 4},
    {"%a1", 5},
    {"%a2", 6},
    {"%a3", 7},
    {"%t0", 8},
    {"%t1", 9},
    {"%t2", 10},
    {"%t3", 11},
    {"%t4", 12},
    {"%t5", 13},
    {"%t6", 14},
    {"%t7", 15},
    {"%s0", 16},
    {"%s1", 17},
    {"%s2", 18},
    {"%s3", 19},
    {"%s4", 20},
    {"%s5", 21},
    {"%s6", 22},
    {"%s7", 23},
    {"%t8", 24},
    {"%t9", 25},
    {"%k0", 26},
    {"%k1", 27},
    {"%hp", 28},
    {"%sp", 29},
    {"%fp", 30},
    {"%ra", 31},
    {"%f0", 32},
    {"%f1", 33},
    {"%f2", 34},
    {"%f3", 35},
    {"%f4", 36},
    {"%f5", 37},
    {"%f6", 38},
    {"%f7", 39},
    {"%f8", 40},
    {"%f9", 41},
    {"%f10", 42},
    {"%f11", 43},
    {"%f12", 44},
    {"%f13", 45},
    {"%f14", 46},
    {"%f15", 47},
    {"%f16", 48},
    {"%f17", 49},
    {"%f18", 50},
    {"%f19", 51},
    {"%f20", 52},
    {"%f21", 53},
    {"%f22", 54},
    {"%f23", 55},
    {"%f24", 56},
    {"%f25", 57},
    {"%f26", 58},
    {"%f27", 59},
    {"%f28", 60},
    {"%f29", 61},
    {"%f30", 62},
    {"%fzero", 63},
    {"%g0", 64}};

// 命令の実行数を保持する
std::map<std::string, long long int> op_counter = {
    {"add", 0},
    {"sub", 0},
    {"and", 0},
    {"or", 0},
    {"nor", 0},
    {"slt", 0},
    {"sll", 0},
    {"srl", 0},
    {"bgt", 0},
    {"jr", 0},
    {"move", 0},
    {"j", 0},
    {"jal", 0},
    {"jalr", 0},
    {"beq", 0},
    {"bne", 0},
    {"addi", 0},
    {"slti", 0},
    {"andi", 0},
    {"ori", 0},
    {"lui", 0},
    {"lw", 0},
    {"sw", 0},
    {"in", 0},
    {"out", 0},
    {"fadd", 0},
    {"fsub", 0},
    {"fmul", 0},
    {"fdiv", 0},
    {"fneg", 0},
    {"fabs", 0},
    {"fsqrt", 0},
    {"fslt ", 0},
    {"fbeq", 0},
    {"fbne", 0},
    {"fbgt", 0},
    {"flw", 0},
    {"fsw", 0},
    {"ftoi", 0},
    {"itof", 0},
    {"in", 0},
    {"out", 0},
    {"total", 0}};
