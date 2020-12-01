# cpuex2020_1 1stCPU 用シミュレータ

## 使い方

アセンブリファイルを assembly ディレクトリに置き、

```bash
sim $ make
sim $ ./sim [-s] [-c] [-p] [-b] [-n arg] [-i arg] [-o]
```

で実行
入力ファイルは io/in ディレクトリに置く。
出力ファイル用に io/out ディレクトリを作成する。

## オプション

- -s:
  step 実行。インタプリタが立ち上がる。
  'h'でコマンド一覧表示。以下のコマンドが使える。

- コマンド説明

  - s: 1step 進める
  - Ns: Nstep 進める
  - r: 最後まで実行
  - pr: 現在のレジスタの表示
  - ps: 現在の命令数の統計を表示
  - pp: 起動時に-p をつけ忘れた or 途中から表示したいときに使う
  - endpp: pp の表示を終了したいときに使う
  - pc: 起動時に -c をつけ忘れた or 途中から表示したいとき
  - endpp: pc の表示を終了
  - pb: 機械語を表示するとき
  - endpb: 機械語表示の終了
  - pfs: -c をつけ忘れたときに使う
  - stack N k: アドレス N の周囲 k 個の範囲に保存されているものを参照する(アドレス N だけが欲しい場合は k=0 を指定する)
  - stackin N k (base): アドレス N に k を代入する k は base を指定しなければ 10 進数 base="16","hex"で 16 進数 base="float","f"で浮動小数
  - stack n(%reg) k: アドレス n + [%reg] の周囲 k 個の範囲に保存されているものを参照する
  - stackin n(%reg) k (base): 上と同じ
  - regin %reg k (base) 整数レジスタへの代入 base を指定しなければ 10 進数 base="16","hex"で 16 進数
  - regfin %reg k (base) 浮動小数レジスタへの代入 base を指定しなければ小数点ありの表記(10.0 とか) base="16","hex"で 16 進数
  - exit: ctrl+c と同じ

- -c:
  計算過程を表示(2020/11/18 追加)

- -b:
  機械語を表示(2020/11/19 追加)

- -n arg:
  入力のファイル名を指定する。
  例えば"assembly/fib.s"を指定するときは`-n fib`とする。

- -p:
  実行した行を表示する。実行例は以下。
  行は左から PC, 命令インデックス, opcode, opland1, ..., offset となっている。

- -i arg:
  別途入力ファイルがある場合にそのファイル名を指定する。("io/in/"以下のパス)
  例えば、"io/in/sin.txt"を指定するときには`-i sin.txt`とする。
  sld ファイルは sld ディレクトリにあるので、`-i sld/base.sld`などとする。

- -o arg:
  出力ファイルがある場合につける。
  ファイル名を指定すると"io/out/"に生成される

```bash
sim $ ./sim -n fib -p
0	0	lui	%sp	0		0
1	4	ori	%sp	%sp	8192	0
2	8	lui	%hp	0		0
3	12	ori	%hp	%hp	16384	0
4	16	j	min_caml_start			0
min_caml_start:
5	116	addi	%v0	%zero	1	0
6	120	sw	%ra	%sp		4
7	124	addi	%sp	%sp	8	0
8	128	jal	fib.10			0
fib.10:
9	20	addi	%at	%zero	1	0
10	24	slt	%at	%at	%v0	0
11	28	bne	%at	%zero	beq_else.24	0
12	32	jr	%ra			0
13	132	addi	%sp	%sp	-8	0
14	136	lw	%ra	%sp		4
15	140	sw	%ra	%sp		4
16	144	addi	%sp	%sp	8	0
17	148	nop				0
18	152	addi	%sp	%sp	-8	0
19	156	lw	%ra	%sp		4
20	160	ret				0
```

## 編集履歴

(2020/11/8) 1st コア 用の 1st シミュレータ完成(in, out を除く)
(2020/11/19) 1st コア用のシミュレータ完成(io 含む)
(2020/11/22) シミュレータ上でレイトレ完動
