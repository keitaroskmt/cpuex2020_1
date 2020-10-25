with open('finv_table.mem', 'r') as infile:
    table = infile.read().splitlines()

for i, line in enumerate(table):
    table[i] = line.split()
    table[i] = [int(table[i][j], 2) for j in range(3)]

with open('finv_input.txt', 'r') as infile:
    indata = infile.read().splitlines()

for i, line in enumerate(indata):
    indata[i] = [int(line[:10], 2), int(line[10:], 2)]

with open('finv_output.txt', 'w') as outfile:
    for line in indata:
        idx = line[0]
        c = table[idx][1]
        d = table[idx][2]
        if idx <= 423:
            ans = c - ((line[1] * d) >> 12)
        else:
            ans = c - ((line[1] * d) >> 13)
        outfile.write(f'{ans:023b}\n')


# with open('finv_table.mem', 'r') as infile:
#     table = infile.read().splitlines()

# for i, line in enumerate(table):
#     table[i] = line.split()
#     table[i] = [table[i][j] for j in range(3)]

# new_table = [table[i][1] + table[i][2] for i in range(len(table))]
# with open('finv_table_hex.mem', 'w') as outfile:
#     for s_value in new_table:
#         val = int(s_value, 2)
#         outfile.write(f'{val:09X}\n')
