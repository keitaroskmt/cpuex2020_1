#include <math.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <map>
#include "exec_op.h"
#include "sim.h"
#include "myutil.h"
#include "file_io.h"

// 1命令実行する
int exec_op(op_info op, bool print_calc)
{
    int rs, rt, rd, imm, sp;
    unsigned char temp;
    union
    {
        float f;
        int i;
    } frs, frt, frd;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs + rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("add\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sub")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs - rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("sub\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "and")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs & rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("and\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "or")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs | rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("or\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "nor")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = ~(rs | rt);
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("nor\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "slt")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        if (rs < rt)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("slt\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sll")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rt << imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("sll\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "srl")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rt >> imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("srl\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "bgt")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs > rt)
            cur_opnum = op.opland_bit[2];

        if (print_calc)
            printf("bgt\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "jr")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        if (op.opland_bit[0] == 31)
            cur_opnum = posbc2pos[rs - 1];
        else
            cur_opnum = rs - 1;
    }
    else if (op.opcode == "move")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        cur_env.GPR[op.opland_bit[0]] = rt;
    }
    else if (op.opcode == "j")
    {
        cur_opnum = op.opland_bit[0] - 1;
    }
    else if (op.opcode == "jal")
    {
        cur_env.GPR[31] = op.op_idx + 1;
        cur_opnum = op.opland_bit[0] - 1;
    }
    else if (op.opcode == "jalr")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        cur_env.GPR[31] = op.op_idx + 1;
        cur_opnum = rs - 1;
    }
    else if (op.opcode == "beq")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs == rt)
            cur_opnum = op.opland_bit[2] - 1;

        if (print_calc)
            printf("beq\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "bne")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs != rt)
            cur_opnum = op.opland_bit[2] - 1;

        if (print_calc)
            printf("bne\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rs + imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("addi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "slti")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        if (rs < imm)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("slti\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "andi")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rs & imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("andi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "ori")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rs | imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("ori\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "lui")
    {
        imm = op.opland_bit[1];
        rd = imm << 16;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("lui\t%d(%08X),\t%d(%08X)\n", rd, rd, imm, imm);
    }
    else if (op.opcode == "lw")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        sp = rs + op.offset;
        rd = stack[sp / 4];
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("lw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rd, rd, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "sw")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        sp = rt + op.offset;
        rs = cur_env.GPR[op.opland_bit[0]];
        stack[sp / 4] = rs;

        if (print_calc)
            printf("sw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rs, rs, op.offset, op.offset, rt, rt, sp, sp);
    }
    else if (op.opcode == "in")
    {
        if (cur_in == in_bytes.size())
        {
            printf("too many in inst\n");
            return 1;
        }
        rt = cur_env.GPR[op.opland_bit[0]];
        rt = rt & 0xFFFFFF00;
        rs = in_bytes[cur_in] & 0xFF;
        cur_env.GPR[op.opland_bit[0]] = rt + rs;
        cur_in++;
    }
    else if (op.opcode == "out")
    {
        rt = cur_env.GPR[op.opland_bit[0]];
        temp = rt & 0xFF;
        out_bytes.push_back(temp);
    }
    else if (op.opcode == "fadd")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        frd.f = frs.f + frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fadd\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsub")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        frd.f = frs.f - frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fsub\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fmul")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        frd.f = frs.f * frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fmul\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fdiv")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        frd.f = frs.f / frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fdiv\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fneg")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        frd.f = -frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fneg\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fabs")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frt.f < 0)
            frd.f = -frt.f;
        else
            frd.f = frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fabs\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsqrt")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        frd.f = sqrtf(frt.f);
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("fsqrt\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fslt")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        if (frs.f < frt.f)
            rd = 1;
        else
            rd = 0;
        cur_env.GPR[op.opland_bit[0]] = rd;

        if (print_calc)
            printf("fslt\t%d(%08X),\t%f(%08X),\t%f(%08X)\n", rd, rd, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fbeq")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f == frt.f)
            cur_opnum = op.opland_bit[2] - 1;

        if (print_calc)
            printf("fbeq\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "fbne")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f != frt.f)
            cur_opnum = op.opland_bit[2] - 1;

        if (print_calc)
            printf("fbne\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "fbgt")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f > frt.f)
            cur_opnum = op.opland_bit[2] - 1;

        if (print_calc)
            printf("fbgt\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "flw")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        sp = rs + op.offset;
        frd.i = stack[sp / 4];
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        if (print_calc)
            printf("lw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frd.f, frd.i, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "fsw")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        sp = rt + op.offset;
        frs.f = cur_env.FPR[op.opland_bit[0]];
        stack[sp / 4] = frs.i;

        if (print_calc)
            printf("sw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frs.f, frs.i, op.offset, op.offset, rt, rt, sp, sp);
    }
    else if (op.opcode == "ftoi")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        rt = frs.i;
        cur_env.GPR[op.opland_bit[0]] = rt;

        if (print_calc)
            printf("ftoi\t%d(%08X),\t%f(%08X)\n", rt, rt, frs.f, frs.i);
    }
    else if (op.opcode == "itof")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        frt.i = rs;
        cur_env.FPR[op.opland_bit[0]] = frt.f;

        if (print_calc)
            printf("itof\t%f(%08X),\t%d(%08X)\n", frt.f, frt.i, rs, rs);
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