#pragma once

typedef union
{
    float f;
    int i;
} fi;

// レジスタなどのコアの内部環境の保持
typedef struct
{
    unsigned long long int PC;
    unsigned long long int clk;
    fi REG[64];
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
    int opnum;
    int offset;
    int opland_bit[3];
    int label_num;
    bool wb;
    bool store;
    bool load;
    bool j;
    bool jr;
    bool jal;
    bool fwi;
    bool is_imm;
    bool comp;
    int source_type; // gpr2 = 0, fpr2 = 1, gpr1 = 2, fpr1 = 3
    std::string opland[3];
    std::string opcode;
    std::string label;
    std::string other;
} op_info;

typedef struct
{
    unsigned long long PC;
    op_info op;
    char fw1; // s1はフォワーディングされる値か?
    char fw2; // s2はフォワーディングされる値か?
    char fm;  // s2はフォワーディングされる値か?
    char ex_clk;
    int imm;
    fi s1, s2, d; // 計算に使うやつ
    fi m;         // メモリに読み書きするもの
    std::string calc;
} pipereg_info;

extern int cur_opnum, cur_in, stall;
extern bool flash;
extern std::vector<op_info> ops;
extern core_env cur_env;
extern std::map<std::string, int> label_pos, label_pos_bc;
extern std::map<std::string, long long int> label_counter;
extern std::map<int, int> posbc2pos, pos2posbc;
extern std::vector<std::pair<int, unsigned long long int>> stack;
extern const pipereg_info NOP;
extern std::vector<pipereg_info> pipe_reg;