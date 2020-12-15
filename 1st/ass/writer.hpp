#pragma once

class Writer {
    public:
        Writer(const char *fname, Parser *p);

        void assemble();
        void debug();

    protected:
        int current_num;
        Parser *parser;
        const char *file_name;

        unsigned int encode(vector<string> &);
};


const map<string, unsigned int> reg_name = {
    {"%zero", 0},
    {"%at", 1},
    {"%v0", 2},
    {"%v1", 3},
    {"%a0", 4},
    {"%a1", 5},
    {"%a2", 6},
    {"%a3", 7},
    {"%t0", 8},
    {"%t1", 9},
    {"%t2", 10},
    {"%t3", 11},
    {"%t4", 12},
    {"%t5", 13},
    {"%t6", 14},
    {"%t7", 15},
    {"%s0", 16},
    {"%s1", 17},
    {"%s2", 18},
    {"%s3", 19},
    {"%s4", 20},
    {"%s5", 21},
    {"%s6", 22},
    {"%s7", 23},
    {"%t8", 24},
    {"%t9", 25},
    {"%k0", 26},
    {"%k1", 27},
    {"%hp", 28},
    {"%sp", 29},
    {"%fp", 30},
    {"%ra", 31}
};

const map<string, unsigned int> freg_name = {
    {"%f0", 0},
    {"%f1", 1},
    {"%f2", 2},
    {"%f3", 3},
    {"%f4", 4},
    {"%f5", 5},
    {"%f6", 6},
    {"%f7", 7},
    {"%f8", 8},
    {"%f9", 9},
    {"%f10", 10},
    {"%f11", 11},
    {"%f12", 12},
    {"%f13", 13},
    {"%f14", 14},
    {"%f15", 15},
    {"%f16", 16},
    {"%f17", 17},
    {"%f18", 18},
    {"%f19", 19},
    {"%f20", 20},
    {"%f21", 21},
    {"%f22", 22},
    {"%f23", 23},
    {"%f24", 24},
    {"%f25", 25},
    {"%f26", 26},
    {"%f27", 27},
    {"%f28", 28},
    {"%f29", 29},
    {"%f30", 30},
    {"%fzero", 31}
};

