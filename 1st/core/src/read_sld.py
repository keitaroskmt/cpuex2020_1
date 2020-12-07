file1 = open('windows/contest.ppm','r')

Lines = file1.readlines()

count = 0
for line in Lines:
     a, b, c = line.split()
     count += 6
     A = int(a)
     B = int(b)
     C = int(c)
     while A/10 >= 1 :
         count += 1
         A /= 10
     while B/10 >= 1 :
         count += 1
         B /= 10
     while C/10 >= 1 :
         count += 1
         C/= 10
print(count)