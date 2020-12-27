#include <string>
#include <map>
#include <vector>
#include <iostream>
#include <sstream>
#include <iomanip>
#include "reg_fetch.h"
#include "sim.h"

int reg_fetch()
{
    pipereg_info inst = pipe_reg[0];
    bool ret = false;
    int fw_num;
    if (stall)
        return 0;

    int s1_pos = (inst.op.jr || inst.op.comp || inst.op.store || (inst.op.opcode == "out")) ? 0 : 1;
    std::string dreg;

    // MA, WB, ITにいるいずれかの命令に依存しているか判定する
    // 依存していれば、フォワーディングが必要になる
    for (int i = 4; i >= 2; i--)
    {
        // どのステージの値をフォワーディングすべきか
        fw_num = (inst.op.comp || inst.op.jr) ? i : i + 1;
        if (pipe_reg[i].op.wb || pipe_reg[i].op.jal)
        {
            dreg = (pipe_reg[i].op.jal) ? "%ra" : pipe_reg[i].op.opland[0];
            if (inst.op.opland[s1_pos] == dreg)
            {
                if (i == 2 && (pipe_reg[i].op.load || inst.op.comp))
                    ret = true;
                else if (i == 3 && (pipe_reg[i].op.load && (inst.op.comp || inst.op.jr)))
                    ret = true;

                if (inst.op.store)
                    inst.fm = fw_num;
                else
                    inst.fw1 = fw_num;
            }
            if (inst.op.opland[s1_pos + 1] == dreg)
            {
                if (i == 2 && (pipe_reg[i].op.load || inst.op.comp))
                    ret = true;
                else if (i == 3 && (pipe_reg[i].op.load && (inst.op.comp || inst.op.jr)))
                    ret = true;

                if (inst.op.store)
                    inst.fw1 = fw_num;
                else
                    inst.fw2 = fw_num;
            }
        }
    }

    if (ret)
    {
        stall++;
        pipe_reg[1] = NOP;
        return 0;
    }

    if (inst.op.source_type == 1)
    {
        int s1_pos = (inst.op.comp) ? 0 : 1;
        inst.s1 = cur_env.REG[inst.op.opland_bit[s1_pos]];
        inst.s2 = cur_env.REG[inst.op.opland_bit[s1_pos + 1]];
    }
    else if (inst.op.source_type == 2)
    {
        int s1_pos = (inst.op.comp || inst.op.jr || inst.op.store || (inst.op.opcode == "out")) ? 0 : 1;
        if (inst.op.store)
        {
            inst.m = cur_env.REG[inst.op.opland_bit[s1_pos]];
            inst.s1 = cur_env.REG[inst.op.opland_bit[s1_pos + 1]];
        }
        else
            inst.s1 = cur_env.REG[inst.op.opland_bit[s1_pos]];
    }

    if (inst.op.comp || inst.op.j || inst.op.jr)
    {
        // フォワーディング処理
        if (inst.fw1)
            inst.s1 = pipe_reg[inst.fw1].d;
        if (inst.fw2)
            inst.s2 = pipe_reg[inst.fw2].d;
        std::stringstream ss;
        ss << std::setfill('0');
        if (inst.op.opcode == "j")
        {
            cur_opnum = posbc2pos[inst.op.opland_bit[0]] - 1;
            ss << "j\t" << std::dec << inst.op.opland_bit[0] << "(" << std::setw(8) << std::hex << inst.op.opland_bit[0] << ")\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "jr")
        {
            if (ops[posbc2pos[inst.s1.i] - 1].type == 1)
                cur_opnum = posbc2pos[inst.s1.i] - 1;
            else
                cur_opnum = posbc2pos[inst.s1.i];

            ss << "jr\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "jal")
        {
            cur_opnum = posbc2pos[inst.op.opland_bit[0]] - 1;

            ss << "jal\t" << std::dec << inst.op.opland_bit[0] << "(" << std::setw(8) << std::hex << inst.op.opland_bit[0] << ")\t";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "jalr")
        {
            if (ops[posbc2pos[inst.s1.i] - 1].type == 1)
                cur_opnum = posbc2pos[inst.s1.i] - 1;
            else
                cur_opnum = posbc2pos[inst.s1.i];

            ss << "jalr\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << ")\t";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "beq")
        {
            if (inst.s1.i == inst.s2.i)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "beq\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "bne")
        {
            if (inst.s1.i != inst.s2.i)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "bne\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        if (inst.op.opcode == "blt")
        {
            if (inst.s1.i < inst.s2.i)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "blt\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << std::dec << inst.s2.i << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "fbeq")
        {
            if (inst.s1.f == inst.s2.f)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "fbeq\t" << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "fbne")
        {
            if (inst.s1.f != inst.s2.f)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "fbne\t" << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "fblt")
        {
            if (inst.s1.f < inst.s2.f)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "fblt\t" << inst.s1.f << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << inst.s2.f << "(" << std::setw(8) << std::hex << inst.s2.i << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "beqi")
        {
            if (inst.s1.i == inst.imm)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "beqi\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        else if (inst.op.opcode == "blti")
        {
            if (inst.s1.i < inst.imm)
                cur_opnum = posbc2pos[inst.op.opland_bit[2]] - 1;

            ss << "blti\t" << std::dec << inst.s1.i << "(" << std::setw(8) << std::hex << inst.s1.i << "),\t";
            ss << std::dec << inst.imm << "(" << std::setw(8) << std::hex << inst.imm << "),\t";
            ss << inst.op.opland[2] << "\n";
            inst.calc = ss.str();
        }
        stall++;
        flash = true;
    }
    pipe_reg[1] = inst;
    return 0;
}