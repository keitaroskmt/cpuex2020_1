#include <string>
#include <map>
#include <vector>
#include <iostream>
#include "pipeline.h"
#include "sim.h"
#include "print_bytecode.h"

int inst_fetch(bool label_count);
int memory_acc();
int write_back();
int inst_terminate(bool print_process, bool print_calc, bool print_bc);

int inst_fetch(bool label_count)
{
    pipereg_info inst;
    if (flash)
    {
        pipe_reg[0] = NOP;
        flash = false;
    }
    if (stall)
        return 0;
    while (ops[cur_opnum].type != 0)
    {
        if (label_count && ops[cur_opnum].type == 1)
            label_counter[ops[cur_opnum].label]++;
        cur_opnum++;
    }
    inst.op = ops[cur_opnum];
    inst.PC = cur_env.PC;
    inst.fw1 = 0;
    inst.fw2 = 0;
    inst.fm = 0;
    inst.ex_clk = -1;
    cur_env.PC++;
    if (inst.op.is_imm)
    {
        if (inst.op.opcode == "addi" || inst.op.opcode == "ori" || inst.op.opcode == "sll" || inst.op.opcode == "srl")
            inst.imm = inst.op.opland_bit[2];
        else if (inst.op.opcode == "lui" || inst.op.opcode == "beqi" || inst.op.opcode == "blti")
            inst.imm = inst.op.opland_bit[1];
        else if (inst.op.store || inst.op.load)
            inst.imm = inst.op.offset;
    }
    if (inst.op.opcode != "ret")
        cur_opnum++;
    pipe_reg[0] = inst;
    return 0;
}

int memory_acc()
{
    pipereg_info inst = pipe_reg[2];
    if (inst.op.opcode == "")
    {
        pipe_reg[3] = NOP;
        return 0;
    }

    if (inst.op.opcode == "sw" || inst.op.opcode == "fsw")
    {
        stack[inst.d.i].first = inst.m.i;
        stack[inst.d.i].second = inst.PC;
    }
    else if (inst.op.opcode == "lw" || inst.op.opcode == "flw")
        inst.d.i = stack[inst.d.i].first;

    pipe_reg[3] = inst;
    return 0;
}

int write_back()
{
    pipereg_info inst = pipe_reg[3];
    pipe_reg[4] = inst;
    fi temp;
    if (inst.op.opcode == "")
        return 0;

    if (inst.op.opcode == "jal" || inst.op.opcode == "jalr")
    {
        cur_env.REG[31].i = inst.op.op_idx + 1;
        return 0;
    }

    if (inst.op.opcode == "in" || inst.op.opcode == "fin")
    {
        temp.i = (cur_env.REG[inst.op.opland_bit[0]].i & 0xFFFFFF00) + (inst.d.i & 0xFF);
        cur_env.REG[inst.op.opland_bit[0]] = temp;
    }

    if (!inst.op.wb)
        return 0;

    cur_env.REG[inst.op.opland_bit[0]] = inst.d;

    return 0;
}

int inst_terminate(bool print_process, bool print_calc, bool print_bc)
{
    pipereg_info inst = pipe_reg[4];
    if (inst.op.opcode == "")
    {
        pipe_reg[5] = NOP;
        return 0;
    }
    if (print_process)
    {
        if (ops[inst.op.opnum - 1].type == 1)
            printf("%s:\n", ops[inst.op.opnum - 1].label.c_str());
        printf("%llu\t%llu\t%d\t%s\t%s\t%s\t%s\t%d\n", cur_env.clk, inst.PC, inst.op.op_idx, inst.op.opcode.c_str(), inst.op.opland[0].c_str(), inst.op.opland[1].c_str(), inst.op.opland[2].c_str(), inst.op.offset);
        // printf("%llu\t%d\t%s\t%s\t%s\t%s\t%d\n", inst.PC, inst.op.op_idx, inst.op.opcode.c_str(), inst.op.opland[0].c_str(), inst.op.opland[1].c_str(), inst.op.opland[2].c_str(), inst.op.offset);
    }

    if (print_bc)
        print_bytecode(inst.op);

    if (print_calc)
        printf("%s\n", inst.calc.c_str());
    pipe_reg[5] = inst;
    return 0;
}
