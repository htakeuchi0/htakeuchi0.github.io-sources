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

複数の多変数多項式を等号で結んで表される連立方程式
{{< katex display=true >}}
  f_1(X_1,\dots,X_n)=\cdots=f_s(X_1,\dots,X_n)=0
{{< /katex >}}
を考えます．
ここではこれを多変数連立代数方程式と呼ぶことにします．
逆に，このページで単に連立方程式といえば，多変数連立代数方程式を指すこととします．

多変数連立代数方程式は，1次式であれば単なる線形方程式であり，1変数であれば4次までは解の公式が存在しますが，一般の場合の解の求め方は，それらに比べて明らかではありません．

[[1]](cite:1), [[2]](cite:2) は，この解法を考える上で重要な概念である **グレブナー基底** の有名な入門書です．
本ページでは，この分野の概観を把握するため，[[1]](cite:1) (それとほとんど目を通せていないですが [[2]](cite:2) も) を読み流した際の記録として，多変数連立代数方程式とグレブナー基底についての概要をまとめます．

多変数連立代数方程式を解くという観点に絞り，この分野でどのような話題があるかを概観できるものとするため，証明や詳細な議論，重要であってもその周辺の話題の紹介は省略します．
[[1]](cite:1), [[2]](cite:2) をご参照ください．

※2025/3/1: 余りの説明が誤っていたため修正しました[^1]．

## 多項式・イデアル・アフィン多様体

本節では主要な概念を定義します．

### 多項式

{{< katex >}}k{{< /katex >}} を体として，係数を体 {{< katex >}}k{{< /katex >}} にもつ多項式を考えます．

