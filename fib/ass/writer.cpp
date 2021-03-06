#include "parser.hpp"
#include "writer.hpp"

Writer::Writer(const char *fname, Parser *p) {
    file_name = fname;
    parser = p;
    current_num = 0;
}

void Writer::assemble() {
    fstream f;
    f.open(file_name, ios::out);
    if (!f.is_open()) {
        cerr << "cannot open output file" << endl;
    }

    for (auto v : parser->code_map) {
        current_num = v.first;
        f << static_cast<bitset<32>>(encode(v.second)) << endl;
    }

    f.close();
}

unsigned int Writer::encode(vector<string> &v) {
    // R形式 
    // opcode 31-26, rs 25-21, rt 20-16, rd 15-11, shamt 10-6, funct 5-0
    // add, jr, sll, slt
    if (v[0] == "R") {
        unsigned int op, rs, rt, rd, shamt, funct;

        if (v[1] == "add") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x20;

        } else if (v[1] == "sll") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            shamt = reg_name.at(v[4]);
            rs = 0x0;
            funct = 0x0;

        } else if (v[1] == "slt") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x2a;
            
        } else if (v[1] == "jr") {
            op = 0x0;
            rs = reg_name.at(v[2]);
            rt = 0x0;
            rd = reg_name.at(v[2]);
            shamt = 0x0;
            funct = 0x8;

        }
        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        rd &= 0b11111;
        shamt &= 0b11111;
        funct &= 0b111111;

        return (op << 26) | (rs << 21) | (rt << 16) | (rd << 11) | (shamt << 6) | funct;
    }
    // I形式
    // opcode 31-26, rs 25-21, rt 20-16, imm 15-0
    // addi, bne, lw, sw
    else if (v[0] == "I") {
        unsigned int op, rs, rt, imm;
        
        if (v[1] == "addi") {
            op = 0x8;
            rt = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            imm = stoi(v[4]);

        } else if (v[1] == "bne") {
            op = 0x5;
            rt = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            // 相対アドレス
            imm = parser->label_map.at(v[4]) - (current_num + 1);

        } else if (v[1] == "lw") {
            op = 0x23;
            rt = reg_name.at(v[2]);
            imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

        } else if (v[1] == "sw") {
            op = 0x2b;
            rt = reg_name.at(v[2]);
            imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

        }
        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        imm &= 0xffff;

        return (op << 26) | (rs << 21) | (rt << 16) | imm;
    }
    // J形式
    // opcode 31-26, addr 25-0
    // j, jal
    else if (v[0] == "J") {
        unsigned int op, addr;

        if (v[1] == "j") {
            op = 0x2;
            addr = parser->label_map.at(v[2]);

        } else if (v[1] == "jal") {
            op = 0x3;
            // print_intをとりあえずnopに
            //if (v[2] == "min_caml_print_int") {
                //op = 0x0;
                //addr = 0x0;
            //} else {
                addr = parser->label_map.at(v[2]);
            //}
        }
        op &= 0b111111;
        addr &= 0x3ffffff;

        return (op << 26) | addr;
    }

    // ret デバッグ用にaddi $v0 $v0 0とする.
    else if (v[0] == "ret") {
        return 0b00100000010000100000000000000000;
    }

    // nop 0うめ
    else if (v[0] == "nop") {
        return 0;
    }

    else {
        cerr << "Error has occured in encoding" << endl;
        exit(1);
    }

    return 0;
}


void Writer::debug() {
    parser->print_label();
    cout << endl;

    for (auto v : parser->code_map) {
        cout << "L." << v.first << " ";
        for (auto x : v.second) {
            cout << x << " ";
        }
        cout << endl;

        current_num = v.first;
        unsigned int bit = encode(v.second);
        for (int i = 31; i >= 0; --i) {
            if (bit & (1<<i)) cout << 1;
            else cout << 0;
            if (i == 26 || i == 21 || i == 16 || i == 11 || i == 6) cout << " ";
        }
        cout << endl;
    }
}
