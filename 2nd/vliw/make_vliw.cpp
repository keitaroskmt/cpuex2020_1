#include <string>
#include <vector>
#include <unistd.h>
#include <iostream>
#include "make_vliw.h"
#include "load_op.h"
#include "print_vliw.h"
#include "assign_vliw.h"

int cur_opnum, cur_in;
std::vector<op_info> ops;
std::vector<std::vector<op_info>> vliw_ops(400000, std::vector<op_info>(4));
std::vector<std::vector<op_info>> vliw_ops_stable(400000, std::vector<op_info>(4));

int main(int argc, char *argv[])
{
    int opt;
    std::string type = "h";
    std::string n = "fib";

    while ((opt = getopt(argc, argv, "n:t:")) != -1)
    {
        switch (opt)
        {
        case 'n':
            n = optarg;
            break;

        case 't':
            type = optarg;
            break;

        default:
            printf("Usage: %s [-n arg]\n", argv[0]);
            break;
        }
    }

    FILE *fp;
    std::string file_name, out_file_name;
    int end;

    file_name = "assembly/" + n + ".s";
    out_file_name = "assembly/" + n + "_vliw_" + type + ".s";

    fp = fopen(file_name.c_str(), "r");
    if ((end = load_ops(fp)) == 0)
        return 0;
    fclose(fp);

    vliw_assign(end);

    print_vliw(out_file_name, type);

    return 0;
}
