# cpuex2020_1 1stCPU 用シミュレータ

## 使い方

アセンブリファイルを assembly ディレクトリに置き、

```bash
sim $ make
sim $ ./sim [-s] [-c] [-p] [-n arg]
```

で実行

## オプション

-s:
step 実行。インタプリタが立ち上がる。
'h'でコマンド一覧表示。以下のコマンドが使える。

```bash
cmd(help:'h'):h
1 step: 's', Nstep: 'Ns'(N=int), run all: 'r', print reg: 'pr', print stat: 'ps', exit: 'exit'
```

-c:
終了時に命令数の統計を表示。

-n arg:
入力のファイル名を指定する。
例えば"assembly/fib.s"を指定するときは`-n fib`とする。

-p:
実行した行を表示する。実行例は以下。
行は左から PC, 命令インデックス, opcode, opland1, ..., offset となっている。

```bash
sim $ ./sim -p
min_caml_start:
0	31	addi	%v0	%zero	1	0
1	32	sw	%ra	%sp		4
2	33	addi	%sp	%sp	8	0
3	34	jal	fib.10			0
fib.10:
4	4	addi	%at	%zero	1	0
5	5	slt	%at	%at	%v0	0
6	6	bne	%at	%zero	beq_else.24	0
7	7	jr	%ra			0
8	35	addi	%sp	%sp	-8	0
9	36	lw	%ra	%sp		4
10	37	sw	%ra	%sp		4
11	38	addi	%sp	%sp	8	0
12	39	nop				0
13	40	addi	%sp	%sp	-8	0
14	41	lw	%ra	%sp		4
15	42	ret				0
ans: 1
sim $
```

## 注意

コメントアウト行には対応していないので、消してから使ってね
in, out はまだ対応してない

## 編集履歴

(2020/11/8) 1st コア 用の 1st シミュレータ完成(in, out を除く)
