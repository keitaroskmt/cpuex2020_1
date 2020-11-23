#pragma once

#include <iostream>
#include <regex>
#include <map>
#include <fstream>
#include <string>
#include <cassert>
using namespace std;

class Parser {
    public:
        Parser(string);
        int parse_file();
        void preprocess_file(fstream &);

        void print_label();
        void print_code();

        int total_num;

        vector<string> preprocess_buffer;
        vector<string> buffer_tmp;
        map<string, int> label_map;
        map<int, vector<string>> code_map;
    protected:
        string file_name;
        int data_num;
        int current_num;

        void parse_code(string);

        int get_linenum_by_label(string);
};

const map<string, string> inst_format = {
    {"add", "R"},
    {"sub", "R"},
    {"and", "R"},
    {"or", "R"},
    {"nor", "R"},
    {"slt", "R"},
    {"sll", "R"},
    {"srl", "R"},
    {"jr", "R"},
    {"jalr", "R"},
    {"j", "J"},
    {"jal", "J"},
    {"beq", "I"},
    {"bne", "I"},
    {"addi", "I"},
    {"slti", "I"},
    {"andi", "I"},
    {"ori", "I"},
    {"lui", "I"},
    {"lw", "I"},
    {"sw", "I"},
    {"in", "I"},
    {"out", "I"},
    {"fadd", "FR"},
    {"fsub", "FR"},
    {"fmul", "FR"},
    {"fdiv", "FR"},
    {"fneg", "FR"},
    {"fabs", "FR"},
    {"fsqrt", "FR"},
    {"fslt", "FR"},
    {"fbeq", "FI"},
    {"fbne", "FI"},
    {"flw", "FI"},
    {"fsw", "FI"},
    {"ftoi", "FI"},
    {"itof", "FI"},
};