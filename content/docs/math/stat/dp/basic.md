---
title: "差分プライバシの基本"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 差分プライバシの基本

## 概要

本ページでは，差分プライバシの基本事項についてまとめます．

## 準備

### 記号定義

{{< katex >}}\Omega{{< /katex >}} を集合，{{< katex >}}\mathfrak{F}\subseteq 2^\Omega{{< /katex >}}, {{< katex >}}P:\mathfrak{F}\to\mathbb{R}{{< /katex >}} とし，{{< katex >}}(\Omega,\mathfrak{F},P){{< /katex >}} を確率空間とします．

{{< katex >}}X:(\Omega,\mathfrak{F})\to(\mathbb{R}^{k},\mathfrak{B}(\mathbb{R}^{k})){{< /katex >}} を確率変数としたとき，{{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{k}){{< /katex >}} について {{< katex >}}[X\in S]{{< /katex >}} を
{{< katex display >}}
  [X\in S]=\{\omega\in\Omega\mid X(\omega)\in S\}
{{< /katex >}}
とし，{{< katex >}}P([X\in S]){{< /katex >}} を {{< katex >}}P(X\in S){{< /katex >}} と略記します．ただし，{{< katex >}}\mathfrak{B}(\mathbb{R}^{k}){{< /katex >}} とは，{{< katex >}}\mathbb{R}^{k}{{< /katex >}} の開集合全体 {{< katex >}}\mathcal{O}(\mathbb{R}^{k}){{< /katex >}} について，{{< katex >}}\mathcal{O}(\mathbb{R}^{k}){{< /katex >}} を含む最小の完全加法族を表します．

ふたつの確率空間 {{< katex >}}(\Omega_1,\mathfrak{F}_1,P_1){{< /katex >}}, {{< katex >}}(\Omega_2,\mathfrak{F}_2,P_2){{< /katex >}} に対して，ふたつの確率変数 {{< katex >}}X:(\Omega_1,\mathfrak{F}_1)\to(\mathbb{R}^{k},\mathfrak{B}(\mathbb{R}^{k})){{< /katex >}}, {{< katex >}}Y:(\Omega_2,\mathfrak{F}_2)\to(\mathbb{R}^{k},\mathfrak{B}(\mathbb{R}^{k})){{< /katex >}} があったとき，{{< katex >}}P_1(X\in S){{< /katex >}}, {{< katex >}}P_2(Y\in S){{< /katex >}} と書くべきところを，{{< katex >}}P(X\in S){{< /katex >}}, {{< katex >}}P(Y\in S){{< /katex >}} と略記します．

以降では，実数全体の集合を {{< katex >}}\mathbb{R}{{< /katex >}}, 実数の {{< katex >}}k{{< /katex >}} 個の組全体の集合を {{< katex >}}\mathbb{R}^k{{< /katex >}} で表します．

### \\(\epsilon\\)-indistinguishable

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(X:(\Omega\_1,\mathfrak{F}\_1)\to(\mathbb{R}^{k},\mathfrak{B}(\mathbb{R}^{k}))\\), \\(Y:(\Omega\_2,\mathfrak{F}\_2)\to(\mathbb{R}^{k},\mathfrak{B}(\mathbb{R}^{k}))\\) を確率変数とする．
任意の \\(S\in\\mathfrak{B}(\mathbb{R}^{k})\\) について \\(P(X\in S)\le e^\epsilon P(Y\in S)\\) かつ \\(P(Y\in S)\le e^\epsilon P(X\in S)\\) ならば，\\(X\\) と \\(Y\\) は **\\(\epsilon\\)-indistinguishable** であるといい，\\(X\approx_\epsilon Y\\) と表す．
{{< /hint >}}

{{< katex >}}P(Y\in S){{< /katex >}} ならば，
{{< katex display >}}e^{-\epsilon}\le\frac{P(X\in S)}{P(Y\in S)}\le e^{\epsilon}{{< /katex >}}
なので，{{< katex >}}\epsilon{{< /katex >}} は {{< katex >}}X,Y{{< /katex >}} の離れ具合を表しているといえます．

特に，{{< katex >}}\epsilon=0{{< /katex >}} ならば，任意の {{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{k}){{< /katex >}} について {{< katex >}}P(X\in S)=P(Y\in S){{< /katex >}} なので，{{< katex >}}X{{< /katex >}} と {{< katex >}}Y{{< /katex >}} は同一の分布に従います．

{{< katex >}}\epsilon>0{{< /katex >}} ならば，同一の分布に従わないまでも，{{< katex >}}P(X\in S){{< /katex >}} と {{< katex >}}P(Y\in S){{< /katex >}} の離れ具合が {{< katex >}}\epsilon{{< /katex >}} によって制限され，特に {{< katex >}}\epsilon{{< /katex >}} が小さいほど，その制限は強くなります．

## 差分プライバシの定義と性質

### 差分プライバシ (differential privacy)

まずは， **メカニズム** という用語を定義します．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(\mathscr{D}\subseteq\bigcup_{n=1}^\infty\mathbb{R}^{n}\\), \\(\mathscr{D}\'\subseteq\mathbb{R}^{k}\\) とする．\\(\mathscr{M}:\mathscr{D}\times\Omega\to\mathscr{D}\'\\) とする．任意の \\(D\in\mathscr{D}\\) について，\\(\mathscr{M}(D):\Omega\to\mathscr{D}\'\\) が確率変数になるとき，\\(\mathscr{M}\\) を **メカニズム** という．
{{< /hint >}}

メカニズム {{< katex >}}\mathscr{M}{{< /katex >}} は，2次元配列状のデータ {{< katex >}}D{{< /katex >}} に対するロジックとして導入したいものですが，確率的操作を含むため，単なる関数でなく，上記のような定義としています．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(R_{\mathrm{neighb}}\subseteq\mathscr{D}^2\\) を
1. \\((D_1,D_1)\in R_{\mathrm{neighb}}\\)
1. \\((D_1,D_2)\in R_{\mathrm{neighb}}\\implies (D_2,D_1)\in R_{\mathrm{neighb}}\\)
1. \\(\\mathscr{D}=\\bigcup\_{i=1}^k\mathscr{D}\_i\\), \\(i\not=j\\) ならば \\(\mathscr{D}\_i\\cap\\mathscr{D}\_j=\\emptyset\\) であるとする．\\(D_1,D_2\in\mathscr{D}\\) を \\(D_i=(D_{i1},\dots,D_{ik}),D_{ij}\in\mathscr{D}_j,j=1,2,\dots,k\ (i=1,2)\\) とするとき，\\((D_1,D_2)\in R\_{\mathrm{neighb}}\\) ならばある \\(j\\) が存在し，\\(D\_{1j}\not=D\_{2j}\\) かつ，\\(l\not=j\\) ならば \\(D\_{1l}=D\_{2l}\\) であるとする．

を満たす \\(\mathscr{D}\\) 上の関係とする．
{{< /hint >}}

"neighb" は "neighbour" の略で，隣接したデータであるという関係を表しています．
反射律と対称律に加えて，隣接したデータ同士の差は局所的な差であることを要求しています．

{{< hint info >}}
{{< theorem-label name="Definition" >}} 任意の \\((D_1,D_2)\in R_{\mathrm{neighb}}\\) について，\\(\mathscr{M}(D_1)\approx_\epsilon\mathscr{M}(D_2)\\) であるとき，メカニズム \\(\mathscr{M}\\) は **\\(\epsilon\\)-differential privacy を満たす** という．
{{< /hint >}}

\\(\epsilon\\) が小さいとき，\\(\mathscr{M}(D_1)\\) と \\(\mathscr{M}(D_2)\\) が確率変数としておおよそ似たようなものだということは，公開される情報が \\(\mathscr{M}(D_1)\\) や \\(\mathscr{M}(D_2)\\) の実現値であれば，公開される情報から，入力データが \\(D_1\\) であるか \\(D_2\\) であるかの区別が難しいということを主張しています．

たとえば，\\(D_1\\) と \\(D_2\\) の違いが，特定の個人に関するレコードの有無だけであれば，メカニズムの出力結果から，元データにその特定の個人が含まれているかどうかが，類推困難であるということになります．

したがって，例えば，個人情報を含むデータに対するクエリ結果そのものではなく，そのクエリ結果に近い値が出力できる \\(\epsilon\\)-differential privacy を満たすメカニズムの実現値による情報を公開することで，そこに含まれる個人の情報が保護されることが期待されるため，\\(\epsilon\\)-differentai privacy は一種の安全性指標とみることができます．

この安全性指標は，計算量に基づくものではなく，統計的性質だけから主張されている点も特徴です．

ところで，{{< katex >}}\epsilon{{< /katex >}}-differential privacy について，以下の性質が成り立ちます．

{{< hint info >}}
{{< theorem-label name="Proposition" >}} メカニズム \\(\mathscr{M}\\) が \\(\epsilon\\)-differential privacy を満たすならば，任意の \\((D_1,D_2)\in R_{\mathrm{neighb}}\\) について，
\\[ 
  P(\mathscr{M}(D_1)\in S)\le e^\epsilon P(\mathscr{M}(D_2)\in S)
\\]
を満たす．
{{< /hint >}}

これは，{{< katex >}}R_{\mathrm{neighb}}{{< /katex >}} の対称律から明らかです．

### 近似的差分プライバシ (approximate differential privacy)

近似的な differential privacy の定義が以下のように述べられます．

{{< hint info >}}
{{< theorem-label name="Definition" >}} 任意の \\((D_1,D_2)\in R_{\mathrm{neighb}}\\) と \\(S\in\mathfrak{B}(\mathbb{R}^{k})\\)について，
\\[ 
  P(\mathscr{M}(D_1)\in S)\le e^\epsilon P(\mathscr{M}(D_2)\in S)+\delta
\\]
であるとき，メカニズム \\(\mathscr{M}\\) は **\\((\epsilon,\delta)\\)-differential privacy を満たす** という．
{{< /hint >}}

この定義は，メカニズム \\(\mathscr{M}\\) が {{< katex >}}1-\delta{{< /katex >}} の確率で \\(\epsilon\\)-differential privacy を満たすことと等価であることが知られています．

### 差分プライバシの例

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(f:\mathscr{D}\to\mathbb{R}^{k}\\) とする．\\(f\\) の **sensitivity** \\(\Delta f\\) を
\\[
  \Delta f=\max_{(D_1,D_2)\in R_{\mathrm{neighb}}}\\|f(D_1)-f(D_2)\\|_1
\\]
と定める．
{{< /hint >}}

確率密度関数が {{< katex >}}f_X(x;\sigma)=(1/(2\sigma))\exp(-|x|/\sigma){{< /katex >}} で表される確率変数 {{< katex >}}X{{< /katex >}} が従う分布を **ラプラス分布** といいます．関数 {{< katex >}}f{{< /katex >}} の結果に対して，ラプラス分布に従うノイズを加えると，{{< katex >}}\epsilon{{< /katex >}}-differential privacy を満たすメカニズムが得られます．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} \\(f:\mathscr{D}\to\mathbb{R}^{k}\\) とする．確率変数 \\(X\\) の確率密度関数を \\(f_X(x;\sigma)=\prod_{i=1}^k(1/(2\sigma))\exp(-|x_i|/\sigma)\\) とする．\\(\sigma=\Delta f/\epsilon\\) ならば，\\(\mathscr{M}(D)=f(D)+X\\) で定めるメカニズム \\(\mathscr{M}\\) は \\(\epsilon\\)-differential privacy を満たす．
{{< /hint >}}

証明は以下のとおりです．

{{< katex >}}D\in\mathscr{D}{{< /katex >}} に対し，{{< katex >}}f(D)\in\mathbb{R}^k{{< /katex >}} の第{{< katex >}}i{{< /katex >}}要素を{{< katex >}}(f(D))_i{{< /katex >}}で表します．
{{< katex >}}z\in\mathbb{R}^k{{< /katex >}} とし，{{< katex >}}f_{\mathscr{M}(D_2)}(z)\neq0{{< /katex >}} に注意すると，

{{< katex display >}}
\begin{aligned}
&\frac{f_{\mathscr{M}(D_1)}(z)}{f_{\mathscr{M}(D_2)}(z)}\\
&=\prod_{i=1}^k\left(\frac{\exp(-\epsilon|(f(D_1))_i-z_i|/\Delta f)}{\exp(-\epsilon|(f(D_2))_i-z_i|/\Delta f)}\right)\\
&=\prod_{i=1}^k\exp\left(\frac{\epsilon(|(f(D_2))_i-z_i)|-|(f(D_1))_i-z_i|)}{\Delta f}\right)\\
&\le\prod_{i=1}^k\exp\left(\frac{\epsilon|(f(D_2))_i-(f(D_1))_i|}{\Delta f}\right)\\
&=\exp\left(\sum_{i=1}^k\frac{\epsilon|(f(D_2))_i-(f(D_1))_i|}{\Delta f}\right)\\
&=\exp\left(\frac{\epsilon\sum_{i=1}^k|(f(D_2))_i-(f(D_1))_i|}{\Delta f}\right)\\
&=\exp\left(\frac{\epsilon\|f(D_2)-f(D_1)\|_1}{\Delta f}\right)\\
&\le\exp\left(\frac{\epsilon\Delta f}{\Delta f}\right)\\
&\le\exp(\epsilon)\\
\end{aligned}
{{< /katex >}}

が得られます．よって，{{< katex >}}f_{\mathscr{M}(D_1)}(z)\le e^{\epsilon}f_{\mathscr{M}(D_2)}(z){{< /katex >}} となります．

したがって，任意の {{< katex >}}S\in\mathfrak{B}(\mathbb{R}^k){{< /katex >}} に対し，
{{< katex display >}}
\begin{aligned}
  &P(\mathscr{M}(D_1)\in S)\\
  &=\int_Sf_{\mathscr{M}(D_1)}(z)dz\\
  &\le\int_Se^{\epsilon}f_{\mathscr{M}(D_2)}(z)dz\\
  &=e^\epsilon P(\mathscr{M}(D_2)\in S)
\end{aligned}
{{< /katex >}}
が成り立ちます．しがたって，メカニズム {{< katex >}}\mathscr{M}{{< /katex >}} は {{< katex >}}\epsilon{{< /katex >}}-differential privacy を満たします．

この事実は，データベースに関する確定的処理 {{< katex >}}f{{< /katex >}} があったとき，sensitivity をもとに大きさを決めたラプラスノイズを加えると，{{< katex >}}\epsilon{{< /katex >}}-differential privacy を満たすメカニズムが得られることを示しています．

### 差分プライバシの性質

差分プライバシは，メカニズムの出力に，関数による後処理を施しても性質が変わらないという性質があります．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} \\(\mathscr{D}\subseteq\bigcup_{n=1}^\infty\mathbb{R}^{n}\\), \\(\mathscr{D}\'\subseteq\mathbb{R}^{k}\\) とする．\\(\mathscr{M}:\mathscr{D}\times\Omega\to\mathscr{D}\'\\) とする．\\(\\mathscr{D}\'\'\subseteq\\mathbb{R}^{k\'}\\), \\(g:\\mathscr{D}\'\to\mathscr{D}\'\'\\) とする．\\(\\mathscr{M}\\) が \\((\epsilon,\delta)\\)-differential privacy を満たすとき，\\(g\circ\mathscr{M}\\) も \\((\\epsilon,\\delta)\\)-differential privacy を満たす．
{{< /hint >}}

証明は以下のとおりです．

まず，{{< katex >}}g\circ\mathscr{M}:\mathscr{D}\times\Omega\to\mathscr{D}''{{< /katex >}} とみなします．いま，{{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{k'}){{< /katex >}} とします．{{< katex >}}T_S=\{D'\in\mathscr{D}'\mid g(D')\in S\}{{< /katex >}} とします．{{< katex >}}(D_1,D_2)\in R_{\mathrm{neighb}}{{< /katex >}} とします．このとき，{{< katex >}}T_S\in\mathfrak{B}(\mathbb{R}^k){{< /katex >}} なので，
{{< katex display >}}
\begin{aligned}
  &P((g\circ\mathscr{M})(D_1)\in S)\\
  &=P(\mathscr{M}(D_1)\in T_S)\\
  &=e^\epsilon P(\mathscr{M}(D_2)\in T_S)+\delta\\
  &=e^\epsilon P((g\circ\mathscr{M})(D_2)\in S)+\delta\\
\end{aligned}
{{< /katex >}}
が成り立ちます．つまり，メカニズムの出力に確定的な処理を施しても，differential privacy の性質は変わらないということがわかります．

また，複数のメカニズムを組み合わせた場合の性質は以下のとおりと知られています．これは，差分プライバシを満たすメカニズムを "直列に" 合成すると，{{< katex >}}\epsilon{{< /katex >}} は和になり，"並列に" 合成すると，{{< katex >}}\epsilon{{< /katex >}} は和にならない（最大値になる）ことを表しています．ここでいう並列とは，入力データが事前に互いに素な部分データに分割され，各部分データにメカニズムを適用するということを表します．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} \\(\mathscr{D}\subseteq\bigcup_{n=1}^\infty\mathbb{R}^{n}\\), \\(\mathscr{D}\'_i\subseteq\mathbb{R}^{k_i}\\,(i=1,2\dots,k)\\) とする．\\(\mathscr{M}_i:\mathscr{D}\times\Omega\to\mathscr{D}\'_i\\,(i=1,2\dots,k)\\) とする．\\(\\mathscr{M}:\\mathscr{D}\\times\\Omega\\to\\prod\_{i=1}^k\\mathscr{D}\'_i\\) を \\(\\mathscr{M}(D)=(\\mathscr{M}_i(D))\_{i=1,2,\\dots,k}\\) とする．\\(\\mathscr{M}_i\\) が \\(\epsilon_i\\)-differential privacy を満たすとき，\\(\\mathscr{M}\\) は \\((\\sum\_{i=1}^k\\epsilon_i)\\)-differential privacy を満たす．
{{< /hint >}}

証明は以下のとおりです．

{{< katex >}}D_1,D_2\in R_{\mathrm{neighb}}{{< /katex >}} とします．{{< katex >}}z\in\mathscr{D}'{{< /katex >}} とします．

{{< katex >}}i=1,2,\dots,k{{< /katex >}}について，{{< katex >}}f_{M_i(D_1)}(z_i)\le e^{\epsilon_i}f_{M_i(D_2)}(z_i)\ (z_i\in\mathscr{D}'_i){{< /katex >}} です．{{< katex >}}(z_1,\dots,z_k)\in\prod_{i=1}^k\mathscr{D}'_i{{< /katex >}} のとき，
{{< katex display >}}
\begin{aligned}
&f_{\mathscr{M}(D_1)}(z)\\
&=\prod_{i=1}^kf_{M_i(D_1)}(z_i)\\
&\le\prod_{i=1}^ke^{\epsilon_i}f_{M_i(D_2)}(z_i)\\
&=e^{\sum_{i=1}^k\epsilon_i}\prod_{i=1}^kf_{M_i(D_2)}(z_i)\\
&=e^{\sum_{i=1}^k\epsilon_i}f_{\mathscr{M}(D_2)}(z)
\end{aligned}
{{< /katex >}}
が成り立ちます．よって，任意の {{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{\sum_{i=1}^kk_i}){{< /katex >}} について，{{< katex >}}P(\mathscr{M}(D_1)\in S)=\int_Sf_{\mathscr{M}(D_1)}(z)dz\le\int_S e^{\sum_{i=1}^k\epsilon_i}f_{\mathscr{M}(D_2)}(z)dz=e^{\sum_{i=1}^k\epsilon_i}P(\mathscr{M}(D_2)\in S){{< /katex >}} となります．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} \\(\mathscr{D}\subseteq\bigcup_{n=1}^\infty\mathbb{R}^{n}\\) とし，\\(\\mathscr{D}=\\bigcup\_{i=1}^k\mathscr{D}\_i\\), \\(i\not=j\\) ならば \\(\mathscr{D}\_i\\cap\\mathscr{D}\_j=\\emptyset\\) であるとする．\\(\mathscr{M}\_i:\\mathscr{D}\_i\\times\\Omega\to\mathscr{D}\\,(i=1,2\dots,k)\\) とする．\\(\\mathscr{M}:(\\prod_{i=1}^k\\mathscr{D}_i)\\times\\Omega\\to\\mathscr{D}\'\\) を \\(\\mathscr{M}(D_1,\dots,D_k)=(\\mathscr{M}_i(D))\_{i=1,2,\\dots,k}\\) とする．\\(\\mathscr{M}_i\\) が \\(\epsilon_i\\)-differential privacy を満たすとき，\\(\\mathscr{M}\\) は \\((\\max\_{i=1,2,\dots,k}\\epsilon\_i)\\)-differential privacy を満たす．
{{< /hint >}}

ラプラスノイズを付加することを想定すると，{{< katex >}}\epsilon{{< /katex >}} が大きくなればノイズの大きさもそれに従うので，{{< katex >}}\epsilon{{< /katex >}}の和にならない "並列な" 合成に関する規則は有用性という観点から重要といえます．

## まとめ

本ページでは，差分プライバシの基本事項についてまとめました．
