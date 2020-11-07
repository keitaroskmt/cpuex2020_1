#pragma once

void print_state(core_env env);
void print_stats();
std::string get_line(int size);

extern std::map<std::string, int> op_counter;
extern const std::map<std::string, int> reg_name;