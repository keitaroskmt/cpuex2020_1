#pragma once

void print_state();
void print_stats();
void print_label_stats();
std::string get_line(int size);
bool isnum(std::string s);

extern std::map<std::string, long long int> op_counter;
extern const std::map<std::string, int> reg_name;