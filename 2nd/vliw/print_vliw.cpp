#include <stdio.h>
#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
#include "print_vliw.h"
#include "make_vliw.h"

bool all_null(std::vector<op_info> vliw);

void print_vliw(std::string outfile_name, std::string type)
{
    std::ofstream outfile;
    outfile.open(outfile_name, std::ios::out);
    int i = 0;

    if (type == "h")
    {
        while (!all_null(vliw_ops[i]))
        {
            for (int j = 0; j < 4; j++)
            {
                if (vliw_ops[i][j].type == 1)
                {
                    outfile << vliw_ops[i][j].label << ":";
                    break;
                }
                outfile << "\t";
                if (vliw_ops[i][j].opcode == "")
                    outfile << "nop";
                else
                    outfile << vliw_ops[i][j].op_str;
                if (j != 3)
                    outfile << "\t|\t";
            }
            outfile << "\n";
            i++;
        }
    }
    else if (type == "v")
    {
        while (!all_null(vliw_ops[i]))
        {
            for (int j = 0; j < 4; j++)
            {
                if (vliw_ops[i][j].type == 1)
                {
                    outfile << vliw_ops[i][j].label << ":";
                    break;
                }
                outfile << "\t";
                if (vliw_ops[i][j].opcode == "")
                    outfile << "nop";
                else
                    outfile << vliw_ops[i][j].op_str;
                outfile << "\n";
            }
            outfile << "\n";
            i++;
        }
    }
    else if (type == "s")
    {
        while (!all_null(vliw_ops_stable[i]))
        {
            if (vliw_ops_stable[i][0].type == 1)
            {
                outfile << vliw_ops_stable[i][0].label << ":\n";
                i++;
                continue;
            }

            int k = 3;
            while (vliw_ops_stable[i][k].opcode == "")
            {
                outfile << "\tnop\n";
                k--;
            }

            for (int j = 0; j <= k; j++)
            {
                outfile << "\t";
                outfile << vliw_ops_stable[i][j].op_str;
                outfile << "\n";
            }
            outfile << "\n";
            i++;
        }
    }
    return;
}

bool all_null(std::vector<op_info> vliw)
{
    for (int i = 0; i < 4; i++)
        if (vliw[i].opcode != "" || vliw[i].label != "")
            return false;
    return true;
}