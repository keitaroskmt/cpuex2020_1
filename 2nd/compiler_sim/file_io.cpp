#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
#include <map>
#include "file_io.h"
#include "sim.h"

std::vector<unsigned int> in_bytes;
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
    int size = out_bytes.size();
    std::ofstream outfile;
    outfile.open(outfile_name, std::ios::out);

    if (mandelbrot)
    {
        int temp;
        for (int i = 0; i < size; i += 4)
        {
            temp = out_bytes[i] + (out_bytes[i + 1] << 8) + (out_bytes[i + 2] << 16) + (out_bytes[i + 3] << 24);
            outfile << temp;
        }
    }
    else
    {
        for (int i = 0; i < size; i++)
            outfile << out_bytes[i];
    }
    return 0;
}

int data_load(std::string datafile_name)
{
    std::ifstream infile(datafile_name);

    if (!infile)
    {
        std::cout << "file open error";
        return 1;
    }

    std::string str;
    int hp = 0;
    while (getline(infile, str))
    {
        stack[hp].first = static_cast<int>(std::stoul(str, nullptr, 2));
        hp++;
    }
    return 0;
}