{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体，つまり {{< katex >}}\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．
{{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} について，{{< katex >}}\alpha=(\alpha_i)_{i=1,2,\dots,n}{{< /katex >}} と表すものとします．

有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} ({{< katex >}}\forall\alpha\in\mathbb{N}^n\,(a_\alpha\in k){{< /katex >}}) が存在し，{{< katex >}}n{{< /katex >}} 個の **不定元** {{< katex >}}X_1,\dots,X_n\notin k{{< /katex >}} を用いて {{< katex >}}f{{< /katex >}} が
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表せるとき，この {{< katex >}}f{{< /katex >}} を **多項式** といいます．
項に現れる不定元を明示して
{{< katex display=true >}}
  f(X_1,\dots,X_n)=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と書くこともあります．

後者の表記に関連し，例えば {{< katex >}}g\in k[X_1,\dots,X_n]{{< /katex >}} について，{{< katex >}}\alpha_1\neq0{{< /katex >}} ならば {{< katex >}}a_{(\alpha_1,\dots,\alpha_n)}=0{{< /katex >}} であるとき，{{< katex >}}X_1{{< /katex >}} は {{< katex >}}g{{< /katex >}} の項に現れません．
それを明示するために，{{< katex >}}g{{< /katex >}} の代わりに {{< katex >}}g(X_2,\dots,X_n){{< /katex >}} と書くことがあります．
付随して，このような多項式全体の集合を {{< katex >}}k[X_2,\dots,X_n]{{< /katex >}} と書くこともあります．

不定元が {{< katex >}}X_1,\dots,X_n{{< /katex >}} である多項式全体の集合を {{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} と表します．
この {{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} は単位的可換環をなします．
この事実から，{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} は **多項式環** と呼ばれます．

詳細は [前ページ]({{< ref poly >}}) をご参照ください．
前ページの記号でいうと，{{< katex >}}K{{< /katex >}} を有限集合として，{{< katex >}}|K|=n{{< /katex >}} である場合を考えていることになります．
また，{{< katex >}}K{{< /katex >}} が有限集合なら，前ページで {{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} としていたところは {{< katex >}}\mathbb{N}^n{{< /katex >}} とできます．

いくつか関連する用語を定義します．

### 単項式

{{< katex >}}f[X_1,\dots,X_n]{{< /katex >}} において，{{< katex >}}(\alpha_i)_{i=1,2,\dots,n}\in\mathbb{N}^n{{< /katex >}} のとき，
{{< katex display=true >}}
  \prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
を **単項式** といいます．

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} が，有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表されているとき，
{{< katex display=true >}}
\left.\left\{\prod_{i=1}^nX_i^{\alpha_i}\,\right|\,a_{(\alpha_1,\dots,\alpha_n)}\neq0\right\}
{{< /katex >}}
の元を **多項式 {{< katex >}}f{{< /katex >}} の単項式** と呼ぶことがあります．

### 全次数

{{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} に対し，
{{< katex display=true >}}
|\alpha|=\sum_{i=1}^n\alpha_i
{{< /katex >}}
とします．

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} が，有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き，{{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
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

イデアルは，多項式環以外でも定義される一般的な概念ですが，本ページでイデアルといえば，多項式環のイデアルを指すこととします．

{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} に対するイデアル {{< katex >}}I{{< /katex >}} は，{{< katex >}}\mathbb{Z}{{< /katex >}} に対する {{< katex >}}n\mathbb{Z}=\{nx\mid x\in\mathbb{Z}\}{{< /katex >}} を想像しておけばよいです．

{{< katex >}}f_1,\dots,f_s\in k[X_1,X_2,\dots,X_n]{{< /katex >}} について，{{< katex >}}\langle f_1,\dots,f_s\rangle{{< /katex >}} を，
{{< katex display=true >}}
  \langle f_1,\dots,f_s\rangle=\left.\left\{\sum_{i=1}^sh_if_i\,\right|\,h_1,\dots,h_s\in k[X_1,\dots,X_n]\right\}
{{< /katex >}}
と定めると，{{< katex >}}\langle f_1,\dots,f_s\rangle{{< /katex >}} はイデアルになります．
この {{< katex >}}\langle f_1,\dots,f_s\rangle{{< /katex >}} を {{< katex >}}f_1,\dots,f_s{{< /katex >}} により **生成されるイデアル** といいます．

逆に，イデアル {{< katex >}}I{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} が存在し，{{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}} となることが知られています（**ヒルベルトの基底定理**）．
この {{< katex >}}f_1,\dots,f_s{{< /katex >}} を {{< katex >}}I{{< /katex >}} の **基底** といいます．

### アフィン多様体

{{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} に対し，
{{< katex display=true >}}
\bm{V}(f_1,\dots,f_s)=\{a\in k^n\mid \forall i\in\{1,2,\dots,s\}\,(f_i(a)=0)\}
{{< /katex >}}
を {{< katex >}}f_1,\dots,f_s{{< /katex >}} により定義される **アフィン多様体** といいます．
ただし，{{< katex >}}f_i(a)\,(i=1,2,\dots,s){{< /katex >}} は，{{< katex >}}f_i{{< /katex >}} に {{< katex >}}a=(a_1,\dots,a_n)\in k^n{{< /katex >}} を代入したときの値を表します．
{{< katex >}}\bm{V}(f_1,\dots,f_s){{< /katex >}} は連立方程式
{{< katex display=true >}}
f_i(a)=0,\quad i=1,2,\dots,s
{{< /katex >}}
の解全体の集合です．

{{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} をイデアルとするとき，
{{< katex display=true >}}
  \bm{V}(I)=\{a\in k^n\mid \forall f\in I\,(f(a)=0)\}
{{< /katex >}}
とします．
これは，一般には無限個の方程式 {{< katex >}}f=0\,(\forall f\in I){{< /katex >}}の共通解全体の集合です．

{{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} をイデアルとするとき，{{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}} となる {{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} が存在しますが，このとき
{{< katex display=true >}}
  \bm{V}(\langle f_1,\dots,f_s\rangle)=\bm{V}(f_1,\dots,f_s)
{{< /katex >}}
であることが知られています．
つまり，無限個の方程式の共通解が，有限個の方程式の共通解に一致するということです．

また，これは特に {{< katex >}}\langle f_1,\dots,f_s\rangle=\langle g_1,\dots,g_t\rangle{{< /katex >}} ならば，
{{< katex display=true >}}
  \bm{V}(f_1,\dots,f_s)=\bm{V}(g_1,\dots,g_t)
{{< /katex >}}
であることも示しています．

一般に，連立方程式 {{< katex >}}f_1=0,\dots,f_s=0{{< /katex >}} が解きづらければ，それと等価な解きやすい方程式 {{< katex >}}g_1=0,\dots,g_t=0{{< /katex >}} を解けばよいのですが，その方法として，{{< katex >}}f_1,\dots,f_s{{< /katex >}} が生成するイデアル {{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}} を考え，連立方程式が解きやすい {{< katex >}}I{{< /katex >}} の基底 {{< katex >}}g_1,\dots,g_t{{< /katex >}} を見つけてもよい，ということになります．

## 単項式順序

多項式の先頭項やアルゴリズムを述べるため，多項式の項の順序について考えます．

1変数の多項式 {{< katex >}}a_nX^n+a_{n-1}X^{n-1}+\cdots+a_1X+a_0{{< /katex >}} や，1次の多変数多項式 {{< katex >}}a_1X_1+a_2X_2+\cdots+a_nX_n{{< /katex >}} では，多項式の項の順序は（一意に決まらずとも）自然に考えられます．

つまり，前者であれば
{{< katex display=true >}}
X^n>X^{n-1}>\cdots>X>1
{{< /katex >}}
という順序を考え，後者であれば
{{< katex display=true >}}
X_1>X_2>\cdots>X_n
{{< /katex >}}
という順序を考え，この順に項を並べるのが自然と考えられます．

一方で，一般の {{< katex >}}n{{< /katex >}} 次の多変数多項式の場合，その順序は自然に決まりません．
全次数をもとに並べることにしても，例えば，{{< katex >}}X^2Y^2,X^3Y,XY^3{{< /katex >}} の序列は直感的に明らかではありません．

多項式の項の順序を考えるため，単項式のどのような順序が定義できるかを考えます．

単項式全体の集合は
{{< katex display=true >}}
  \left.\left\{\prod_{i=1}^nX_i^{\alpha_i}\,\right|\,(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n\right\}
{{< /katex >}}
と書けますが，この順序を考えることは，{{< katex >}}\mathbb{N}^n{{< /katex >}} 上の順序を考えることと同じことになります．

### 順序

まず，一般の集合に対する **順序** の定義を説明します．

集合 {{< katex >}}A{{< /katex >}} に対し，{{< katex >}}R\subseteq A^2{{< /katex >}} を **関係** といいます．
{{< katex >}}(a,b)\in R{{< /katex >}} であることを {{< katex >}}aRb{{< /katex >}} と表すとき，
{{< katex display=true >}}
\begin{aligned}
  &\forall a\in A\,(aRa),\\
  &\forall a,b,c\in A\,(aRb\wedge bRc\implies aRc),\\
  &\forall a,b\in A\,(aRb\wedge bRa\implies a=b),\\
\end{aligned}
{{< /katex >}}
を満たすとき，{{< katex >}}R{{< /katex >}} は **半順序** であるといい，
{{< katex display=true >}}
\begin{aligned}
  &\forall a\in A\,(aRa),\\
  &\forall a,b,c\in A\,(aRb\wedge bRc\implies aRc),\\
  &\forall a,b\in A\,(aRb\wedge bRa\implies a=b),\\
  &\forall a,b\in A\,(aRb\vee bRa),\\
\end{aligned}
{{< /katex >}}
を満たすとき，{{< katex >}}R{{< /katex >}} は **全順序** であるといいます．
このとき，{{< katex >}}aRb{{< /katex >}} は {{< katex >}}a\le b{{< /katex >}} と書くことがふつうです．
また，{{< katex >}}a\le b\wedge a\neq b{{< /katex >}} であることを {{< katex >}}a< b{{< /katex >}} と表します．

順序とは半順序（または全順序）を表す言葉です．

任意の {{< katex >}}S\subseteq A{{< /katex >}} に対し，{{< katex >}}S\neq\emptyset{{< /katex >}} ならば，ある {{< katex >}}\alpha\in S{{< /katex >}} が存在して任意の {{< katex >}}\beta\in S{{< /katex >}} に対して {{< katex >}}\alpha\le\beta{{< /katex >}} が成り立つとき，{{< katex >}}\le{{< /katex >}} は **整列順序** であるといいます．

本ページでは，関係{{< katex >}}< {{< /katex >}} に対して {{< katex >}}a\le b{{< /katex >}} を {{< katex >}}a< b\vee a=b{{< /katex >}} であることとして，{{< katex >}}\le{{< /katex >}} が全順序ならば，{{< katex >}}<{{< /katex >}} は全順序であるということにします．

### 単項式順序

単項式に対する順序を具体的に定義します．
この順序は，{{< katex >}}\mathbb{N}^n{{< /katex >}} の順序に多項式環の代数構造と両立するための性質を追加で要求したものです．

{{< katex >}}\mathbb{N}^n{{< /katex >}} 上の順序 {{< katex >}}>{{< /katex >}} が，
1. {{< katex >}}>{{< /katex >}} は {{< katex >}}\mathbb{N}^n{{< /katex >}} の全順序である．
2. {{< katex >}}\forall\alpha,\beta,\gamma\in\mathbb{N}^n\,(\alpha>\beta\implies \alpha+\gamma>\beta+\gamma){{< /katex >}}.
3. {{< katex >}}>{{< /katex >}} は {{< katex >}}\mathbb{N}^n{{< /katex >}} の整列順序である．

を満たすとき，{{< katex >}}>{{< /katex >}} は **単項式順序** であるといいます．

代表的な単項式順序に以下のものがあります．

* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}j=\min\{i\mid\alpha_i\neq\beta_i\}{{< /katex >}} において {{< katex >}}\alpha_j>\beta_j{{< /katex >}} であるとき {{< katex >}}\alpha>_{\mathrm{lex}}\beta{{< /katex >}} とする（**辞書式順序**，**lex 順序**）．
* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}|\alpha|>|\beta|{{< /katex >}} または {{< katex >}}|\alpha|=|\beta|\wedge\alpha>_{\mathrm{lex}}\beta{{< /katex >}} となるとき，{{< katex >}}\alpha>_{\mathrm{grlex}}\beta{{< /katex >}} とする（**次数付き辞書式順序**，**grlex 順序**）．
* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}|\alpha|>|\beta|{{< /katex >}} または {{< katex >}}|\alpha|=|\beta|\wedge(j=\max\{i\mid \alpha_i\neq\beta_i\}\implies \alpha_j<\beta_j){{< /katex >}} となるとき，{{< katex >}}\alpha>_{\mathrm{grevlex}}\beta{{< /katex >}} とする（**次数付き逆辞書式順序**，**grevlex 順序**）．

これら順序に優劣はなく，それぞれの性質から，目的にあわせて使い分けられています．

### 単項式順序に関連する定義

単項式順序 {{< katex >}}>{{< /katex >}} を固定し，{{< katex >}}\mathbb{N}^n{{< /katex >}} の部分集合上の {{< katex >}}\max{{< /katex >}} はこの順序の意味でとることとします．
つまり，{{< katex >}}A\subseteq\mathbb{N}^n{{< /katex >}} について，固定した単項式順序 {{< katex >}}> {{< /katex >}} に対して，{{< katex >}}\alpha\ge \beta{{< /katex >}} を {{< katex >}}\alpha>\beta\vee\alpha=\beta{{< /katex >}} と定め，{{< katex >}}\gamma=\max A{{< /katex >}} であるとは，{{< katex >}}\alpha\in A\,(\gamma\ge\alpha){{< /katex >}} であることと定めます．

{{< katex >}}X=(X_1,\dots,X_n)\in k[X_1,\dots,X_n]^n{{< /katex >}}, {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} に対し，
{{< katex display=true >}}
  X^{\alpha}=\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表すことにします．

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} が，有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}=\sum_{\alpha\in\mathbb{N}^n}a_{\alpha}X^{\alpha}
{{< /katex >}}
と表されているとします．
このとき，
{{< katex display=true >}}
\begin{aligned}
  &\mathrm{multideg}\,f=\max\{\alpha\in\mathbb{N}^n\mid a_{\alpha}\neq0\},\\
  &\mathrm{LC}(f)=a_{\mathrm{multideg}\,f}\in k,\\
  &\mathrm{LM}(f)=X^{\mathrm{multideg}\,f}\in k[X_1,\dots,X_n],\\
  &\mathrm{LT}(f)=\mathrm{LC}(f)\mathrm{LM}(f)
\end{aligned}
{{< /katex >}}
と定めます．

特に {{< katex >}}\mathrm{multideg}\,f{{< /katex >}} を {{< katex >}}f{{< /katex >}} の **多重次数**，{{< katex >}}\mathrm{LT}(f){{< /katex >}} を {{< katex >}}f{{< /katex >}} の **先頭項** といいます．

これで，多変数多項式に対しても項の順序を考えることができ，先頭項という概念を導入できました．

## 多変数多項式の割り算と余り

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s,h_1,\dots,h_s,r\in k[X_1,\dots,X_n]{{< /katex >}} を用いて {{< katex >}}f=h_1f_1+\cdots+h_sf_s+r{{< /katex >}} と書けて，{{< katex >}}r=0{{< /katex >}} であれば，{{< katex >}}f\in\langle f_1,\dots,f_s\rangle{{< /katex >}} とわかります（正確にいえばこれは十分条件で必要条件ではありません）．

1変数多項式 {{< katex >}}f\in k[X]{{< /katex >}} に対し，{{< katex >}}g\in k[X]{{< /katex >}} を零でない多項式とすると，{{< katex >}}f=qg+r{{< /katex >}}, {{< katex >}}r=0{{< /katex >}} または {{< katex >}}\deg r<\deg g{{< /katex >}} なる {{< katex >}}q,r\in k[X]{{< /katex >}} が存在することが知られていて，{{< katex >}}r{{< /katex >}} は，{{< katex >}}f{{< /katex >}} を {{< katex >}}h{{< /katex >}} で割った **余り** と呼ばれています．

それを拡張し，{{< katex >}}f,f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} に対し，**{{< katex >}}f{{< /katex >}} を {{< katex >}}(f_1,\dots,f_s){{< /katex >}} で割った余り** という概念が作れないかを考えます．

{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の単項式順序を固定します．
{{< katex >}}F=(f_1,\dots,f_s)\in k[X_1,\dots,X_n]^s{{< /katex >}} とします．
このとき，{{< katex >}}q_1,\dots,q_s,r\in k[X_1,\dots,X_n]{{< /katex >}} が存在し，以下が成り立つことが知られています[^1]．
1. {{< katex >}}f=q_1f_1+\cdots+q_sf_s+r{{< /katex >}}.
2. {{< katex >}}r{{< /katex >}} は {{< katex >}}r=0{{< /katex >}} であるか，そうでなければ
{{< katex display=true >}}
  r=\sum_{\alpha\in\mathbb{N}^n}b_\alpha X^{\alpha}
{{< /katex >}}
のとき，{{< katex >}}b_\alpha\not=0{{< /katex >}} なる {{< katex >}}X^\alpha{{< /katex >}} は {{< katex >}}\mathrm{LT}(f_1),\dots,\mathrm{LT}(f_s){{< /katex >}} のいずれでも割り切れない．
3. {{< katex >}}i=1,2,\dots,s{{< /katex >}} について {{< katex >}}q_if_i\neq0{{< /katex >}} ならば {{< katex >}}\mathrm{multideg}\,f\ge\mathrm{multideg}\,q_if_i{{< /katex >}} が成り立つ．

[^1]:余りの説明が誤っていたため修正しました． https://github.com/htakeuchi0/htakeuchi0.github.io-sources/commit/89182896f1e188a9dfd81895ff39cb9184763c8f

この {{< katex >}}r{{< /katex >}} は， {{< katex >}}f{{< /katex >}} を {{< katex >}}F{{< /katex >}} で割った **余り** と呼ばれ，{{< katex >}}\bar{f}^F{{< /katex >}} と表されます．

{{< katex >}}F=(f_1,\dots,f_s){{< /katex >}} の多項式の順番を入れ替えた多項式列を {{< katex >}}F^\sigma=(f_{\sigma(1)},f_{\sigma(2)},\dots,f_{\sigma(s)}){{< /katex >}} と書くと，一般には，{{< katex >}}\bar{f}^F\neq\bar{f}^{F^\sigma}{{< /katex >}} であることが知られています．
{{< katex >}}q_i\,(i=1,2,\dots,s){{< /katex >}} に関しても同様です．

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s,h_1,\dots,h_s,r\in k[X_1,\dots,X_n]{{< /katex >}} を用いて {{< katex >}}f=h_1f_1+\cdots+h_sf_s+r{{< /katex >}} と書けて {{< katex >}}r\neq0{{< /katex >}} であったとしても，{{< katex >}}f_1,\dots,f_s{{< /katex >}} の順番を入れ替えると，余りが0になる場合があるので，{{< katex >}}r=\bar{f}^F=0{{< /katex >}} であることは {{< katex >}}f\in\langle f_1,\dots,f_s\rangle{{< /katex >}} であることの十分条件であっても必要条件ではない，ということになります．

## グレブナー基底

{{< katex >}}I{{< /katex >}} を {{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の {{< katex >}}\{0\}{{< /katex >}} でないイデアルとします．
{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の単項式順序を固定します．
ここで，イデアルに属する多項式の先頭項だけに注目したような概念として，
{{< katex display=true >}}
\begin{aligned}
  &\mathrm{LT}(I)=\{\mathrm{LT}(f)\mid f\in I-\{0\}\},\\
  &\langle \mathrm{LT}(I)\rangle=\langle f\mid f\in\mathrm{LT}(I)\rangle
\end{aligned}
{{< /katex >}}
というものを定義します．

{{< katex >}}G=\{g_1,\dots,g_t\}\subseteq k[X_1,\dots,X_n]{{< /katex >}} が
{{< katex display=true >}}
  \langle\mathrm{LT}(g_1),\dots,\mathrm{LT}(g_t)\rangle=\langle\mathrm{LT}(I)\rangle
{{< /katex >}}
を満たすとき，{{< katex >}}G{{< /katex >}} は {{< katex >}}I{{< /katex >}} の **グレブナー基底** といいます．
また，{{< katex >}}\langle\emptyset\rangle=\{0\}{{< /katex >}} として，{{< katex >}}\emptyset{{< /katex >}} は {{< katex >}}\{0\}{{< /katex >}} のグレブナー基底であるとします．
これまでの {{< katex >}}\langle f_1,\dots,f_s\rangle=I{{< /katex >}} に対し，先頭項だけに注目したような定義といえます．

すべてのイデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} はグレブナー基底をもちます．
また，グレブナー基底は {{< katex >}}I{{< /katex >}} の基底であり，{{< katex >}}\bar{f}^G{{< /katex >}} は {{< katex >}}G=(g_1,\dots,g_t){{< /katex >}} の順序を入れ替えても変わりません（一方で {{< katex >}}q_i\,(i=1,2,\dots,s){{< /katex >}} は変わります）．
一般の多項式列 {{< katex >}}F=(f_1,\dots,f_s){{< /katex >}} の場合は，多項式の順番を変えると余りが変わってしまいますが，グレブナー基底の場合は，余りに関しては順番を気にしなくてよい，ということです．
また，これによって，**{{< katex >}}G{{< /katex >}} が {{< katex >}}I{{< /katex >}} のグレブナー基底ならば，{{< katex >}}f\in I{{< /katex >}} であることと {{< katex >}}\bar{f}^G=0{{< /katex >}} であることが同値になります**．

次に，{{< katex >}}G\subseteq k[X_1,\dots,X_n]{{< /katex >}} がイデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} のグレブナー基底であるかを判定する方法があることを説明します．

{{< katex >}}f,g\in k[X_1,\dots,X_n]{{< /katex >}} を零でない多項式とします．
{{< katex >}}\mathrm{multideg}\,f=\alpha,\mathrm{multideg}\,g=\beta{{< /katex >}} とし，{{< katex >}}\gamma_i=\max\{\alpha_i,\beta_i\}\,(i=1,2,\dots,n),\gamma=(\gamma_1,\dots,\gamma_n){{< /katex >}} とします．
このとき，
{{< katex display=true >}}
S(f,g)=\frac{X^\gamma}{\mathrm{LT}(f)}\cdot f-\frac{X^\gamma}{\mathrm{LT}(g)}\cdot g
{{< /katex >}}
を，{{< katex >}}f,g{{< /katex >}} の **{{< katex >}}S{{< /katex >}}多項式** といいます．
この多項式は，{{< katex >}}f,g{{< /katex >}} の先頭項を打ち消すように作られた多項式です．

イデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} の適当な基底 {{< katex >}}f_1,\dots,f_s{{< /katex >}} はグレブナー基底になるとは限らないのですが，これはなぜかというと，{{< katex >}}S{{< /katex >}} 多項式のように先頭項を打ち消してつくった多項式の先頭項が {{< katex >}}f_1,\dots,f_s{{< /katex >}} の先頭項たちの線形結合で作れない場合，{{< katex >}}\langle\mathrm{LT}(f_1),\dots,\mathrm{LT}(f_s)\rangle{{< /katex >}} より {{< katex >}}\langle\mathrm{LT}(I)\rangle{{< /katex >}} が大きくなってしまうことがあるためです．
このため，{{< katex >}}S{{< /katex >}} 多項式というものを定義して，イデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} の基底がグレブナー基底であるかを解析しようということです．

実際，{{< katex >}}S{{< /katex >}}多項式を使うと，{{< katex >}}G\subseteq k[X_1,\dots,X_n]{{< /katex >}} がイデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} のグレブナー基底であるかが判定できます．
具体的には，{{< katex >}}G=\{g_1,\dots,g_t\}{{< /katex >}} のすべての {{< katex >}}i\neq j{{< /katex >}} となる添字について，{{< katex >}}\overline{S(g_i,g_j)}^G=0{{< /katex >}} であることと，{{< katex >}}G{{< /katex >}} が {{< katex >}}I{{< /katex >}} のグレブナー基底であることは同値です（**ブッフバーガーの判定条件**）．

さらに，多変数多項式の余りは有限回の手続きで求まり，ブッフバーガーの判定条件を用いると，与えられたイデアル {{< katex >}}I=\langle f_1,\dots,f_s\rangle\subseteq k[X_1,\dots,X_n]{{< /katex >}} のグレブナー基底も有限回の手続きで求まることが知られています（**ブッフバーガーのアルゴリズム**）．

簡単にいうと，すべて {{< katex >}}\overline{S(g_i,g_j)}^G=0{{< /katex >}} となればよいため，ひとまずは仮に {{< katex >}}G=\{f_1,\dots,f_t\}\subseteq I{{< /katex >}} としてはじめて，{{< katex >}}r=\overline{S(g_i,g_j)}^G\neq0{{< /katex >}} である {{< katex >}}r\in I{{< /katex >}} が見つかったら，それをグレブナー基底候補 {{< katex >}}G{{< /katex >}} に加えることを続けていく方法です．
この操作でグレブナー基底が求まること，さらにその手続きが有限回で終わることが示せます．

さらに，イデアル {{< katex >}}I{{< /katex >}} のグレブナー基底 {{< katex >}}G{{< /katex >}} が
{{< katex display=true >}}
  \forall p\in G\,(\mathrm{LC}(p)=1)
{{< /katex >}}
であり，すべての {{< katex >}}p\in G{{< /katex >}} について，{{< katex >}}p{{< /katex >}} のどの単項式も {{< katex >}}\langle\mathrm{LT}(G-\{p\})\rangle{{< /katex >}} に含まれないとき，{{< katex >}}G{{< /katex >}} は **被約グレブナー基底** と呼ばれ，{{< katex >}}\{0\}{{< /katex >}} でないイデアル {{< katex >}}I{{< /katex >}} は与えられた単項式順序に対して被約グレブナー基底をもち，ただひとつに定まることがいえます．
被約グレブナー基底も，有限回の手続きで求めることができます．

## 消去定理

{{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} とします．
イデアル {{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}}  に対して，{{< katex >}}I_l=I\cap k[X_{l+1},\dots,X_n]{{< /katex >}} はイデアルであり，これを {{< katex >}}l{{< /katex >}} 次の **消去イデアル** といいます．

ただし，{{< katex >}}k[X_{l+1},\dots,X_n]\subseteq k[X_1,\dots,X_n]{{< /katex >}} とは，
{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} を
有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
{{< katex display=true >}}
f=\sum_{\alpha\in\mathbb{N}^n}a_\alpha X^\alpha
{{< /katex >}}
と表すとき，{{< katex >}}(\alpha_1,\dots,\alpha_l)\neq0{{< /katex >}} ならば {{< katex >}}a_{(\alpha_1,\dots,\alpha_n)}=0{{< /katex >}} であるもの全体の集合とします．

{{< katex >}}l{{< /katex >}} 次の消去イデアル {{< katex >}}I_l{{< /katex >}} の元には {{< katex >}}X_1,\dots,X_l{{< /katex >}} が現れません．
このことより，連立方程式 {{< katex >}}f_1=\cdots=f_s=0{{< /katex >}} から {{< katex >}}X_1,\dots,X_l{{< /katex >}} を消去することは，{{< katex >}}I{{< /katex >}} の {{< katex >}}l{{< /katex >}} 次の消去イデアル {{< katex >}}I_l{{< /katex >}} の基底を求めることに相当するといえます．

では，消去イデアルとその基底をどのように求めればよいかですが，適切な単項式順序をとれば，グレブナー基底でただちに求まります．
具体的には，{{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} をイデアルとして，{{< katex >}}G{{< /katex >}} が {{< katex >}}I{{< /katex >}} の lex 順序 {{< katex >}}X_1>X_2>\cdots>X_n{{< /katex >}} に関するグレブナー基底ならば，{{< katex >}}0\le l\le n{{< /katex >}} に対し，{{< katex >}}G_l=G\cap k[X_{l+1},\dots,X_n]{{< /katex >}} は {{< katex >}}l{{< /katex >}} 次の消去イデアル {{< katex >}}I_l{{< /katex >}} のグレブナー基底になることが知られています（**消去定理**）．

つまり，lex 順序に関するグレブナー基底を用いると，連立方程式から変数を消去して，変数の少ない方程式から順に解を求めることで，もとの連立方程式を解くことができると考えられます．

## 拡張定理

厳密にいえば，前節の方法で消去ができたとしても，その **部分解** が常にもとの解の一部になるとは限りません．
それが実現できる条件を述べたのが **拡張定理** です．
前節の消去定理とこの拡張定理を合わせると，グレブナー基底を用いて，**消去法** で多変数連立代数方程式が解ける仕組みや解けるための条件が理解できます．

例えば，1次の消去イデアルを考えて，{{< katex >}}(a_2,\dots,a_n)\in\bm{V}(I_1){{< /katex >}} が求まったとします．
この **部分解** をもとの方程式の完全な解に **拡張** するには，{{< katex >}}I=\langle g_1,\dots,g_t\rangle{{< /katex >}} に対して，
{{< katex display=true >}}
\begin{aligned}
  &g_1(X_1,a_2,\dots,a_n)=0,\\
  &g_2(X_1,a_2,\dots,a_n)=0,\\
  &\cdots\\
  &g_t(X_1,a_2,\dots,a_n)=0
\end{aligned}
{{< /katex >}}
を満たす {{< katex >}}X_1=a_1{{< /katex >}} を求めればよいですが，**この共通解が常に存在するとは限らない** という点が問題になります．

どのようなときに，そのような共通解が取れるかを述べたのが **拡張定理** です．

{{< katex >}}k{{< /katex >}} を体とします．
すべての定数でない多項式 {{< katex >}}f\in k[X]{{< /katex >}} について {{< katex >}}f(a)=0{{< /katex >}} を満たす {{< katex >}}a\in k{{< /katex >}} が存在するとき，{{< katex >}}k{{< /katex >}} は **代数的閉体** であるといいます．

拡張定理は次のとおりです．
{{< katex >}}k{{< /katex >}} を代数的閉体とします．
イデアル {{< katex >}}I=\langle f_1,\dots,f_s\rangle\subseteq k[X_1,\dots,X_n]{{< /katex >}} を考え，{{< katex >}}I_1{{< /katex >}} を {{< katex >}}I{{< /katex >}} の1次の消去イデアルとします．
{{< katex >}}i=1,2,\dots,s{{< /katex >}} に対して，
{{< katex display=true >}}
  f_i=c_i(X_2,\dots,X_n)X_1^{N_i}+g_i(X_1,\dots,X_N)
{{< /katex >}}
と表します．
ただし，{{< katex >}}g_i{{< /katex >}} は {{< katex >}}X_1{{< /katex >}} の次数が {{< katex >}}N_i{{< /katex >}} 未満であるような多項式です．
ここで，{{< katex >}}N_i\ge 0{{< /katex >}} で {{< katex >}}c_i\in k[X_2,\dots,X_n]{{< /katex >}} は零でない多項式とします．
部分解 {{< katex >}}(a_2,\dots,a_n)\in\bm{V}(I_1){{< /katex >}} があると仮定します．
このとき，{{< katex >}}(a_2,\dots,a_n)\notin\bm{V}(c_1,\dots,c_s){{< /katex >}} ならば {{< katex >}}a_1\in k{{< /katex >}} が存在して {{< katex >}}(a_1,\dots,a_n)\in\bm{V}(I){{< /katex >}} となります（**拡張定理**）．

ここでポイントとなる条件は {{< katex >}}(a_2,\dots,a_n)\notin\bm{V}(c_1,\dots,c_s){{< /katex >}} という部分です．
{{< katex >}}(a_2,\dots,a_n)\in\bm{V}(c_1,\dots,c_s){{< /katex >}} ならば，{{< katex >}}i=1,2,\dots,s{{< /katex >}} について {{< katex >}}c_i(a_2,\dots,a_n)=0{{< /katex >}} なので，これは {{< katex >}}(X_2,\dots,X_n){{< /katex >}} を {{< katex >}}(a_2,\dots,a_n){{< /katex >}} に置き換えて得られる {{< katex >}}f_i(X_1,a_2,\dots,a_n)\in k[X_1]\,(i=1,2,\dots,s){{< /katex >}} において，**拡張しようとしたら先頭係数が同時に消えてしまう場合** を意味します．

つまり，拡張定理は，**拡張しようとしたら先頭係数が同時に消えてしまう場合に限っては，拡張がうまくいかないかもしれない** ということを示しています．
そうでない場合は部分解を拡張して，もとの方程式の解が得られるということになります．

## まとめ

本ページでは，[[1]](cite:1) (それとほとんど目を通せていませんが [[2]](cite:2) も) を読み流した際の記録として，多変数連立代数方程式とグレブナー基底についての概要をまとめました．

本ページではブッフバーガーのアルゴリズムの内容は述べていませんが，オリジナルの方法に対して，効率的に計算する方法が研究されており，例えば **F4アルゴリズム**，**F5アルゴリズム** というものが知られています [[2]](cite:2)．

また，多変数連立代数方程式を解くという点だけに着目しましたが，グレブナー基底にまつわる話題はこれだけではありません．
詳細は [[1]](cite:1), [[2]](cite:2) をご参照ください．

## 参考文献

{{< anchor "cite:1" >}}[1] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門上 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.    
{{< anchor "cite:2" >}}[2] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門下 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.

