# fib用アセンブラ

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

- min-camlが出力するコードは, 先頭からスタートするとは限らないので, 機械語上では, 便宜上先頭にジャンプ命令を追加した. 
- 停止命令retは, コアのデバッグ用に`addi %v0 %v0 0`とした.
- 何もしない命令としてnopを導入し, 全て0埋めした. 
- min-camlは, 全体の型がunitでないとエラーを返すのでprint_intで結果を返していたが, アセンブラでは`jal min_caml_print_int`をnopに置き換えている.

