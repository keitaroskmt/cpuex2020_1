#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
#include "file_io.h"

std::vector<unsigned char> in_bytes;
std::vector<unsigned char> out_bytes;

int read_file(std::string infile_name)
{
    std::ifstream infile(infile_name);

    if (!infile)
    {
        std::cout << "file open error";
        return 1;
    }

    std::string str;
    while (getline(infile, str))
    {
        std::string token;
        std::istringstream stream(str);
        RegUnion temp;
        while (getline(stream, token, ' '))
        {
            if (token == "")
                continue;
            if (token.find(".") == std::string::npos)
                temp.i = stoi(token);
            else
                temp.f = stof(token);

            in_bytes.push_back(temp.regBit.c0);
            in_bytes.push_back(temp.regBit.c1);
            in_bytes.push_back(temp.regBit.c2);
            in_bytes.push_back(temp.regBit.c3);
        }
    }
    return 0;
}

int write_file(std::string outfile_name, bool mandelbrot)
{
    char temp1;
    int temp2;
    int size = out_bytes.size();
    std::ofstream outfile;
    outfile.open(outfile_name, std::ios::out);

    if (mandelbrot)
    {
        for (int i = 0; i < size; i += 4)
        {
            temp2 = out_bytes[i] + (out_bytes[i + 1] << 8) + (out_bytes[i + 2] << 16) + (out_bytes[i + 3] << 24);
            outfile << temp2;
        }
    }
    else
    {

        temp1 = out_bytes[0];
        outfile << temp1;
        temp1 = out_bytes[1];
        outfile << temp1;
        temp1 = out_bytes[2];
        outfile << temp1;

        for (int i = 3; i < size; i += 5)
        {
            temp1 = out_bytes[i + 4];
            temp2 = out_bytes[i] + (out_bytes[i + 1] << 8) + (out_bytes[i + 2] << 16) + (out_bytes[i + 3] << 24);
            outfile << temp2;
            outfile << temp1;
        }
    }
    return 0;
}