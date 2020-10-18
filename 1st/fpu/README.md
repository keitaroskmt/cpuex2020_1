# cpuex2020_1 1stCPU 用 FPU

## memo
3clock以下 100MHzで動き、チェックを通ったもの
10/18 fadd 3clock 9.785ns
10/18 fsub 3clock 10.072ns
間に合ってないけど治らないのでとりあえずこれで
10/18 fmul 2clock 7.131ns
非正規化数とかゼロ周りが怪しいのでまだ改善する必要がある