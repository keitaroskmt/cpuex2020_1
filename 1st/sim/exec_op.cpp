#include <math.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <map>
#include "sim.h"
#include "myutil.h"

// 1命令実行する
int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos)
{
    int rs, rt, imm, sp;
    float frs, frt;
    union
    {
        float f;
        int i;
    } fi;
    std::string label;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rs + rt;
    }
    else if (op.opcode == "sub")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rs - rt;
    }
    else if (op.opcode == "and")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rs & rt;
    }
    else if (op.opcode == "or")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rs | rt;
    }
    else if (op.opcode == "nor")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        cur_env.GPR[reg_name.at(op.opland[0])] = ~(rs | rt);
    }
    else if (op.opcode == "slt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        if (rs < rt)
            cur_env.GPR[reg_name.at(op.opland[0])] = 1;
        else
            cur_env.GPR[reg_name.at(op.opland[0])] = 0;
    }
    else if (op.opcode == "sll")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name.at(op.opland[0])] = rt << imm;
    }
    else if (op.opcode == "srl")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name.at(op.opland[0])] = rt >> imm;
    }
    else if (op.opcode == "bgt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs > rt)
            cur_opnum = label_pos[label];
    }
    else if (op.opcode == "jr")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        cur_opnum = rs - 1;
    }
    else if (op.opcode == "move")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        cur_env.GPR[reg_name.at(op.opland[0])] = rt;
    }
    else if (op.opcode == "j")
    {
        label = op.opland[0];
        cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "jal")
    {
        label = op.opland[0];
        cur_env.GPR[31] = cur_opnum + 1;
        cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "jalr")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        cur_env.GPR[31] = cur_opnum + 1;
        cur_opnum = rs - 1;
    }
    else if (op.opcode == "beq")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs == rt)
            cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "bne")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs != rt)
            cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        if (label_pos.find(op.opland[2]) != label_pos.end())
        {
            label = label = op.opland[2];
            cur_env.GPR[reg_name.at(op.opland[0])] = rs + label_pos[label];
        }
        else
        {
            imm = stoi(op.opland[2]);
            cur_env.GPR[reg_name.at(op.opland[0])] = rs + imm;
        }
    }
    else if (op.opcode == "slti")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        if (rs < imm)
            cur_env.GPR[reg_name.at(op.opland[0])] = 1;
        else
            cur_env.GPR[reg_name.at(op.opland[0])] = 0;
    }
    else if (op.opcode == "andi")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name.at(op.opland[0])] = rs & imm;
    }
    else if (op.opcode == "ori")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        cur_env.GPR[reg_name.at(op.opland[0])] = rs | imm;
    }
    else if (op.opcode == "lui")
    {
        imm = stoi(op.opland[1]);
        cur_env.GPR[reg_name.at(op.opland[0])] = imm << 16;
    }
    else if (op.opcode == "lw")
    {
        sp = cur_env.GPR[reg_name.at(op.opland[1])] + op.offset;
        cur_env.GPR[reg_name.at(op.opland[0])] = stack[sp / 4];
    }
    else if (op.opcode == "sw")
    {
        sp = cur_env.GPR[reg_name.at(op.opland[1])] + op.offset;
        stack[sp / 4] = cur_env.GPR[reg_name.at(op.opland[0])];
    }
    else if (op.opcode == "in")
    {
        // cur_env.GPR[reg_name.at(op.opland[0])] = 'hogehoge'; // 何かしら書く
    }
    else if (op.opcode == "out")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[0])];
        // "hogehoge" = rt; // 何かしら書く
    }
    else if (op.opcode == "fadd")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frs + frt;
    }
    else if (op.opcode == "fsub")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frs - frt;
    }
    else if (op.opcode == "fmul")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frs * frt;
    }
    else if (op.opcode == "fdiv")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frs / frt;
    }
    else if (op.opcode == "fneg")
    {
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = -frt;
    }
    else if (op.opcode == "fabs")
    {
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        if (frt < 0)
            cur_env.FPR[reg_name.at(op.opland[0]) - 32] = -frt;
        else
            cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frt;
    }
    else if (op.opcode == "fsqrt")
    {
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = sqrtf(frt);
    }
    else if (op.opcode == "fslt")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        if (frs < frt)
            cur_env.GPR[reg_name.at(op.opland[0])] = 1;
        else
            cur_env.GPR[reg_name.at(op.opland[0])] = 0;
    }
    else if (op.opcode == "fbeq")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs == frt)
            cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "fbne")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs != frt)
            cur_opnum = label_pos[label] - 1;
    }
    else if (op.opcode == "fbgt")
    {
        frs = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs > frt)
            cur_opnum = label_pos[label];
    }
    else if (op.opcode == "flw")
    {
        sp = cur_env.GPR[reg_name.at(op.opland[1])] + op.offset;
        fi.i = stack[sp / 4];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = fi.f;
    }
    else if (op.opcode == "fsw")
    {
        sp = cur_env.GPR[reg_name.at(op.opland[1])] + op.offset;
        fi.f = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        stack[sp / 4] = fi.i;
    }
    else if (op.opcode == "ret")
    {
        return 1;
    }
    else if (op.opcode == "nop")
    {
        ;
    }
    // 例外処理
    else
    {
        printf("%s is not supported\n", op.opcode.c_str());
        return 1;
    }
    op_counter[op.opcode] += 1;
    op_counter["total"] += 1;
    return 0;
}