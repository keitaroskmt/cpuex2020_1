#include <math.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <map>
#include "exec_op.h"
#include "sim.h"
#include "myutil.h"
#include "file_io.h"
#include "fpu.h"

// 1命令実行する
int exec_op(op_info op, bool print_calc, bool use_fpu)
{
    int rs, rt, rd, imm, sp;
    unsigned char temp;
    fi frs, frt, frd;
    if (op.opcode == "add")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs + rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("add\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sub")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs - rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("sub\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "and")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs & rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("and\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "or")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = rs | rt;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("or\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "nor")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        rt = cur_env.GPR[op.opland_bit[2]];
        rd = ~(rs | rt);
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("nor\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "slt")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // rs = cur_env.GPR[op.opland_bit[1]];
        // rt = cur_env.GPR[op.opland_bit[2]];
        // if (rs < rt)
        //     rd = 1;
        // else
        //     rd = 0;
        // cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("slt\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, rt, rt);
    }
    else if (op.opcode == "sll")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rt << imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("sll\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "srl")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rt >> imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("srl\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rt, rt, imm, imm);
    }
    else if (op.opcode == "bgt")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // rs = cur_env.GPR[op.opland_bit[0]];
        // rt = cur_env.GPR[op.opland_bit[1]];
        // if (rs > rt)
        //     cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("bgt\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "blt")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs < rt)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("blt\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "blti")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        imm = op.opland_bit[1];
        if (rs < imm)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("blti\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, imm, imm, op.opland[2].c_str());
    }
    else if (op.opcode == "jr")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        if (ops[posbc2pos[rs] - 1].type == 1)
            cur_opnum = posbc2pos[rs] - 2;
        else
            cur_opnum = posbc2pos[rs] - 1;

        // if (print_calc)
        //     printf("jr\t%d(%08X)\n", rs, rs);
    }
    else if (op.opcode == "move")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // rt = cur_env.GPR[op.opland_bit[1]];
        // cur_env.GPR[op.opland_bit[0]] = rt;
    }
    else if (op.opcode == "fmov")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        cur_env.FPR[op.opland_bit[0]] = frs.f;
        // if (print_calc)
        //     printf("fmov\t%f(%08X),\t%f(%08X)\n", frs.f, frs.i, frs.f, frs.i);
    }
    else if (op.opcode == "j")
    {
        cur_opnum = posbc2pos[op.opland_bit[0]] - 2;

        // if (print_calc)
        //     printf("j\t%d(%08X)\n", op.opland_bit[0], op.opland_bit[0]);
    }
    else if (op.opcode == "jal")
    {
        cur_env.GPR[31] = op.op_idx + 1;
        cur_opnum = posbc2pos[op.opland_bit[0]] - 2;

        // if (print_calc)
        //     printf("jal\t%d(%08X)\t%%ra = %d(%08X)\n", op.opland_bit[0], op.opland_bit[0], op.op_idx + 1, op.op_idx + 1);
    }
    else if (op.opcode == "jalr")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        cur_env.GPR[31] = op.op_idx + 1;
        if (ops[posbc2pos[rs] - 1].type == 1)
            cur_opnum = posbc2pos[rs] - 2;
        else
            cur_opnum = posbc2pos[rs] - 1;

        // if (print_calc)
        //     printf("jalr\t%d(%08X)\t%%ra = %d(%08X)\n", rs, rs, op.op_idx + 1, op.op_idx + 1);
    }
    else if (op.opcode == "beq")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs == rt)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("beq\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "beqi")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        imm = op.opland_bit[1];
        if (rs == imm)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("beqi\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, imm, imm, op.opland[2].c_str());
    }
    else if (op.opcode == "bne")
    {
        rs = cur_env.GPR[op.opland_bit[0]];
        rt = cur_env.GPR[op.opland_bit[1]];
        if (rs != rt)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("bne\t%d(%08X),\t%d(%08X),\t%s\n", rs, rs, rt, rt, op.opland[2].c_str());
    }
    else if (op.opcode == "addi")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rs + imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("addi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "slti")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // rs = cur_env.GPR[op.opland_bit[1]];
        // imm = op.opland_bit[2];
        // if (rs < imm)
        //     rd = 1;
        // else
        //     rd = 0;
        // cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("slti\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "andi")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // rs = cur_env.GPR[op.opland_bit[1]];
        // imm = op.opland_bit[2];
        // rd = rs & imm;
        // cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("andi\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "ori")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        imm = op.opland_bit[2];
        rd = rs | imm;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("ori\t%d(%08X),\t%d(%08X),\t%d(%08X)\n", rd, rd, rs, rs, imm, imm);
    }
    else if (op.opcode == "lui")
    {
        imm = op.opland_bit[1];
        rd = imm << 16;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("lui\t%d(%08X),\t%d(%08X)\n", rd, rd, imm, imm);
    }
    else if (op.opcode == "lw")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        sp = rs + op.offset;
        rd = stack[sp].first;
        cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("lw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rd, rd, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "sw")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        sp = rt + op.offset;
        rs = cur_env.GPR[op.opland_bit[0]];
        stack[sp].first = rs;
        stack[sp].second = cur_env.PC;

        // if (print_calc)
        //     printf("sw\t%d(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", rs, rs, op.offset, op.offset, rt, rt, sp, sp);
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
        rd = rt + rs;
        cur_env.GPR[op.opland_bit[0]] = rd;
        cur_in++;

        // if (print_calc)
        //     printf("in\t%d(%08X)\n", rd, rd);
    }
    else if (op.opcode == "fin")
    {
        if (cur_in == in_bytes.size())
        {
            printf("too many in inst\n");
            return 1;
        }
        frt.f = cur_env.FPR[op.opland_bit[0]];
        frt.i = frt.i & 0xFFFFFF00;
        frs.i = in_bytes[cur_in] & 0xFF;
        frd.i = frt.i + frs.i;
        cur_env.FPR[op.opland_bit[0]] = frd.f;
        cur_in++;

        // if (print_calc)
        //     printf("fin\t%f(%08X)\n", frd.f, frd.i);
    }
    else if (op.opcode == "out")
    {
        rt = cur_env.GPR[op.opland_bit[0]];
        temp = rt & 0xFF;
        out_bytes.push_back(temp);

        // if (print_calc)
        //     printf("out\t%d(%08X)\n", temp, temp);
    }
    else if (op.opcode == "fadd")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        // if (use_fpu)
        frd.f = fadd(frs, frt);
        // else
        // frd.f = frs.f + frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fadd\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsub")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        // if (use_fpu)
        frd.f = fsub(frs, frt);
        // else
        // frd.f = frs.f - frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fsub\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fmul")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        // if (use_fpu)
        frd.f = fmul(frs, frt);
        // else
        // frd.f = frs.f * frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fmul\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fdiv")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = cur_env.FPR[op.opland_bit[2]];
        // if (use_fpu)
        frd.f = fdiv(frs, frt);
        // else
        // frd.f = frs.f / frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fdiv\t%f(%08X),\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fneg")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        frd.f = -frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fneg\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fabs")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frt.f < 0)
            frd.f = -frt.f;
        else
            frd.f = frt.f;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fabs\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fsqrt")
    {
        frt.f = cur_env.FPR[op.opland_bit[1]];
        // if (use_fpu)
        frd.f = fsqrt(frt);
        // else
        //     frd.f = sqrtf(frt.f);
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("fsqrt\t%f(%08X),\t%f(%08X)\n", frd.f, frd.i, frt.f, frt.i);
    }
    else if (op.opcode == "fslt")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // frs.f = cur_env.FPR[op.opland_bit[1]];
        // frt.f = cur_env.FPR[op.opland_bit[2]];
        // if (frs.f < frt.f)
        //     rd = 1;
        // else
        //     rd = 0;
        // cur_env.GPR[op.opland_bit[0]] = rd;

        // if (print_calc)
        //     printf("fslt\t%d(%08X),\t%f(%08X),\t%f(%08X)\n", rd, rd, frs.f, frs.i, frt.f, frt.i);
    }
    else if (op.opcode == "fbeq")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f == frt.f)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("fbeq\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "fbne")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f != frt.f)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("fbne\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "fblt")
    {
        frs.f = cur_env.FPR[op.opland_bit[0]];
        frt.f = cur_env.FPR[op.opland_bit[1]];
        if (frs.f < frt.f)
            cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("fblt\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "fbgt")
    {
        printf("this inst is no longer suppoted\n");
        return 1;
        // frs.f = cur_env.FPR[op.opland_bit[0]];
        // frt.f = cur_env.FPR[op.opland_bit[1]];
        // if (frs.f > frt.f)
        //     cur_opnum = posbc2pos[op.opland_bit[2]] - 2;

        // if (print_calc)
        //     printf("fbgt\t%f(%08X),\t%f(%08X),\t%s\n", frs.f, frs.i, frt.f, frt.i, op.opland[2].c_str());
    }
    else if (op.opcode == "flw")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        sp = rs + op.offset;
        frd.i = stack[sp].first;
        cur_env.FPR[op.opland_bit[0]] = frd.f;

        // if (print_calc)
        //     printf("lw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frd.f, frd.i, op.offset, op.offset, rs, rs, sp, sp);
    }
    else if (op.opcode == "fsw")
    {
        rt = cur_env.GPR[op.opland_bit[1]];
        sp = rt + op.offset;
        frs.f = cur_env.FPR[op.opland_bit[0]];
        stack[sp].first = frs.i;
        stack[sp].second = cur_env.PC;

        // if (print_calc)
        //     printf("sw\t%f(%08X),\tstack[%d(%08X)(%d(%08X)) = %d(%08X)]\n", frs.f, frs.i, op.offset, op.offset, rt, rt, sp, sp);
    }
    else if (op.opcode == "ftoi")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        rt = ftoi(frs);
        cur_env.GPR[op.opland_bit[0]] = rt;

        // if (print_calc)
        //     printf("ftoi\t%d(%08X),\t%f(%08X)\n", rt, rt, frs.f, frs.i);
    }
    else if (op.opcode == "itof")
    {
        rs = cur_env.GPR[op.opland_bit[1]];
        frt.f = itof(rs);
        cur_env.FPR[op.opland_bit[0]] = frt.f;

        // if (print_calc)
        //     printf("itof\t%f(%08X),\t%d(%08X)\n", frt.f, frt.i, rs, rs);
    }
    else if (op.opcode == "floor")
    {
        frs.f = cur_env.FPR[op.opland_bit[1]];
        frt.f = floor(frs);
        cur_env.FPR[op.opland_bit[0]] = frt.f;

        // if (print_calc)
        //     printf("floor\t%f(%08X),\t%f(%08X)\n", frt.f, frt.i, frs.f, frs.i);
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
    // op_counter[op.opcode] += 1;
    // op_counter["total"] += 1;
    return 0;
}