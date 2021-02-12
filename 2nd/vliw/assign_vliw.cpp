#include <string>
#include <vector>
#include <unistd.h>
#include <iostream>
#include "assign_vliw.h"
#include "make_vliw.h"
#include "load_op.h"

bool ok_reg(op_info op, std::vector<std::string> ng_reg, std::vector<std::string> ng_reg2);

int vliw_assign(int end)
{
    int cur_tag, cur_in = 0, cur_vliw = 0;
    std::vector<std::string> ng_reg;

    while (cur_in < end)
    {
        int i = 0;
        std::vector<std::string> ng_reg(0);
        std::vector<std::string> ng_reg2(0);
        if (ops[cur_in].type == 1)
        {
            vliw_ops[cur_vliw][0] = ops[cur_in];
            vliw_ops_stable[cur_vliw][0] = ops[cur_in];
            cur_vliw++;
            cur_in++;
            continue;
        }
        else if (ops[cur_in].type != 0 || ops[cur_in].assigned)
        {
            cur_in++;
            continue;
        }
        int flag = 15;

        if (ops[cur_in].slot_1)
        {
            flag -= 1 << 0;
            vliw_ops[cur_vliw][0] = ops[cur_in];
            vliw_ops_stable[cur_vliw][i] = ops[cur_in];
        }
        else if (ops[cur_in].slot_2)
        {
            flag -= 1 << 1;
            vliw_ops[cur_vliw][1] = ops[cur_in];
            vliw_ops_stable[cur_vliw][i] = ops[cur_in];
        }
        else if (ops[cur_in].slot_3)
        {
            flag -= 1 << 2;
            vliw_ops[cur_vliw][2] = ops[cur_in];
            vliw_ops_stable[cur_vliw][i] = ops[cur_in];
        }
        else if (ops[cur_in].slot_4)
        {
            flag -= 1 << 3;
            vliw_ops[cur_vliw][3] = ops[cur_in];
            vliw_ops_stable[cur_vliw][i] = ops[cur_in];
        }
        i++;

        ng_reg.push_back(ops[cur_in].dest_reg);
        // ng_reg.push_back(ops[cur_in].src_reg1); // 実機だと必要ないかも
        // ng_reg.push_back(ops[cur_in].src_reg2); // 実機だと必要ないかも

        cur_tag = cur_in + 1;
        if (!ops[cur_in].jump)
        {
            while (cur_tag < end && !ops[cur_tag].jump && flag && ops[cur_tag].type != 1)
            {
                if (!ops[cur_tag].assigned && ok_reg(ops[cur_tag], ng_reg, ng_reg2))
                {
                    if (ops[cur_tag].slot_1 && (flag % 2))
                    {
                        vliw_ops[cur_vliw][0] = ops[cur_tag];
                        vliw_ops_stable[cur_vliw][i] = ops[cur_tag];
                        i++;
                        ops[cur_tag].assigned = true;
                        flag -= 1 << 0;
                        ng_reg.push_back(ops[cur_tag].dest_reg);
                        // ng_reg.push_back(ops[cur_tag].src_reg1); // 実機だと必要ないかも
                        // ng_reg.push_back(ops[cur_tag].src_reg2); // 実機だと必要ないかも
                    }
                    else if (ops[cur_tag].slot_2 && ((flag >> 1) % 2))
                    {
                        vliw_ops[cur_vliw][1] = ops[cur_tag];
                        vliw_ops_stable[cur_vliw][i] = ops[cur_tag];
                        i++;
                        ops[cur_tag].assigned = true;
                        flag -= 1 << 1;
                        ng_reg.push_back(ops[cur_tag].dest_reg);
                        // ng_reg.push_back(ops[cur_tag].src_reg1); // 実機だと必要ないかも
                        // ng_reg.push_back(ops[cur_tag].src_reg2); // 実機だと必要ないかも
                    }
                    else if (ops[cur_tag].slot_3 && ((flag >> 2) % 2))
                    {
                        vliw_ops[cur_vliw][2] = ops[cur_tag];
                        vliw_ops_stable[cur_vliw][i] = ops[cur_tag];
                        i++;
                        ops[cur_tag].assigned = true;
                        flag -= 1 << 2;
                        ng_reg.push_back(ops[cur_tag].dest_reg);
                        // ng_reg.push_back(ops[cur_tag].src_reg1); // 実機だと必要ないかも
                        // ng_reg.push_back(ops[cur_tag].src_reg2); // 実機だと必要ないかも
                    }
                    else if (ops[cur_tag].slot_4 && ((flag >> 3) % 2))
                    {
                        vliw_ops[cur_vliw][3] = ops[cur_tag];
                        vliw_ops_stable[cur_vliw][i] = ops[cur_tag];
                        i++;
                        ops[cur_tag].assigned = true;
                        flag -= 1 << 3;
                        ng_reg.push_back(ops[cur_tag].dest_reg);
                        // ng_reg.push_back(ops[cur_tag].src_reg1); // 実機だと必要ないかも
                        // ng_reg.push_back(ops[cur_tag].src_reg2); // 実機だと必要ないかも
                    }
                }

                if (!ops[cur_tag].assigned)
                {
                    ng_reg.push_back(ops[cur_tag].dest_reg);
                    ng_reg2.push_back(ops[cur_tag].src_reg1);
                    ng_reg2.push_back(ops[cur_tag].src_reg2);
                }
                cur_tag++;
            }
        }
        cur_in++;
        cur_vliw++;
    }
    return 0;
}

bool ok_reg(op_info op, std::vector<std::string> ng_reg, std::vector<std::string> ng_reg2)
{
    if (op.dest_reg != "" && (std::find(ng_reg.begin(), ng_reg.end(), op.dest_reg) != ng_reg.end() || std::find(ng_reg2.begin(), ng_reg2.end(), op.dest_reg) != ng_reg2.end()))
        return false;
    if (op.src_reg1 != "" && std::find(ng_reg.begin(), ng_reg.end(), op.src_reg1) != ng_reg.end())
        return false;
    if (op.src_reg2 != "" && std::find(ng_reg.begin(), ng_reg.end(), op.src_reg2) != ng_reg.end())
        return false;
    return true;
}