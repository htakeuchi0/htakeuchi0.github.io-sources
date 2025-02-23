---
title: "多変数連立代数方程式とグレブナー基底"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 多変数連立代数方程式とグレブナー基底

## 概要

一般には多変数である複数の多項式を等号で結んだ形で表される連立方程式
{{< katex display=true >}}
  f_1(X_1,\dots,X_n)=\cdots=f_s(X_1,\dots,X_n)=0
{{< /katex >}}
を，ここでは多変数連立代数方程式と呼ぶことにします．

1次式であれば単なる線形方程式であり，1変数であれば4次までは解の公式が存在しますが，多変数多項式による連立方程式の解の求め方は，それらに比べて明らかではありません．

[[1]](cite:1), [[2]](cite:2) は，この解法を考える上で重要な概念である **グレブナー基底** の有名な入門書です．
本ページでは，[[1]](cite:1), [[2]](cite:2) を初読した際の記録として，多変数連立代数方程式と，グレブナー基底と呼ばれる概念についての概要をまとめます．


## 多項式・イデアル・アフィン多様体

### 多項式

{{< katex >}}k{{< /katex >}} を体として，係数を体 {{< katex >}}k{{< /katex >}} にもつ多項式を考えます．

{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体，つまり {{< katex >}}\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．
{{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} について，{{< katex >}}\alpha=(\alpha_i)_{i=1,2,\dots,n}{{< /katex >}} であるとします．

有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} が存在し，{{< katex >}}n{{< /katex >}} 個の不定元 {{< katex >}}X_1,\dots,X_n\notin k{{< /katex >}} を用いて
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表せるとき，この {{< katex >}}f{{< /katex >}} を **多項式** といいます．
不定元が {{< katex >}}X_1,X_2,\dots,X_n{{< /katex >}} である多項式全体の集合を {{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} と表し，これは単位的可換環をなします．
この事実から，{{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} は **多項式環** と呼ばれます．

詳細は [前ページ]({{< ref poly >}}) をご参照ください．
前ページの記号でいうと，{{< katex >}}K{{< /katex >}} を有限集合として，{{< katex >}}|K|=n{{< /katex >}} である場合を考えていることになります．
また，{{< katex >}}K{{< /katex >}} が有限集合なら，前ページで {{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} としていたところは {{< katex >}}\mathbb{N}^n{{< /katex >}} とできることも使っています．

以降で，いくつか関連する用語を定義します．

### 単項式

{{< katex >}}f[X_1,X_2,\dots,X_n]{{< /katex >}} において，{{< katex >}}(\alpha_i)_{i=1,2,\dots,n}\in\mathbb{N}^n{{< /katex >}} のとき，
{{< katex display=true >}}
  \prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
を **単項式** といいます．

### 全次数

{{< katex >}}f\in k[X_1,X_2,\dots,X_n]{{< /katex >}} が，有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き，{{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表されているとします．
{{< katex >}}f\neq0{{< /katex >}} ならば，
{{< katex display=true >}}
  \deg f=\max\{|\alpha|\mid\alpha\in\mathbb{N}^n\wedge a_\alpha\neq0\}
{{< /katex >}}
を {{< katex >}}f{{< /katex >}} の **全次数** といいます．

### イデアル

{{< katex >}}f[X_1,\dots,X_n]{{< /katex >}} の部分集合 {{< katex >}}I{{< /katex >}} が，
{{< katex display=true >}}
\begin{aligned}
  &0\in I,\\
  &\forall f,g\in I\,(f+g\in I),\\
  &\forall f\in I\,\forall h\in k[X_1,\dots,X_n]\,(hf\in I)
\end{aligned}
{{< /katex >}}
であるとき，{{< katex >}}I{{< /katex >}} は **イデアル** であるといいます．

{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} に対するイデアル {{< katex >}}I{{< /katex >}} は，{{< katex >}}\mathbb{Z}{{< /katex >}} に対する {{< katex >}}n\mathbb{Z}=\{nx\mid x\in\mathbb{Z}\}{{< /katex >}} を想像しておけばよいです．

## 参考文献


{{< anchor "cite:1" >}}[1] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門上 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.    
{{< anchor "cite:2" >}}[2] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門下 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.
