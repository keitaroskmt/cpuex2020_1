#include <stdio.h>
#include <string>
#include <map>
#include <errno.h>
#include "sim.h"
#include "myutil.h"

// レジスタの状態を出力する
void print_state(core_env env)
{
    printf("%d\t", env.PC);
    printf("GPR\n0-3\t%d\t%d\t%d\t%d\n4-7\t%d\t%d\t%d\t%d\n8-11\t%d\t%d\t%d\t%d\n12-15\t%d\t%d\t%d\t%d\n16-19\t%d\t%d\t%d\t%d\n20-23\t%d\t%d\t%d\t%d\n24-27\t%d\t%d\t%d\t%d\n28-31\t%d\t%X\t%X\t%d\nFPR FPCC: %s\n0-3\t%f\t%f\t%f\t%f\n4-7\t%f\t%f\t%f\t%f\n8-11\t%f\t%f\t%f\t%f\n12-15\t%f\t%f\t%f\t%f\n16-19\t%f\t%f\t%f\t%f\n20-23\t%f\t%f\t%f\t%f\n24-27\t%f\t%f\t%f\t%f\n28-31\t%f\t%f\t%f\t%f\n\n", env.GPR[0], env.GPR[1], env.GPR[2], env.GPR[3], env.GPR[4], env.GPR[5], env.GPR[6], env.GPR[7], env.GPR[8], env.GPR[9], env.GPR[10], env.GPR[11], env.GPR[12], env.GPR[13], env.GPR[14], env.GPR[15], env.GPR[16], env.GPR[17], env.GPR[18], env.GPR[19], env.GPR[20], env.GPR[21], env.GPR[22], env.GPR[23], env.GPR[24], env.GPR[25], env.GPR[26], env.GPR[27], env.GPR[28], env.GPR[29], env.GPR[30], env.GPR[31], env.FPCC, env.FPR[0], env.FPR[1], env.FPR[2], env.FPR[3], env.FPR[4], env.FPR[5], env.FPR[6], env.FPR[7], env.FPR[8], env.FPR[9], env.FPR[10], env.FPR[11], env.FPR[12], env.FPR[13], env.FPR[14], env.FPR[15], env.FPR[16], env.FPR[17], env.FPR[18], env.FPR[19], env.FPR[20], env.FPR[21], env.FPR[22], env.FPR[23], env.FPR[24], env.FPR[25], env.FPR[26], env.FPR[27], env.FPR[28], env.FPR[29], env.FPR[30], env.FPR[31]);
    return;
}

// 命令実行数を出力する
void print_stats()
{
    for (auto itr = op_counter.begin(); itr != op_counter.end(); ++itr)
    {
        printf("%s:\t%d\n", (itr->first).c_str(), itr->second);
    }
    return;
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
    {"%gp", 28},
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
    {"%f31", 63}};

// 命令の実行数を保持する
std::map<std::string, int> op_counter = {
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
    {"total", 0}};
