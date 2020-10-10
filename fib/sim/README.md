# cpuex2020_1 fib 用シミュレータ

##使い方
test.s を同じディレクトリに置き、

```
sim $ make
sim $ ./sim [-s] [-c] [-p] [-n argment]
```

で実行

##オプション
-s:
step 実行。インタプリタが立ち上がる。
'h'でコマンド一覧表示。以下のコマンドが使える。

```
cmd(help:'h'):h
1 step: 's', Nstep: 'Ns'(N=int), run all: 'r', print reg: 'pr', print stat: 'ps', exit: 'exit'
```

-c:
終了時に命令数の統計を表示。

-n arg:
Fibonacci(n)の n を指定する。デフォルトは 1。

-p:
実行した行を表示する。実行例は以下。
行は左から PC, 命令インデックス, opcode, opland1, ..., offset となっている。

```
sim $ ./sim -p
Main:
0	1	jal	Fibonacci			0
Fibonacci:
1	4	addi	$sp	$sp	-8	0
2	5	sw	$a0	$sp		4
3	6	sw	$ra	$sp		0
4	7	addi	$t0	$zero	1	0
5	8	bgt	$a0	$t0	True	0
6	9	move	$v0	$a0		0
7	10	j	Return			0
Return:
8	23	lw	$ra	$sp		0
9	24	lw	$a0	$sp		4
10	25	addi	$sp	$sp	8	0
11	26	jr	$ra			0
12	2	j	Exit			0
Exit:
ans: 1
sim $
```
