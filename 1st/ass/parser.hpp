#pragma once

#include <iostream>
#include <regex>
#include <map>
#include <fstream>
#include <string>
using namespace std;

class Parser {
    public:
        Parser(const char *);
		int parse_file();

        void print_label();
        void print_code();

        int total_num;

        map<string, int> label_map;
        map<int, vector<string>> code_map;
    protected:
        const char *file_name;
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