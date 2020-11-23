#include "parser.hpp"

Parser::Parser(string fname) {
    file_name = fname;
    current_num = 0;
    data_num = 0;
    total_num = 0;
}

int Parser::parse_file() {
    fstream f;
    preprocess_file(f);

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
    // op 2つ
    else if (regex_match(line, res, regex("^\t(.+?)\t(.+?), (.+?)\n?$"))) {
        code_map[current_num++] = {inst_format.at(res[1].str()), res[1].str(), res[2].str(), res[3].str()};
    }
    // op 1つ
    else if (regex_match(line, res, regex("^\t(.+?)\t(.+?)\n?$"))) {
        code_map[current_num++] = {inst_format.at(res[1].str()), res[1].str(), res[2].str()};
    }
    /*
    // .global
    else if (regex_match(line, res, regex("^[.]global\t(.+?)\n?$"))) {
        global_label = res[1].str();
    }
    */
    // text section
    else if (regex_match(line, res, regex(".section\t\".text\"\n?$"))) {
        data_num = current_num;
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

// addiの引数にラベルが来るときで16bitをはみ出すときの応急処置
void Parser::preprocess_file(fstream &f) {
    string line;

    f.open(file_name, ios::in);
    if (!f.is_open()) {
        cerr << "cannot open file" << endl;
        return;
    }

    while (getline(f, line)) {
        // removes comment
        auto itr = line.find("#");
        if (itr != string::npos) {
            line.erase(itr, line.size());
        }

        preprocess_buffer.push_back(line);
    }
    f.close();


    while (true) {
        bool update = false;
        int line_num = 0;
        for (auto line : preprocess_buffer) {
            smatch res;

            // label
            if (regex_match(line, res, regex("^(.+?):\\s*\n?$"))) {
                label_map[res[1].str()] = line_num;
            }
            // comment or blank
            else if (regex_match(line, res, regex("\\s*\n?$"))) {
            }
            // .sectionなど
            else if (regex_match(line, res, regex("^[.](.+?)\n?$"))) {
            }
            else {
                line_num++;
            }

            if (regex_match(line, res, regex("^\taddi\t(.+?), (.+?), (.+?)\n?$"))) {
                if (label_map.count(res[3].str()) > 0 && label_map.at(res[3].str()) * 4 > 32767) {
                    cout << res[3].str() << endl;
                    update = true;
                    assert((-1 >> 1) == -1); // 算術右シフト
                    int upper = (label_map[res[3].str()] * 4) >> 16;
                    int lower = (label_map[res[3].str()] * 4) & 0xffff;
                    buffer_tmp.push_back("\tlui\t%at, " + to_string(upper));
                    buffer_tmp.push_back("\tori\t%at, %at, " + to_string(lower));
                    buffer_tmp.push_back("\tadd\t" + res[1].str() + ", " + res[2].str() + ", %at");
                } else {
                    buffer_tmp.push_back(line);
                }
            } else {
                buffer_tmp.push_back(line);
            }
        }

        preprocess_buffer = buffer_tmp;
        buffer_tmp = {};
        if (!update) break;
    }


    f.open(file_name, ios::out | ios::trunc);
    if (!f.is_open()) {
        cerr << "cannot open file" << endl;
        return;
    }
    for (auto line : preprocess_buffer) {
        f << line << endl;
    }

    f.close();

    return;
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
    map<int, string> mp;
    for (auto v : label_map) {
        mp[v.second] = v.first;
    }
    for (auto v : mp) {
        cout << " L." << v.first << " " << v.second << endl;
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
