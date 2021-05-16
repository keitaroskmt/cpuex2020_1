# 2st用アセンブラ

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

- 2ndではVLIWを採用しているため, このアセンブラは使わずに少し変更を加えたvliw_assを用いた. 
