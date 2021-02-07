#include "parser.hpp"
#include "writer.hpp"


bool isnum(string s) {
    for (int i = 0; i < (int)s.size(); ++i) {
        if (i == 0 && s[i] == '-') continue;
        if (!('0' <= s[i] && s[i] <= '9')) return false;
    }
    return true;
}

Writer::Writer(string fname, Parser *p) {
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

        // 1blockのサイズは4
        assert(v.second.size() == 4);
        f << static_cast<bitset<32>>(encode(v.second[0]));
        f << static_cast<bitset<32>>(encode(v.second[1]));
        f << static_cast<bitset<32>>(encode(v.second[2]));
        f << static_cast<bitset<32>>(encode(v.second[3])) << endl;
    }

    f.close();
}

unsigned int Writer::encode(vector<string> &v) {
    // R形式
    // opcode 31-26, rs 25-21, rt 20-16, rd 15-11, shamt 10-6, funct 5-0
    if (v[0] == "R") {
        unsigned int op, rs, rt, rd, shamt, funct;

        if (v[1] == "add") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x20;

        } else if (v[1] == "sub") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x22;

        } else if (v[1] == "and") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x24;

        } else if (v[1] == "or") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x25;

        } else if (v[1] == "nor") {
            op = 0x0;
            rd = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            rt = reg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x27;

        } else if (v[1] == "sll") {
            op = 0x2;
            rd = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            shamt = stoi(v[4]);
            rs = 0x0;
            funct = 0x0;

        } else if (v[1] == "srl") {
            op = 0x3;
            rd = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            shamt = stoi(v[4]);
            rs = 0x0;
            funct = 0x0;

        } else if (v[1] == "jr") {
            op = 0x22;
            rs = reg_name.at(v[2]);
            rt = 0x0;
            rd = reg_name.at(v[2]);
            shamt = 0x0;
            funct = 0x8;

        } else if (v[1] == "jalr") {
            op = 0x23;
            rs = reg_name.at(v[2]);
            rt = 0x0;
            rd = reg_name.at(v[2]);
            shamt = 0x0;
            funct = 0x9;

        }
        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        rd &= 0b11111;
        shamt &= 0b11111;
        funct &= 0b111111;

        return (op << 26) | (rs << 21) | (rt << 16) | (rd << 11) | (shamt << 6) | funct;
    }

    // J形式
    // opcode 31-26, addr 25-0
    else if (v[0] == "J") {
        unsigned int op, addr;

        if (v[1] == "j") {
            op = 0x20;
            addr = parser->label_map.at(v[2]);

        } else if (v[1] == "jal") {
            op = 0x21;
            addr = parser->label_map.at(v[2]);
        }
        op &= 0b111111;
        addr &= 0x3ffffff;

        return (op << 26) | addr;
    }

    // I形式
    // opcode 31-26, rs 25-21, rt 20-16, imm 15-0
    else if (v[0] == "I") {
        unsigned int op, rs, rt, imm;
        int signed_imm;
        
        if (v[1] == "beq") {
            op = 0x24;
            rs = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "bne") {
            op = 0x25;
            rs = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "blt") {
            op = 0x26;
            rs = reg_name.at(v[2]);
            rt = reg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "addi") {
            // プログラム全体の評価値 (適当にnopとしておく)
            if (v[2] == "%g0") {
                return 0;
            }

            op = 0x1;
            rt = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);

            if (isnum(v[4])) { // 即値のとき
                signed_imm = stoi(v[4]);
            } else {
                signed_imm = parser->label_map.at(v[4]);
            }

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "ori") {
            op = 0x4;
            rt = reg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            imm = stoi(v[4]);

        } else if (v[1] == "lui") {
            op = 0x5;
            rt = reg_name.at(v[2]);
            rs = 0x0;
            imm = stoi(v[3]);

        } else if (v[1] == "lw") {
            op = 0x6;
            rt = reg_name.at(v[2]);
            signed_imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "sw") {
            op = 0x7;
            rt = reg_name.at(v[2]);
            signed_imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

            assert(-32768 <= signed_imm && signed_imm <= 32767);
            imm = signed_imm;

        } else if (v[1] == "in") {
            op = 0x8;
            rt = reg_name.at(v[2]);
            rs = 0x0;
            imm = 0x0;

        } else if (v[1] == "fin") {
            op = 0x9;
            rt = freg_name.at(v[2]);
            rs = 0x0;
            imm = 0x0;

        } else if (v[1] == "out") {
            op = 0xa;
            rt = reg_name.at(v[2]);
            rs = 0x0;
            imm = 0x0;

        }

        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        imm &= 0xffff;

        return (op << 26) | (rs << 21) | (rt << 16) | imm;
    }

    // opcode 31-26, rs 25-21, c2 20-13, c1 12-0
    else if (v[0] == "II") {
        unsigned int op, rs, c1, c2;
        int signed_c1, signed_c2;

        if (v[1] == "beqi") {
            op = 0x30;
            rs = reg_name.at(v[2]);
            signed_c2 = stoi(v[3]);

            // 相対アドレス
            signed_c1 = parser->label_map.at(v[4]) - (current_num + 1);

        } else if (v[1] == "blti") {
            op = 0x38;
            rs = reg_name.at(v[2]);
            signed_c2 = stoi(v[3]);

            // 相対アドレス
            signed_c1 = parser->label_map.at(v[4]) - (current_num + 1);
        }
        assert(-128 <= signed_c2 && signed_c2 <= 127);
        assert(-4096 <= signed_c1 && signed_c1 <= 4095);
        c1 = signed_c1;
        c2 = signed_c2;

        op &= 0b111111;
        rs &= 0b11111;
        c2 &= 0xff;
        c1 &= 0x1fff;

        return (op << 26) | (rs << 21) | (c2 << 13) | c1;
    }

    // FR形式
    // opcode 31-26, rs 25-21, rt 20-16, rd 15-11, shamt 10-6, funct 5-0
    else if (v[0] == "FR") {
        unsigned int op, rs, rt, rd, shamt, funct;

        if (v[1] == "fadd") {
            // プログラム全体の評価値 (適当にnopとしておく)
            if (v[2] == "%g0") {
                return 0;
            }

            op = 0xb;
            rd = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            rt = freg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fsub") {
            op = 0xc;
            rd = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            rt = freg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fmul") {
            op = 0xd;
            rd = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            rt = freg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fdiv") {
            op = 0xe;
            rd = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            rt = freg_name.at(v[4]);
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fneg") {
            op = 0xf;
            rd = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            rs = 0x0;
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fabs") {
            op = 0x10;
            rd = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            rs = 0x0;
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fsqrt") {
            op = 0x11;
            rd = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            rs = 0x0;
            shamt = 0x0;
            funct = 0x0;

        } else if (v[1] == "fmov") {
            op = 0x13;
            rt = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            rd = 0x0;
            shamt = 0x0;
            funct = 0x0;

        }

        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        rd &= 0b11111;
        shamt &= 0b11111;
        funct &= 0b111111;

        return (op << 26) | (rs << 21) | (rt << 16) | (rd << 11) | (shamt << 6) | funct;
    }

    // FI形式
    // opcode 31-26, rs 25-21, rt 20-16, imm 15-0
    else if (v[0] == "FI") {
        unsigned int op, rs, rt, imm;
        int signed_imm;

        if (v[1] == "fbeq") {
            op = 0x27;
            rs = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

        } else if (v[1] == "fbne") {
            op = 0x28;
            rs = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

        } else if (v[1] == "fblt") {
            op = 0x29;
            rs = freg_name.at(v[2]);
            rt = freg_name.at(v[3]);
            // 相対アドレス
            signed_imm = parser->label_map.at(v[4]) - (current_num + 1);

        } else if (v[1] == "flw") {
            op = 0x14;
            rt = freg_name.at(v[2]);
            signed_imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

        } else if (v[1] == "fsw") {
            op = 0x15;
            rt = freg_name.at(v[2]);
            signed_imm = stoi(v[3]);
            rs = reg_name.at(v[4]);

        } else if (v[1] == "ftoi") {
            op = 0x16;
            rt = reg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            signed_imm = 0x0;

        } else if (v[1] == "itof") {
            op = 0x17;
            rt = freg_name.at(v[2]);
            rs = reg_name.at(v[3]);
            signed_imm = 0x0;

        } else if (v[1] == "floor") {
            op = 0x18;
            rt = freg_name.at(v[2]);
            rs = freg_name.at(v[3]);
            signed_imm = 0x0;
        }
        assert(-32768 <= signed_imm && signed_imm <= 32767);
        imm = signed_imm;

        op &= 0b111111;
        rs &= 0b11111;
        rt &= 0b11111;
        imm &= 0xffff;

        return (op << 26) | (rs << 21) | (rt << 16) | imm;
    }

    // ret デバッグ用にfadd $f0 $f0 0とする. (intはprintできる)
    else if (v[0] == "ret") {
        // return 0b01000000000111110000000000000000;
        return 0;
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
        // ラベル挿入
        for (auto w : parser->label_map) {
            if (w.second == v.first) {
                cout << endl;
                cout << w.first << endl;
            }
        }
        cout << "L." << v.first << endl;
        assert(v.second.size() == 4);
        for (auto w : v.second) {
            cout << "\t";
            for (auto x : w) {
                cout << x << " ";
            }
            cout << endl;

            cout << "\t";
            current_num = v.first;
            print_bit(encode(v.second[0]));
        }
    }
}

void Writer::print_bit(unsigned int bit) {
    for (int i = 31; i >= 0; --i) {
        if (bit & (1<<i)) cout << 1;
        else cout << 0;
        if (i == 26 || i == 21 || i == 16 || i == 11 || i == 6) cout << " ";
    }
    cout << endl;
}