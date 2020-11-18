#include <math.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <map>
#include "sim.h"
#include "myutil.h"

// 1命令実行する
int exec_op(op_info op, core_env env, std::map<std::string, int> label_pos, bool print_calc)
{
    int rs, rt, rd, imm, sp;
    union
    {
        float f;
        int i;
    } frs, frt, frd;
    std::string label;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        rd = rs + rt;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("add\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sub")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        rd = rs - rt;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("sub\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "and")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        rd = rs & rt;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("and\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "or")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        rd = rs | rt;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("or\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "nor")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        rd = ~(rs | rt);
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("nor\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "slt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        rt = cur_env.GPR[reg_name.at(op.opland[2])];
        if (rs < rt)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("slt\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sll")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        rd = rt << imm;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("sll\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "srl")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        rd = rt >> imm;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("srl\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "bgt")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs > rt)
            cur_opnum = label_pos[label];

        if (print_calc)
            printf("bgt\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, label.c_str());
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

        if (print_calc)
            printf("beq\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, label.c_str());
    }
    else if (op.opcode == "bne")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        label = op.opland[2];
        if (rs != rt)
            cur_opnum = label_pos[label] - 1;

        if (print_calc)
            printf("bne\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, label.c_str());
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        if (label_pos.find(op.opland[2]) != label_pos.end())
        {
            label = op.opland[2];
            imm = label_pos[label];
        }
        else
            imm = stoi(op.opland[2]);

        rd = rs + imm;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("addi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "slti")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        if (rs < imm)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("slti\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "andi")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        rd = rs & imm;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("andi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "ori")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        imm = stoi(op.opland[2]);
        rd = rs | imm;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("ori\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "lui")
    {
        imm = stoi(op.opland[1]);
        rd = imm << 16;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("lui\t%d(%08X),\t%d(%08X)\n", rd, rd, imm, imm);
    }
    else if (op.opcode == "lw")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        sp = rs + op.offset;
        rd = stack[sp / 4];
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("lw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rd, rd, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "sw")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        sp = rt + op.offset;
        rs = cur_env.GPR[reg_name.at(op.opland[0])];
        stack[sp / 4] = rs;

        if (print_calc)
            printf("sw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rs, rs, op.offset, op.offset, rt, rt, sp, sp);
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
        frs.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        frd.f = frs.f + frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fadd\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsub")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        frd.f = frs.f - frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fsub\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fmul")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        frd.f = frs.f * frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fmul\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fdiv")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        frd.f = frs.f / frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fdiv\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fneg")
    {
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frd.f = -frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fneg\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fabs")
    {
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        if (frt.f < 0)
            frd.f = -frt.f;
        else
            frd.f = frt.f;
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fabs\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsqrt")
    {
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frd.f = sqrtf(frt.f);
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("fsqrt\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fslt")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[2]) - 32];
        if (frs.f < frt.f)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[reg_name.at(op.opland[0])] = rd;

        if (print_calc)
            printf("fslt\t%d(%08X),\t%f(%08X),\t%f(%08X)\n", rd, rd, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fbeq")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs.f == frt.f)
            cur_opnum = label_pos[label] - 1;

        if (print_calc)
            printf("fbeq\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, label.c_str());
    }
    else if (op.opcode == "fbne")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs.f != frt.f)
            cur_opnum = label_pos[label] - 1;

        if (print_calc)
            printf("fbne\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, label.c_str());
    }
    else if (op.opcode == "fbgt")
    {
        frs.f = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        frt.f = cur_env.FPR[reg_name.at(op.opland[1]) - 32];
        label = op.opland[2];
        if (frs.f > frt.f)
            cur_opnum = label_pos[label];

        if (print_calc)
            printf("fbgt\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, label.c_str());
    }
    else if (op.opcode == "flw")
    {
        rs = cur_env.GPR[reg_name.at(op.opland[1])];
        sp = rs + op.offset;
        frd.i = stack[sp / 4];
        cur_env.FPR[reg_name.at(op.opland[0]) - 32] = frd.f;

        if (print_calc)
            printf("lw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frd.f, frd.i, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "fsw")
    {
        rt = cur_env.GPR[reg_name.at(op.opland[1])];
        sp = rt + op.offset;
        frs.f = cur_env.FPR[reg_name.at(op.opland[0]) - 32];
        stack[sp / 4] = frs.i;

        if (print_calc)
            printf("sw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frs.f, frs.i, op.offset, op.offset, rt, rt, sp, sp);
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