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

        string global_label;
        map<string, int> label_map;
        map<int, vector<string>> code_map;
    protected:
        const char *file_name;
        int current_num;

		void parse_code(string);

        int get_linenum_by_label(string);
};

const map<string, string> inst_format = {
    {"add", "R"},
    {"sll", "R"},
    {"slt", "R"},
    {"jr", "R"},
    {"addi", "I"},
    {"bne", "I"},
    {"lw", "I"},
    {"sw", "I"},
    {"j", "J"},
    {"jal", "J"}
};
