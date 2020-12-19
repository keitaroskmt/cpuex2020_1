#pragma once

typedef struct
{
    unsigned int c0 : 8;
    unsigned int c1 : 8;
    unsigned int c2 : 8;
    unsigned int c3 : 8;
} Reg_t;

typedef union
{
    Reg_t regBit;
    int i;
    float f;
} RegUnion;

int read_file(std::string infile_name);
int write_file(std::string outfile_name, bool mandelbrot);
int data_load(std::string datafile_name);

extern std::vector<unsigned int> in_bytes;
extern std::vector<unsigned char> out_bytes;