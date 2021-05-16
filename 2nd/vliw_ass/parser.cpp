#include "parser.hpp"

Parser::Parser(string fname) {
    file_name = fname;
    current_num = 0;
    current_pos = 0;
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

    return current_num;
}

void Parser::parse_code(string line) {
    if (current_pos == 4) {
        current_num++;
        current_pos = 0;
    }

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
    // .sectionなど 読み飛ばし
    else if (regex_match(line, res, regex("^[.](.+?)\n?$"))) {
        return;
    }
    else {
        // 命令列 
        vector<string> v;
        // op 3つ
        if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (.+?), (.+?)\n?$"))) {
            v = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str(), res[4].str()};
            code_map[current_num].emplace_back(v);
        }
        // lw, sw
        else if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (\\d+)\\((.+?)\\)\n?$"))) {
            v = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str(), res[4].str()};
            code_map[current_num].emplace_back(v);
        }
        // op 2つ
        else if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (.+?)\n?$"))) {
            v = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str()};
            code_map[current_num].emplace_back(v);
        }
        // op 1つ
        else if (regex_match(line, res, regex("^\t(.+?)\t(.+?)\n?$"))) {
            v = {inst_format.at(res[1].str()), res[1].str(), res[2].str()};
            code_map[current_num].emplace_back(v);
        }
        // ret
        else if (regex_match(line, res, regex("\tret\n?$"))) {
            v = {"ret"};
            code_map[current_num].emplace_back(v);
        }
        // nop
        else if (regex_match(line, res, regex("\tnop\n?$"))) {
            v = {"nop"};
            code_map[current_num].emplace_back(v);
        }
        // error
        else {
            cerr << "Parse error in " << line << endl;
            exit(1);
        }

        current_pos++;
    }
}


int Parser::get_linenum_by_label(string label) {
    if (!label_map.count(label)) {
        cerr << "No " << label << "founded" << endl;
        return 0;
    }
    return label_map[label];
}

// 行順にラベルを表示 
void Parser::print_label() {
    cout << "Print_label" << endl;
    map<int, string> mp;
    for (auto v : label_map) {
        mp[v.second] = v.first;
    }
    for (auto v : mp) {
        cout << " L." << v.first << " " << v.second << endl;
    }
}

