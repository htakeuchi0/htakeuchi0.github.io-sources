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
を考えます．
ここではこれを多変数連立代数方程式と呼ぶことにします．

多変数連立代数方程式は，1次式であれば単なる線形方程式であり，1変数であれば4次までは解の公式が存在しますが，一般の場合の解の求め方は，それらに比べて明らかではありません．

[[1]](cite:1), [[2]](cite:2) は，この解法を考える上で重要な概念である **グレブナー基底** の有名な入門書です．
本ページでは，[[1]](cite:1), [[2]](cite:2) を初読した際の記録として，多変数連立代数方程式と，グレブナー基底と呼ばれる概念についての概要をまとめます．


## 多項式・イデアル・アフィン多様体

### 多項式

{{< katex >}}k{{< /katex >}} を体として，係数を体 {{< katex >}}k{{< /katex >}} にもつ多項式を考えます．

{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体，つまり {{< katex >}}\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．
{{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} について，{{< katex >}}\alpha=(\alpha_i)_{i=1,2,\dots,n}{{< /katex >}} と表すものとします．

有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き {{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} が存在し，{{< katex >}}n{{< /katex >}} 個の不定元 {{< katex >}}X_1,\dots,X_n\notin k{{< /katex >}} を用いて
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表せるとき，この {{< katex >}}f{{< /katex >}} を **多項式** といいます．
不定元が {{< katex >}}X_1,X_2,\dots,X_n{{< /katex >}} である多項式全体の集合を {{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} と表します．
この {{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} は単位的可換環をなします．
この事実から，{{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} は **多項式環** と呼ばれます．

詳細は [前ページ]({{< ref poly >}}) をご参照ください．
前ページの記号でいうと，{{< katex >}}K{{< /katex >}} を有限集合として，{{< katex >}}|K|=n{{< /katex >}} である場合を考えていることになります．
また，{{< katex >}}K{{< /katex >}} が有限集合なら，前ページで {{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} としていたところは {{< katex >}}\mathbb{N}^n{{< /katex >}} とできます．

以降で，いくつか関連する用語を定義します．

### 単項式

{{< katex >}}f[X_1,X_2,\dots,X_n]{{< /katex >}} において，{{< katex >}}(\alpha_i)_{i=1,2,\dots,n}\in\mathbb{N}^n{{< /katex >}} のとき，
{{< katex display=true >}}
  \prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
を **単項式** といいます．

### 全次数

{{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} に対し，
{{< katex display=true >}}
|\alpha|=\sum_{i=1}^n\alpha_i
{{< /katex >}}
とします．

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

{{< katex >}}f_1,\dots,f_s\in k[X_1,X_2,\dots,X_n]{{< /katex >}} について，
{{< katex display=true >}}
  \langle f_1,\dots,f_s\rangle=\left.\left\{\sum_{i=1}^sh_if_i\,\right|\,h_1,\dots,h_s\in k[X_1,\dots,X_n]\right\}
{{< /katex >}}
とすると，{{< katex >}}\langle f_1,\dots,f_s\rangle{{< /katex >}} はイデアルになります．
この {{< katex >}}\{f_1,\dots,f_s\}{{< /katex >}} を {{< katex >}}f_1,\dots,f_s{{< /katex >}} により **生成されるイデアル** といいます．

逆に，イデアル {{< katex >}}I{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} が存在し，{{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}} となることが知られています（**ヒルベルトの基底定理**）．
この {{< katex >}}f_1,\dots,f_s{{< /katex >}} を {{< katex >}}I{{< /katex >}} の **基底** といいます．

### アフィン多様体

{{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} に対し，
{{< katex display=true >}}
\bm{V}(f_1,\dots,f_s)=\{a\in k^n\mid \forall i\in\{1,2,\dots,s\}\,(f_i(a)=0)\}
{{< /katex >}}
を {{< katex >}}f_1,\dots,f_s{{< /katex >}} により定義される **アフィン多様体** といいます．
これは連立方程式
{{< katex display=true >}}
f_i(a)=0,\quad i=1,2,\dots,s
{{< /katex >}}
の解全体の集合です．

{{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} をイデアルとするとき，
{{< katex display=true >}}
  \bm{V}(I)=\{a\in k^n\mid \forall f\in I\,(f(a)=0)\}
{{< /katex >}}
とします．

{{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} をイデアルとするとき，{{< katex >}}I=\langle f_1,\dots,f_s\rangle{{< /katex >}} となる {{< katex >}}f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} が存在しますが，このとき
{{< katex display=true >}}
  \bm{V}(\langle f_1,\dots,f_s\rangle)=\bm{V}(f_1,\dots,f_s)
{{< /katex >}}
であることが知られています．

これは，特に {{< katex >}}\langle f_1,\dots,f_s\rangle=\langle g_1,\dots,g_t\rangle{{< /katex >}} ならば，
{{< katex display=true >}}
  \bm{V}(f_1,\dots,f_s)=\bm{V}(g_1,\dots,g_t)
{{< /katex >}}
であることも示しています．

一般に，連立方程式 {{< katex >}}f_1=0,\dots,f_s=0{{< /katex >}} が解きづらければ，解きやすいそれと等価な方程式 {{< katex >}}g_1=0,\dots,g_t=0{{< /katex >}} を解けばよいのですが，その方法として，それらが生成するイデアル {{< katex >}}\langle f_1,\dots,f_s\rangle{{< /katex >}} を考え，連立方程式が解きやすい {{< katex >}}I{{< /katex >}} の基底 {{< katex >}}g_1,\dots,g_t{{< /katex >}} を見つけてもよい，ということになります．

## 単項式順序

多項式の先頭項やアルゴリズムを述べるため，多項式の項の順序を考えます．

1変数の多項式 {{< katex >}}a_nX^n+a_{n-1}X^{n-1}+\cdots+a_1X+a_0{{< /katex >}} や，1次の多変数多項式 {{< katex >}}a_1X_1+a_2X_2+\cdots+a_nX_n{{< /katex >}} では，多項式の各項の順序は（決まらずとも）自然に考えられます．

つまり，前者であれば
{{< katex display=true >}}
X^n>X^{n-1}>\cdots>X>1
{{< /katex >}}
という順序を考え，後者であれば
{{< katex display=true >}}
X_1>X_2>\cdots>X_n
{{< /katex >}}
という順序を考え，この順に項を並べることにすればよいです．

一方で，一般の {{< katex >}}n{{< /katex >}} 次の多変数多項式の場合，その順序は自然に決まりません．
全次数をもとに並べることにしても，例えば，{{< katex >}}X^2Y^2,X^3Y,XY^3{{< /katex >}} の序列は直感的に明らかではありません．

ここで，単項式の順序について考えます．

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

任意の {{< katex >}}S\subseteq A{{< /katex >}} に対し，{{< katex >}}S\neq\emptyset{{< /katex >}} ならば，ある {{< katex >}}\alpha\in S{{< /katex >}} が存在して任意の {{< katex >}}\beta\in S{{< /katex >}} に対して {{< katex >}}\alpha\le\beta{{< /katex >}} が成り立つとき，{{< katex >}}\le{{< /katex >}} は **整列順序** であるといいます．

### 単項式順序

単項式に対する順序を定義します．
この順序は，{{< katex >}}\mathbb{N}^n{{< /katex >}} の順序に，多項式環の代数構造と両立するための性質を追加で要求したものです．

{{< katex >}}\mathbb{N}^n{{< /katex >}} 上の順序 {{< katex >}}>{{< /katex >}} が，
1. {{< katex >}}>{{< /katex >}} は {{< katex >}}\mathbb{N}^n{{< /katex >}} の全順序である．
2. {{< katex >}}\forall\alpha,\beta,\gamma\in\mathbb{N}^n\,(\alpha>\beta\implies \alpha+\gamma>\beta+\gamma){{< /katex >}}.
3. {{< katex >}}>{{< /katex >}} は {{< katex >}}\mathbb{N}^n{{< /katex >}} の整列順序である．

を満たすとき，{{< katex >}}>{{< /katex >}} は **単項式順序** であるといいます．

代表的な単項式順序は以下のとおりです．

* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}j=\min\{i\mid\alpha_i\neq\beta_i\}{{< /katex >}} において {{< katex >}}\alpha_j>\beta_j{{< /katex >}} であるとき {{< katex >}}\alpha>_{\mathrm{lex}}\beta{{< /katex >}} とする．
* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}|\alpha|>|\beta|{{< /katex >}} または {{< katex >}}|\alpha|=|\beta|\wedge\alpha>_{\mathrm{lex}}\beta{{< /katex >}} となるとき，{{< katex >}}\alpha>_{\mathrm{grlex}}\beta{{< /katex >}} とする．
* {{< katex >}}\alpha,\beta\in\mathbb{N}^n{{< /katex >}} に対し，{{< katex >}}|\alpha|>|\beta|{{< /katex >}} または {{< katex >}}|\alpha|=|\beta|\wedge(j=\max\{i\mid \alpha_i\neq\beta_i\}\implies \alpha_j<\beta_j){{< /katex >}} となるとき，{{< katex >}}\alpha>_{\mathrm{grevlex}}\beta{{< /katex >}} とする．

### 単項式順序に関連する定義

単項式順序 {{< katex >}}>{{< /katex >}} を固定し，{{< katex >}}\mathbb{N}^n{{< /katex >}} の部分集合上の {{< katex >}}\max{{< /katex >}} はこの順序の意味でとることとします．

{{< katex >}}X=(X_1,\dots,X_n)\in k[X_1,\dots,X_n]^n{{< /katex >}}, {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} に対し，
{{< katex display=true >}}
  X^{\alpha}=\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
とします．

{{< katex >}}f\in k[X_1,X_2,\dots,X_n]{{< /katex >}} が，有限個の {{< katex >}}\alpha\in\mathbb{N}^n{{< /katex >}} を除き，{{< katex >}}a_\alpha=0{{< /katex >}} であるような {{< katex >}}(a_{\alpha})_{\alpha\in\mathbb{N}^n}{{< /katex >}} によって
{{< katex display=true >}}
  f=\sum_{(\alpha_1,\dots,\alpha_n)\in\mathbb{N}^n}a_{(\alpha_1,\dots,\alpha_n)}\prod_{i=1}^nX_i^{\alpha_i}
{{< /katex >}}
と表されているとします．
このとき，
{{< katex display=true >}}
\begin{aligned}
  &\mathrm{multideg}\,f=\max\{\alpha\mid \alpha\in\mathbb{N}^n\wedge a_{\alpha}\neq0\},\\
  &\mathrm{LC}(f)=a_{\mathrm{multideg}\,f}\in k,\\
  &\mathrm{LM}(f)=X^{\mathrm{multideg}\,f}\in k[X_1,\dots,X_n],\\
  &\mathrm{LT}(f)=\mathrm{LC}(f)\mathrm{LM}(f)
\end{aligned}
{{< /katex >}}
と定めます．

特に {{< katex >}}\mathrm{multideg}\,f{{< /katex >}} を {{< katex >}}f{{< /katex >}} の **多重次数**，{{< katex >}}\mathrm{LT}(f){{< /katex >}} を {{< katex >}}f{{< /katex >}} の **先頭項** といいます．

これで，多変数多項式に対しても項の順序を考えることができ，先頭項という概念を導入できました．

## 多変数多項式の割り算と余り

{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s,h_1,\dots,h_s,r\in k[X_1,\dots,X_n]{{< /katex >}} を用いて {{< katex >}}f=h_1f_1+\cdots+f_sh_s+r{{< /katex >}} と書けて，{{< katex >}}r=0{{< /katex >}} であれば，{{< katex >}}f\in\langle f_1,\dots,f_s\rangle{{< /katex >}} とわかります（正確にいえばこれは十分条件で必要条件ではありません）．

1変数多項式 {{< katex >}}f\in k[X]{{< /katex >}} に対し，{{< katex >}}g\in k[X]{{< /katex >}} を零でない多項式とすると，{{< katex >}}f=qg+r{{< /katex >}}, {{< katex >}}r=0{{< /katex >}} または {{< katex >}}\deg r<\deg g{{< /katex >}} なる {{< katex >}}q,r\in k[X]{{< /katex >}} が存在することが知られていて，{{< katex >}}r{{< /katex >}} は，{{< katex >}}f{{< /katex >}} を {{< katex >}}h{{< /katex >}} で割った余り，と呼ばれています．

その拡張概念として，{{< katex >}}f,f_1,\dots,f_s\in k[X_1,\dots,X_n]{{< /katex >}} に対し，“{{< katex >}}f{{< /katex >}} を {{< katex >}}(f_1,\dots,f_s){{< /katex >}} で割った余りが {{< katex >}}r{{< /katex >}}” というものが作れないかを考えます．

{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の単項式順序を固定します．
{{< katex >}}F=(f_1,\dots,f_s)\in k[X_1,\dots,X_n]^s{{< /katex >}} とします．
このとき，
{{< katex display=true >}}
  f=q_1f_1+\cdots+q_sf_s+r
{{< /katex >}}
であり，{{< katex >}}r{{< /katex >}} は {{< katex >}}r=0{{< /katex >}} であるか，
{{< katex display=true >}}
  r=\sum_{\alpha\in\mathbb{N}^n}b_\alpha X^{\alpha}
{{< /katex >}}
のとき {{< katex >}}b_\alpha\not=0{{< /katex >}} なる {{< katex >}}X^\alpha{{< /katex >}} は {{< katex >}}\mathrm{LT}(f_1),\dots,\mathrm{LT}(f_s){{< /katex >}} のいずれでも割り切れないような，{{< katex >}}q_1,\dots,q_s,r\in k[X_1,\dots,X_n]{{< /katex >}} が存在することが知られています．
さらに，{{< katex >}}i=1,2,\dots,s{{< /katex >}} について {{< katex >}}q_if_i\neq0{{< /katex >}} ならば {{< katex >}}\mathrm{multideg}\,f\ge\mathrm{multideg}\,q_if_i{{< /katex >}} が成り立つことも示せます．

この {{< katex >}}r{{< /katex >}} は， {{< katex >}}f{{< /katex >}} を {{< katex >}}F{{< /katex >}} で割った **余り** と呼ばれ，{{< katex >}}\bar{f}^F{{< /katex >}} と表されます．

{{< katex >}}F=(f_1,\dots,f_s){{< /katex >}} の多項式の順番を入れ替えた多項式列を {{< katex >}}F^\sigma=(f_{\sigma(1)},f_{\sigma(2)},\dots,f_{\sigma(s)}){{< /katex >}} と書くと，一般には，{{< katex >}}\bar{f}^F\neq\bar{f}^{F^\sigma}{{< /katex >}} であることが知られています．
{{< katex >}}q_i\,(i=1,2,\dots,s){{< /katex >}} に関しても同様です．

この事実は，{{< katex >}}f\in k[X_1,\dots,X_n]{{< /katex >}} に対して，{{< katex >}}f_1,\dots,f_s,h_1,\dots,h_s,r\in k[X_1,\dots,X_n]{{< /katex >}} を用いて {{< katex >}}f=h_1f_1+\cdots+f_sh_s+r{{< /katex >}} と書けて，{{< katex >}}r\neq0{{< /katex >}} であったとしても，{{< katex >}}f_1,\dots,f_s{{< /katex >}} の順番を入れ替えると，余りが0になる場合があるので，{{< katex >}}r=\bar{f}^F=0{{< /katex >}} であることは {{< katex >}}f\in\langle f_1,\dots,f_s\rangle{{< /katex >}} であることの十分条件であっても必要条件ではない，ということを示唆しています．

## グレブナー基底

{{< katex >}}I{{< /katex >}} を {{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の {{< katex >}}\{0\}{{< /katex >}} でないイデアルとします．
{{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} の単項式順序を固定します．
{{< katex display=true >}}
\begin{aligned}
  &\mathrm{LT}(I)=\{\mathrm{LT}(f)\mid f\in I-\{0\}\},\\
  &\langle \mathrm{LT}(I)\rangle=\langle f\mid f\in\mathrm{LT}(I)\rangle
\end{aligned}
{{< /katex >}}
とします．

{{< katex >}}G=\{g_1,\dots,g_t\}\subseteq k[X_1,\dots,X_n]{{< /katex >}} が
{{< katex display=true >}}
  \langle\mathrm{LT}(g_1),\dots,\mathrm{LT}(g_t)\rangle=\langle\mathrm{LT}(I)\rangle
{{< /katex >}}
のとき，{{< katex >}}G{{< /katex >}} は {{< katex >}}I{{< /katex >}} の **グレブナー基底** といいます．
また，{{< katex >}}\langle\emptyset\rangle=\{0\}{{< /katex >}} として，{{< katex >}}\emptyset{{< /katex >}} は {{< katex >}}\{0\}{{< /katex >}} のグレブナー基底であるとします．

すべてのイデアル {{< katex >}}I{{< /katex >}} を {{< katex >}}k[X_1,\dots,X_n]{{< /katex >}} はグレブナー基底をもちます．
また，グレブナー基底は {{< katex >}}I{{< /katex >}} の基底であり，{{< katex >}}\bar{f}^G{{< /katex >}} は {{< katex >}}G=(g_1,\dots,g_t){{< /katex >}} の順序を入れ替えても変わりません（{{< katex >}}q_i\,(i=1,2,\dots,s){{< /katex >}} は変わります）．
一般の多項式列 {{< katex >}}F=(f_1,\dots,f_s){{< /katex >}} の場合は，多項式の順番を変えると余りが変わってしまいますが，余りに関しては，グレブナー基底であれば順番は気にしなくてよい，ということです．
また，これによって，{{< katex >}}G{{< /katex >}} が {{< katex >}}I{{< /katex >}} のグレブナー基底ならば，{{< katex >}}f\in I{{< /katex >}} であることと {{< katex >}}\bar{f}^G=0{{< /katex >}} は同値になります．

次に，{{< katex >}}G\subseteq k[X_1,\dots,X_n]{{< /katex >}} がイデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} のグレブナー基底であるかの判定ができることを説明します．

{{< katex >}}f,g\in k[X_1,\dots,X_n]{{< /katex >}} を0でない多項式とします．
{{< katex >}}\mathrm{multideg}\,f=\alpha,\mathrm{multideg}\,g=\beta{{< /katex >}} とし，{{< katex >}}\gamma_i=\max\{\alpha_i,\beta_i\}\,(i=1,2,\dots,n),\gamma=(\gamma_1,\dots,\gamma_n){{< /katex >}} とします．
このとき，
{{< katex display=true >}}
S(f,g)=\frac{X^\gamma}{\mathrm{LT}(f)}\cdot f-\frac{X^\gamma}{\mathrm{LT}(g)}\cdot g
{{< /katex >}}
を，{{< katex >}}f,g{{< /katex >}} の **{{< katex >}}S{{< /katex >}}多項式** といいます．

{{< katex >}}S{{< /katex >}}多項式を使うと，{{< katex >}}G\subseteq k[X_1,\dots,X_n]{{< /katex >}} がイデアル {{< katex >}}I\subseteq k[X_1,\dots,X_n]{{< /katex >}} のグレブナー基底であるかを判定することができます．

具体的には，{{< katex >}}G=\{g_1,\dots,g_t\}{{< /katex >}} のすべての {{< katex >}}i\neq j{{< /katex >}} となる添字について，{{< katex >}}\overline{S(g_i,g_j)}^G=0{{< /katex >}} であることと，{{< katex >}}G{{< /katex >}} が {{< katex >}}I{{< /katex >}} のグレブナー基底であることは同値です（**ブッフバーガーの判定条件**）．

さらに，多変数多項式の余りは有限回の手続きで求まり，ブッフバーガーの判定条件を用いると，与えられたイデアルのグレブナー基底も有限回の手続きで求まることが知られています．

## 参考文献

{{< anchor "cite:1" >}}[1] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門上 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.    
{{< anchor "cite:2" >}}[2] 	D. A. Cox, J. Little, D. O'Shea（大杉英史，土屋昭善訳），グレブナー基底と代数多様体入門下 原書4版 イデアル・多様体・アルゴリズム，丸善出版，東京，2023.

