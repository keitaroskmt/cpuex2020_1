f = open('main.mem','r')
f2 = open('main96slot2.mem','w')

datalist = f.readlines()

for data in datalist:
    if data[0:6] == "010101" or data[0:6] == "000111"or data[0:6] == "010100" or data[0:6] == "000110" : ##fsw,sw,flw,lw
        f2.write(data[0:32]+"0111110000000000000000000000000001111100000000000000000000000000\n")
    elif data[0:6] == "001000" or data[0:6] == "001001"or data[0:6] == "001010" or data[0:6] == "100000" or data[0:6] == "100001" or data[0:6] == "100010" or data[0:6] == "100011" or data[0:6] == "100100" or data[0:6] == "100101" or data[0:6] == "100110" or data[0:6] == "100111" or data[0:6] == "101000" or data[0:6] == "101001" or data[0:6] == "110000" or data[0:6] == "111000" : ##branch-type
        f2.write("0111110000000000000000000000000001111100000000000000000000000000" + data)
    else: ##calculation
        f2.write("01111100000000000000000000000000"+ data[0:32] +"01111100000000000000000000000000\n")

f.close()
f2.close()