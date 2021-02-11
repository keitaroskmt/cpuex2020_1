#include <math.h>
#include <stdio.h>
#include <string>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include <map>
#include "exec_op.h"
#include "sim.h"
#include "myutil.h"
#include "file_io.h"
#include "fpu.h"

// 1命令実行する
int exec_op(bool use_fpu)
{
    pipereg_info inst = pipe_reg[1];
    op_info op = inst.op;
    fi temp;
    std::stringstream ss;
    ss << std::setfill('0');

    if (inst.op.opcode == "")
    {
        pipe_reg[2] = NOP;
        return 0;
    }

    if (inst.ex_clk > 0)
    {
        pipe_reg[2] = NOP;
        inst.ex_clk--;
        if (inst.ex_clk == 0)
        {
            pipe_reg[2] = inst;
            return 0;
        }
        pipe_reg[1] = inst;
        return 0;
    }

    // フォワーディング処理
    if (!(inst.op.comp || inst.op.j || inst.op.jr))
    {
        if (inst.fw1)
            inst.s1 = pipe_reg[inst.fw1].d;
        if (inst.fw2)
            inst.s2 = pipe_reg[inst.fw2].d;
        if (inst.fm)
            inst.m = pipe_reg[inst.fm].d;
    }

    if (op.opcode == "add")
    {
        inst.d.i = inst.s1.i + inst.s2.i;
        ss << "add\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "sub")
    {
        inst.d.i = inst.s1.i - inst.s2.i;
        ss << "sub\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "and")
    {
        inst.d.i = inst.s1.i & inst.s2.i;
        ss << "and\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "or")
    {
        inst.d.i = inst.s1.i | inst.s2.i;
        ss << "or\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "nor")
    {
        inst.d.i = ~(inst.s1.i | inst.s2.i);
        ss << "nor\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "sll")
    {
        inst.d.i = inst.s1.i << inst.imm;
        ss << "sll\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "srl")
    {
        inst.d.i = inst.s1.i >> inst.imm;
        ss << "srl\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "jr")
        ;
    else if (op.opcode == "j")
        ;
    else if (op.opcode == "jal")
    {
        inst.d.i = inst.op.op_idx + 1;
        ss << "%ra = " << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")\n";
        inst.calc += ss.str();
    }
    else if (op.opcode == "jalr")
    {
        inst.d.i = inst.op.op_idx + 1;
        ss << "%ra = " << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")\n";
        inst.calc += ss.str();
    }
    else if (op.opcode == "addi")
    {
        inst.d.i = inst.s1.i + inst.imm;
        ss << "addi\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "ori")
    {
        inst.d.i = inst.s1.i | inst.imm;
        ss << "ori\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "lui")
    {
        inst.d.i = inst.imm << 16;
        ss << "lui\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "lw")
    {
        inst.d.i = inst.s1.i + inst.imm;
        ss << "lw\t" << std::dec << stack[inst.d.i].first << "(" << std::setw(8) << std::hex << stack[inst.d.i].first << "),\t";
        ss << "stack[" << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")(";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")) = ";
        ss << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")]\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "sw")
    {
        inst.d.i = inst.s1.i + inst.imm;
        ss << "sw\t" << std::dec << inst.m.i << "(" << std::setw(8) << std::hex << inst.m.i << "),\t";
        ss << "stack[" << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")(";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")) = ";
        ss << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")]\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "in")
    {
        if (cur_in == in_bytes.size())
        {
            printf("too many in inst\n");
            return 1;
        }
        inst.d.i = in_bytes[cur_in];
        cur_in++;

        ss << "in\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fin")
    {
        if (cur_in == in_bytes.size())
        {
            printf("too many in inst\n");
            return 1;
        }
        inst.d.i = in_bytes[cur_in];
        cur_in++;

        ss << "fin\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "out")
    {
        out_bytes.push_back(inst.s1.i & 0xFF);

        ss << "out\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fadd")
    {
        if (use_fpu)
            inst.d.f = fadd(inst.s1, inst.s2);
        else
            inst.d.f = inst.s1.f + inst.s2.f;
        inst.ex_clk = 3;
        stall += 3;

        ss << "fadd\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fsub")
    {
        if (use_fpu)
            inst.d.f = fsub(inst.s1, inst.s2);
        else
            inst.d.f = inst.s1.f - inst.s2.f;
        inst.ex_clk = 3;
        stall += 3;

        ss << "fsub\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fmul")
    {
        if (use_fpu)
            inst.d.f = fmul(inst.s1, inst.s2);
        else
            inst.d.f = inst.s1.f * inst.s2.f;
        inst.ex_clk = 2;
        stall += 2;

        ss << "fmul\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fdiv")
    {
        if (use_fpu)
            inst.d.f = fdiv(inst.s1, inst.s2);
        else
            inst.d.f = inst.s1.f / inst.s2.f;
        inst.ex_clk = 5;
        stall += 5;

        ss << "fdiv\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
        ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fneg")
    {
        inst.d.f = -inst.s1.f;

        ss << "fneg\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fabs")
    {
        inst.d.f = abs(inst.s1.f);

        ss << "fabs\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fsqrt")
    {
        if (use_fpu)
            inst.d.f = fsqrt(inst.s1);
        else
            inst.d.f = sqrtf(inst.s1.f);

        ss << "fsqrt\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fmov")
    {
        inst.d.f = inst.s1.f;

        ss << "fmove\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "flw")
    {
        inst.d.i = inst.s1.i + inst.imm;
        inst.d.i = inst.s1.i + inst.imm;
        temp.i = stack[inst.d.i].first;
        ss << "flw\t" << temp.f << "(" << std::setw(8) << std::hex << temp.i << "),\t";
        ss << "stack[" << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")(";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")) = ";
        ss << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")]\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "fsw")
    {
        inst.d.i = inst.s1.i + inst.imm;
        ss << "fsw\t" << inst.m.f << "(" << std::setw(8) << std::hex << inst.m.i << "),\t";
        ss << "stack[" << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << ")(";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")) = ";
        ss << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << ")]\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "ftoi")
    {
        inst.d.i = ftoi(inst.s1);
        inst.ex_clk = 1;
        stall += 1;

        ss << "ftoi\t" << std::dec << inst.d.i << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "itof")
    {
        inst.d.f = itof(inst.s1.i);
        inst.ex_clk = 1;
        stall += 1;

        ss << "itof\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "floor")
    {
        inst.d.f = floor(inst.s1);
        inst.ex_clk = 1;
        stall += 1;

        ss << "floor\t" << inst.d.f << "(" << std::setw(8) << std::hex << inst.d.i << "),\t";
        ss << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
        inst.calc = ss.str();
    }
    else if (op.opcode == "ret")
        ;
    else if (op.opcode == "nop")
        ;
    else if (op.comp)
        ;
    // 例外処理
    else
    {
        printf("%s is not supported\n", op.opcode.c_str());
        return 1;
    }
    op_counter[op.opcode] += 1;
    op_counter["total"] += 1;
    if (inst.ex_clk > 0)
    {
        pipe_reg[1] = inst;
        pipe_reg[2] = NOP;
        return 0;
    }
    pipe_reg[2] = inst;
    return 0;
}