#include "parser.hpp"
#include "writer.hpp"
#include <unistd.h>

int main(int argc, char *argv[]) {
    bool debug_flag = false;

    int ch;
    while ((ch = getopt(argc, argv, "d")) != -1) {
        if (ch == 'd') {
            debug_flag = true;
        }
    }

    if (argc - optind != 1) {
        cerr << "the number of arguments is one" << endl;
        exit(1);
    }

    string s = argv[optind];
    Parser parser((s+".s").c_str());
    parser.total_num = parser.parse_file();

    //parser.print_label();
    //parser.print_code();

    Writer writer((s+".out").c_str(), &parser);

    if (debug_flag) {
        writer.debug();
    } else {
        writer.assemble();
    }
}
