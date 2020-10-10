#pragma once
#include <string>
using namespace std;

typedef struct
{
    int PC;
    unsigned int GPR[32];
    float FPR[32];
    char FPCC[9];
    unsigned int *DAT;
    int PJ;
} core_env;

typedef struct
{
    int type; // op = 0, label = 1, other = 2
    int opland_num;
    string opland[3];
    string opcode;
    string label;
    string other;
} op_info;