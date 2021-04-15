# VLIW用アセンブラ

If you have `g++` and `c++17`, you can compile:
```bash
$ make 
```

run:
```
$ ./main fib.s
```

debug:
```
$ ./main -d fib.s
```

## メモ
compilerの出力main.sに対し, vliwで命令を貪欲に並び替え命令列4つのまとまりを作ったのちに, このvliw用アセンブラで機械語を得る(vliw用128bit). 


