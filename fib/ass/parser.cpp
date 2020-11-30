#include "parser.hpp"

Parser::Parser(const char *fname) {
    file_name = fname;
    current_num = 1;
    total_num = 0;
}

int Parser::parse_file() {
    fstream f;
    string line;

    f.open(file_name, ios::in);
    if (!f.is_open()) {
        cerr << "cannot open file" << endl;
        return 0;
    }

    while (getline(f, line)) {
        parse_code(line);
    }
    f.close();

    // 先頭にはj global_labelを挿入
    code_map[0] = {"J", "j", global_label};

    return current_num;
}

void Parser::parse_code(string line) {
    // removes comment
    auto itr = line.find("#");
    if (itr != string::npos) {
        line.erase(itr, line.size());
    }

    smatch res;
    // comment or blank
    if (regex_match(line, res, regex("\\s*\n?$"))) {
        return;
    }
    // label
    else if (regex_match(line, res, regex("^(.+?):\\s*\n?$"))) {
        label_map[res[1].str()] = current_num;
    }
    // op 3つ
    else if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (.+?), (.+?)\n?$"))) {
        code_map[current_num++] = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str(), res[4].str()};
    }
    // lw, sw
    else if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (\\d+)\\((.+?)\\)\n?$"))) {
        code_map[current_num++] = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str(), res[4].str()};
    }
    // op 1つ
    else if (regex_match(line, res, regex("^\t(.+?)\t(.+?)\n?$"))) {
        code_map[current_num++] = {inst_format.at(res[1].str()), res[1].str(), res[2].str()};
    }
    // .global
    else if (regex_match(line, res, regex("^[.]global\t(.+?)\n?$"))) {
        global_label = res[1].str();
    }
    // .sectionなど 読み飛ばし
    else if (regex_match(line, res, regex("^[.](.+?)\n?$"))) {
        return;
    }
    // ret
    else if (regex_match(line, res, regex("\tret\n?$"))) {
        code_map[current_num++] = {"ret"};
    }
    // nop
    else if (regex_match(line, res, regex("\tnop\n?$"))) {
        code_map[current_num++] = {"nop"};
    }
    // error
    else {
        cerr << "Parse error in " << line << endl;
        exit(1);
    }
}

int Parser::get_linenum_by_label(string label) {
    if (!label_map.count(label)) {
        cerr << "No " << label << "founded" << endl;
        return 0;
    }
    return label_map[label];
}

void Parser::print_label() {
    cout << "Print_label" << endl;
    for (auto v : label_map) {
        cout << v.first << " L." << v.second << endl;
    }
}

void Parser::print_code() {
    cout << "Print_code" << endl;
    for (auto v : code_map) {
        cout << "L." << v.first << " ";
        for (auto x : v.second) {
            cout << x << " ";
        }
        cout << endl;
    }
}
