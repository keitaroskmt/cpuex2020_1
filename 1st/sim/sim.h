#pragma once

// レジスタなどのコアの内部環境の保持
typedef struct
{
    int PC;
    int GPR[32];
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
    int op_idx;
    int offset;
    int opland_bit[3];
    int label_num;
    std::string opland[3];
    std::string opcode;
    std::string label;
    std::string other;
} op_info;

extern int cur_opnum, cur_in;
extern std::vector<op_info> ops;
extern core_env cur_env;
extern std::map<std::string, int> label_pos, label_pos_bc;
extern int *stack;