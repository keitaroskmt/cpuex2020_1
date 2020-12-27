#pragma once

int inst_fetch(bool label_count);
int memory_acc();
int write_back();
int inst_terminate(bool print_process, bool print_calc, bool print_bc);