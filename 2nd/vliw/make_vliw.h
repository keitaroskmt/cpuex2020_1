#pragma once

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
    bool slot_1;
    bool slot_2;
    bool slot_3;
    bool slot_4;
    bool assigned;
    bool jump;
    bool truejump;
    std::string opland[3];
    std::string opcode;
    std::string label;
    std::string other;
    std::string dest_reg;
    std::string src_reg1;
    std::string src_reg2;
    std::string op_str;
} op_info;

extern std::vector<op_info> ops;
extern std::vector<std::vector<op_info>> vliw_ops;
extern std::vector<std::vector<op_info>> vliw_ops_stable;