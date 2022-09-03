---
title: "サイコロを繰り返し投げる試行の確率モデル"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# サイコロを繰り返し投げる試行の確率モデル

## 概要

本ページでは，サイコロを繰り返し投げる試行の確率モデルを定義します．

## 確率の定義

確率の定義は以下の通りです．

{{< hint info >}}
{{< theorem-label name="Definition" >}}

1. \\(X\\) を集合とする．\\(\mathfrak{F}\subset2^X\\) が \\(X\\) の完全加法族であるとは，次の1--3を満たすことである．ただし，\\(A^c=X-A=\\{x\in X\mid x\notin a\\}\\), \\(2^X=\\{A\mid A\subset X\\}\\) とする．
    1. \\(\emptyset\in\mathfrak{F}\\),
    2. \\(A\in\mathfrak{F}\\) ならば \\(A^c\in\mathfrak{F}\\),
    3. 任意の \\(i\in\mathbb{N}\\) について \\(A_i\in\mathfrak{F}\\) ならば \\(\bigcup_{i=1}^{\infty}A_i\in\mathfrak{F}\\).
2. \\(\Omega\\) を集合とし，\\(\mathfrak{F}\\) を \\(\Omega\\) の完全加法族とする．\\((\Omega,\mathfrak{F})\\) を**標本空間**, \\(\mathfrak{F}\\) の点を**事象**，\\(\Omega\\) の点を**標本点**という．
3. \\(\Omega\\) を集合とし，\\(\mathfrak{F}\\) を \\(\Omega\\) の完全加法族とする．関数 \\(P:\mathfrak{F}\to\mathbb{R}\\) が次の1--3を満たすとき，関数 \\(P\\) を**確率**という．ただし，集合 \\(A_1,A_2,\dots\\) が互いに素とは，どの \\(i,j\ (i\neq j)\\) についても \\(A_i\cap A_j=\emptyset\\) であることをいい，\\(A_1,A_2,\dots\\) が互いに素であるとき，\\(\bigcup_{i=1}^{\infty}A_i\\) を \\(\sum_{i=1}^{\infty}A_i\\) と表す．
    1. \\(A\in\mathfrak{F}\\) ならば \\(P(A)\ge0\\),
    2. \\(P(\Omega)=1\\),
    3. \\(A_1,A_2,\dots\in\mathfrak{F}\\) が互いに素ならば，\\(P(\sum_{i=1}^{\infty}A_i)=\sum_{i=1}^{\infty}P(A_i)\\).
4. \\(\Omega\\) を集合とし，\\(\mathfrak{F}\\) を \\(\Omega\\) の完全加法族とする．関数 \\(P:\mathfrak{F}\to\mathbb{R}\\) を確率とする．このとき，\\((\Omega,\mathfrak{F},P)\\) を**確率空間**という．
{{< /hint >}}

## 偏りのないサイコロを1回だけ投げる試行の確率モデル

まずは，偏りのないサイコロを1回だけ投げる試行の確率モデルを考えます．

{{< katex >}}\Omega_1=\{\omega_1,\omega_2,\dots,\omega_6\}{{< /katex >}} とし，{{< katex >}}\mathfrak{F}_1=2^{\Omega_1}{{< /katex >}} とします．

標本点 {{< katex >}}\omega_i{{< /katex >}} は，サイコロを1回投げて {{< katex >}}i{{< /katex >}} の目が出る根源事象を表すものと解釈し，確率 {{< katex >}}P_1:\mathfrak{F}_1\to\mathbb{R}{{< /katex >}} は偏りのないサイコロを1回だけ投げたとき，出た目の確率を表す関数となるようにします．たとえば，{{< katex >}}i=1,2,\dots,6{{< /katex >}} について，{{< katex >}}P_1(\{\omega_i\})=1/6{{< /katex >}} となるようにします．

これを満たすようにするには，{{< katex >}}P:\mathfrak{F}_1\to\mathbb{R}{{< /katex >}} を {{< katex >}}P_1(A)=|A|/|\Omega_1|{{< /katex >}} とすればよいとわかります．また，このように決めた関数は確率になることが示せます．

ここで定めた確率空間 {{< katex >}}(\Omega_1,\mathfrak{F}_1,P_1){{< /katex >}} は，偏りのないサイコロを1回だけ投げる試行に対する確率モデルとしてよさそうです．

## 偏りのないサイコロを繰り返し投げる試行の確率モデル

次に，偏りのないサイコロを1回だけ投げる試行の確率モデルを考えます．簡単のため，{{< katex >}}N{{< /katex >}}回繰り返し投げる場合を考えます．

{{< katex >}}\Omega_1=\{\omega_1,\omega_2,\dots,\omega_6\}{{< /katex >}} とし，{{< katex >}}\Omega_N=\Omega_1^N{{< /katex >}} とします．{{< katex >}}\mathfrak{F}_N=2^{\Omega_N}{{< /katex >}} とします．このとき，関数 {{< katex >}}P_N:\mathfrak{F}_N\to\mathbb{R}{{< /katex >}} を {{< katex >}}P_N(A)=|A|/|\Omega_N|{{< /katex >}} とすると，{{< katex >}}P_N{{< /katex >}}は確率になることが示せます．

このとき，{{< katex >}}A\in\mathfrak{F}_N{{< /katex >}} が {{< katex >}}|A|=1{{< /katex >}} であれば，{{< katex >}}P_N(A)=1/|\Omega_N|{{< /katex >}} です．つまり，どの出目のパターンもすべて同じ確率で生じると解釈できるため，直感に従います．

ここで定めた確率空間 {{< katex >}}(\Omega_N,\mathfrak{F}_N,P_N){{< /katex >}} は，偏りのないサイコロを {{< katex >}}N{{< /katex >}}回繰り返し投げる場合の確率モデルとしてよさそうです．

## まとめ

本ページでは，偏りのないサイコロを繰り返し投げる試行の確率モデルを定義しました．特に，{{< katex >}}N{{< /katex >}} 回繰り返して投げる場合の確率モデルを定義しました．
