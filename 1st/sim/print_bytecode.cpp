#include <stdio.h>
#include <map>
#include <string>
#include <iostream>
#include <vector>
#include <bitset>
#include "print_bytecode.h"
#include "sim.h"
#include "myutil.h"

int print_bytecode(op_info op)
{
    // レジスタの中身ではなくレジスタ番号の話
    unsigned int rs, rt, rd, imm, funct, shamt = 0;

    if (op.opcode == "add" || op.opcode == "sub" || op.opcode == "and" || op.opcode == "or" || op.opcode == "nor" || op.opcode == "slt")
    {
        rs = op.opland_bit[1] & 0b11111;
        rt = op.opland_bit[2] & 0b11111;
        rd = op.opland_bit[0] & 0b11111;

        if (op.opcode == "add")
            funct = 0b100000;
        else if (op.opcode == "sub")
            funct = 0b100010;
        else if (op.opcode == "and")
            funct = 0b100100;
        else if (op.opcode == "or")
            funct = 0b100101;
        else if (op.opcode == "nor")
            funct = 0b100111;
        else
            funct = 0b101010;

        std::cout << std::bitset<6>(0) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<5>(rd) << " "
                  << std::bitset<5>(0) << " " << std::bitset<6>(funct) << std::endl;
    }
    else if (op.opcode == "sll" || op.opcode == "srl")
    {
        rt = op.opland_bit[1] & 0b11111;
        imm = op.opland_bit[2] & 0b11111;
        rd = op.opland_bit[0] & 0b11111;
        if (op.opcode == "sll")
            funct = 0b000000;
        else
            funct = 0b000010;

        std::cout << std::bitset<11>(0) << " " << std::bitset<5>(rt) << " "
                  << std::bitset<5>(rd) << " " << std::bitset<5>(imm) << " "
                  << std::bitset<6>(funct) << std::endl;
    }
    else if (op.opcode == "jr" || op.opcode == "jalr")
    {
        rs = op.opland_bit[0] & 0b11111;
        rd = op.opland_bit[0] & 0b11111;
        if (op.opcode == "jr")
            funct = 0b001000;
        else
            funct = 0b001001;

        std::cout << std::bitset<6>(0) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(0) << " " << std::bitset<5>(rd) << " "
                  << std::bitset<5>(0) << " " << std::bitset<6>(funct) << std::endl;
    }
    else if (op.opcode == "j" || op.opcode == "jal")
    {
        imm = label_pos_bc[op.opland[0]] & 0x3ffffff;
        if (op.opcode == "j")
            shamt = 0b000010;
        else
            shamt = 0b000011;

        std::cout << std::bitset<6>(shamt) << " " << std::bitset<26>(imm) << std::endl;
    }
    else if (op.opcode == "beq" || op.opcode == "bne" || op.opcode == "addi" || op.opcode == "slti" || op.opcode == "andi" || op.opcode == "ori" || op.opcode == "lui" || op.opcode == "lw" || op.opcode == "sw" || op.opcode == "fbeq" || op.opcode == "fbne" || op.opcode == "flw" || op.opcode == "fsw")
    {
        if (op.opcode == "lui")
            rs = 0;
        else
            rs = op.opland_bit[1] & 0b11111;

        rt = op.opland_bit[0] & 0b11111;
        if (op.opcode == "lw" || op.opcode == "sw" || op.opcode == "flw" || op.opcode == "fsw")
            imm = op.offset;
        else if (isnum(op.opland[2]))
            imm = op.opland_bit[2] & 0xffff;
        else
            imm = label_pos_bc[op.opland[2]] & 0xffff;

        if (op.opcode == "beq")
            shamt = 0b000100;
        else if (op.opcode == "bne")
            shamt = 0b000101;
        else if (op.opcode == "addi")
            shamt = 0b001000;
        else if (op.opcode == "slti")
            shamt = 0b001010;
        else if (op.opcode == "andi")
            shamt = 0b001100;
        else if (op.opcode == "ori")
            shamt = 0b001101;
        else if (op.opcode == "lui")
            shamt = 0b001111;
        else if (op.opcode == "lw")
            shamt = 0b100011;
        else if (op.opcode == "sw")
            shamt = 0b101011;
        else if (op.opcode == "fbeq")
            shamt = 0b110100;
        else if (op.opcode == "fbne")
            shamt = 0b110101;
        else if (op.opcode == "flw")
            shamt = 0b110011;
        else
            shamt = 0b110110;

        std::cout << std::bitset<6>(shamt) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<16>(imm) << std::endl;
    }
    else if (op.opcode == "in" || op.opcode == "out")
    {
        rt = op.opland_bit[0] & 0b11111;

        if (op.opcode == "in")
            shamt = 0b011010;
        else
            shamt = 0b011011;

        std::cout << std::bitset<6>(shamt) << " " << std::bitset<5>(0) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<16>(0) << std::endl;
    }
    if (op.opcode == "fadd" || op.opcode == "fsub" || op.opcode == "fmul" || op.opcode == "fdiv" || op.opcode == "fneg" || op.opcode == "fabs" || op.opcode == "fsqrt" || op.opcode == "fslt")
    {
        if (op.opcode == "fadd" || op.opcode == "fsub" || op.opcode == "fmul" || op.opcode == "fdiv" || op.opcode == "fslt")
        {
            rs = op.opland_bit[1] & 0b11111;
            rt = op.opland_bit[2] & 0b11111;
        }
        else
        {
            rs = 0;
            rt = op.opland_bit[1] & 0b11111;
        }
        rd = op.opland_bit[0] & 0b11111;

        if (op.opcode == "fadd")
            shamt = 0b010000;
        else if (op.opcode == "fsub")
            shamt = 0b010001;
        else if (op.opcode == "fmul")
            shamt = 0b010010;
        else if (op.opcode == "fdiv")
            shamt = 0b010011;
        else if (op.opcode == "fneg")
            shamt = 0b010100;
        else if (op.opcode == "fabs")
            shamt = 0b010101;
        else if (op.opcode == "fsqrt")
            shamt = 0b010110;
        else
            shamt = 0b010111;

        std::cout << std::bitset<6>(shamt) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<5>(rd) << " "
                  << std::bitset<11>(0) << std::endl;
    }
    else if (op.opcode == "ftoi" || op.opcode == "itof")
    {
        rs = op.opland_bit[1] & 0b11111;
        rt = op.opland_bit[0] & 0b11111;

        if (op.opcode == "ftoi")
            shamt = 0b111000;
        else
            shamt = 0b111001;

        std::cout << std::bitset<6>(shamt) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<16>(0) << std::endl;
    }
    else if (op.opcode == "ret")
    {
        std::cout << "001000 00010 00010 0000000000000000(addi %v0 %v0 0)" << std::endl;
    }
    else if (op.opcode == "nop")
    {
        std::cout << std::bitset<32>(0) << std::endl;
    }

    else if (op.opcode == "bgt" || op.opcode == "fbgt")
    {
        std::cout << "pseudo-instruction" << std::endl;
    }
    else if (op.opcode == "move")
    {
        rs = op.opland_bit[0];
        rt = op.opland_bit[1];

        std::cout << std::bitset<6>(0) << " " << std::bitset<5>(rs) << " "
                  << std::bitset<5>(rt) << " " << std::bitset<5>(0) << " "
                  << std::bitset<5>(0) << " " << std::bitset<6>(32) << std::endl;
    }

    return 0;
}