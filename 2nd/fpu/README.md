# cpuex2020_1 2ndCPU 用 FPU

## memo

2021/01/30 1st を移植し、最適化を始める

## 最適化前(total delay in 200MHz)

fadd: 1clock 9.747ns
fsub: 1clock 9.747ns
fmul: 1clock 7.722ns
fdiv: 4clock 7.823ns
finv: 2clock 4.228ns
floor: 1clock 3.732ns
fsqrt: 2clock 5.013ns
ftoi: 1clock 4.338ns
itof: 1clock 4.775ns

## 最適化後(total delay)

- fadd:
  - 1clock 6.798ns(-2.949ns)
  - 0clock 7.045ns
- fsub: 1clock 6.798ns(-2.949ns)
- fmul: 1clock 6.807ns(-0.915ns)
- fdiv: 4clock 6.987ns(-0.836ns)
- finv: 2clock 4.488ns(+0.260ns)
- floor: 1clock 3.732ns(±0ns)
- fsqrt: 2clock 5.013ns(±0ns)
- ftoi: 1clock 4.135ns(-0.203ns)
- itof: 1clock 4.775ns(±0ns)

## 仕様

入力が非正規化数の場合は捨ててよい
出力が非正規化数の場合はそのまま出す
fabs, fneg, fmove: 組み合わせ
