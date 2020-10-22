#pragma once
#include <string>
#include <map>

// レジスタなどのコアの内部環境の保持
typedef struct
{
    int PC;
    unsigned int GPR[32];
    float FPR[32];
    char FPCC[9];
    unsigned int *DAT;
    int PJ;
} core_env;

// アセンブリを1行ごとにパースしてこの命令フォーマットに変換する
typedef struct
{
    int type; // op = 0, label = 1, other = 2
    int opland_num;
    int offset;
    std::string opland[3];
    std::string opcode;
    std::string label;
    std::string other;
} op_info;

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
    {"%fp", 29},
    {"%sp", 30},
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
    {"addi", 0},
    {"bgt", 0},
    {"j", 0},
    {"jal", 0},
    {"jr", 0},
    {"lw", 0},
    {"sw", 0},
    {"move", 0},
    {"total", 0}};