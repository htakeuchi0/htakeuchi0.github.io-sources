---
title: "多項式"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 多項式

## 概要

実数 {{< katex >}}a_0,a_1,\dots,a_n{{< /katex >}} に対し，{{< katex >}}X{{< /katex >}} という文字を導入して作られる
{{< katex display=true >}}
a_nX^n+a_{n-1}X^{n-1}+\cdots+a_1X+a_0
{{< /katex >}}
は **多項式** と呼ばれます．
{{< katex >}}3X^2+2X-1{{< /katex >}} や {{< katex >}}X{{< /katex >}} がその例ですが，{{< katex >}}X,Y{{< /katex >}} という2種類の文字を使った {{< katex >}}3X^2-3XY+2X-Y+1{{< /katex >}} や，3つ以上の文字を使った {{< katex >}}3XYZ+2Y{{< /katex >}} も多項式と呼ばれます．

本ページでは，この多項式の定義についてまとめます．
用語や構成は [[1]](#cite:1) を参考にしました．

## 用語の定義

本論の前に，いくつかの用語と記号を定義します．

### 添字づけられた族

{{< katex >}}\Lambda,M{{< /katex >}} を集合とします．
{{< katex >}}a{{< /katex >}} を {{< katex >}}\Lambda{{< /katex >}} から {{< katex >}}M{{< /katex >}} への写像とします．
{{< katex >}}\lambda\in\Lambda{{< /katex >}} に対する {{< katex >}}a(\lambda){{< /katex >}} を {{< katex >}}a_{\lambda}{{< /katex >}} と表し，
{{< katex >}}a{{< /katex >}} を {{< katex >}}(a_{\lambda})_{\lambda\in\Lambda}{{< /katex >}} と表すことがあります．
{{< katex >}}(a_{\lambda})_{\lambda\in\Lambda}{{< /katex >}} を **添字づけられた族** といい，{{< katex >}}\Lambda{{< /katex >}} を **添字集合**，{{< katex >}}\lambda\in\Lambda{{< /katex >}} を **添字** と呼びます．

また，任意の {{< katex >}}\lambda\in\Lambda{{< /katex >}} に対して {{< katex >}}\alpha_\lambda=\alpha{{< /katex >}} となる {{< katex >}}\alpha\in M{{< /katex >}} が存在するとき，{{< katex >}}(\alpha_\lambda)_{\lambda\in\Lambda}{{< /katex >}} を {{< katex >}}(\alpha)_{\lambda\in\Lambda}{{< /katex >}} と書くことがあります．

例えば，{{< katex >}}\Lambda=\{1,2,\dots,\}{{< /katex >}} として {{< katex >}}M{{< /katex >}} を実数全体の集合 {{< katex >}}\mathbb{R}{{< /katex >}} とすると，{{< katex >}}(a_n)_{n\in\Lambda}{{< /katex >}} は実数列 {{< katex >}}(a_n)_{n=1,2,\dots}{{< /katex >}} となります．
よって，添字付けられた族は，数列を一般化した定義と捉えることもできます．

### 集合族

{{< katex >}}\mathfrak{M}{{< /katex >}} を集合とし，{{< katex >}}\mathfrak{M}{{< /katex >}} の元もまた集合であるとします．
{{< katex >}}\Lambda{{< /katex >}} を集合とし，{{< katex >}}M{{< /katex >}} を {{< katex >}}\Lambda{{< /katex >}} から {{< katex >}}\mathfrak{M}{{< /katex >}} への写像とします．
このとき，{{< katex >}}\Lambda{{< /katex >}} を添字集合とする添字付けられた族 {{< katex >}}(M_\lambda)_{\lambda\in\Lambda}{{< /katex >}} を **集合族** といいます．

### 直積

集合族 {{< katex >}}(M_\lambda)_{\lambda\in\Lambda}{{< /katex >}} に対して， {{< katex >}}x{{< /katex >}} を {{< katex >}}\Lambda{{< /katex >}} から {{< katex >}}\bigcup_{\mu\in\Lambda}M_\mu{{< /katex >}} への写像とします．
このとき，
{{< katex display=true >}}
\prod_{\lambda\in\Lambda}M_\lambda=\{(x_\lambda)_{\lambda\in\Lambda}\mid\forall\lambda\in\Lambda\,(x_\lambda\in M_\lambda)\}
{{< /katex >}}
を，集合族 {{< katex >}}(M_\lambda)_{\lambda\in\Lambda}{{< /katex >}} の **直積** といいます．

任意の {{< katex >}}\lambda\in\Lambda{{< /katex >}} について {{< katex >}}M_\lambda=M{{< /katex >}} なる集合 {{< katex >}}M{{< /katex >}} が存在するとき，{{< katex >}}\prod_{\lambda\in\Lambda}M_\lambda=\prod_{\lambda\in\Lambda}M{{< /katex >}} を {{< katex >}}M^\Lambda{{< /katex >}} と表します．

### 二項演算

{{< katex >}}S{{< /katex >}} を集合とします．
{{< katex >}}S\times S{{< /katex >}} から {{< katex >}}S{{< /katex >}} への写像を，{{< katex >}}S{{< /katex >}} における **二項演算** といいます．
{{< katex >}}\alpha:S\times S\to S{{< /katex >}} を {{< katex >}}S{{< /katex >}} における二項演算とするとき，{{< katex >}}x,y\in S{{< /katex >}} に対する {{< katex >}}\alpha(x,y){{< /katex >}} を {{< katex >}}x\alpha y{{< /katex >}} と書きます．

例えば，実数上の通常の加算 {{< katex >}}+{{< /katex >}} や乗算 {{< katex >}}\cdot{{< /katex >}} は実数全体の集合 {{< katex >}}\mathbb{R}{{< /katex >}} における二項演算ですが，{{< katex >}}x,y\in\mathbb{R}{{< /katex >}} に対して，{{< katex >}}+(x,y){{< /katex >}} や {{< katex >}}\cdot(x,y){{< /katex >}} を {{< katex >}}x+y,x\cdot y{{< /katex >}} と表します．

特に，{{< katex >}}\alpha{{< /katex >}} として記号 {{< katex >}}\cdot{{< /katex >}} を用いるとき，{{< katex >}}x\cdot y{{< /katex >}} は {{< katex >}}xy{{< /katex >}} と表されることがあります．

### 単位的可換半群

{{< katex >}}S{{< /katex >}} を集合とします．
{{< katex >}}S{{< /katex >}} における二項演算 {{< katex >}}+:S\times S\to S{{< /katex >}}, {{< katex >}}0\in S{{< /katex >}} に対して，
{{< katex display=true >}}
\begin{aligned}
  &\forall x,y,z\in S\,(x+(y+z)=(x+y)+z),\\
  &\forall x\in S\,(0+x=x+0=x),\\
  &\forall x,y\in S\,(y+x=x+y)
\end{aligned}
{{< /katex >}}
が成り立つとき，{{< katex >}}(S,+,0){{< /katex >}} は **単位的可換半群** をなすといいます．
単に，{{< katex >}}S{{< /katex >}} は単位的可換半群をなす，ということもあります．

詳しくは述べませんが，単位的可換半群をなすとは，単位的であること，可換であること，半群をなすことを意味します．
上式では，上から順に，半群をなすこと，単位的であること，可換であることを要請しています．

例えば，{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体の集合とするとき，{{< katex >}}(\mathbb{N},+,0){{< /katex >}} は単位的可換半群をなします．

### 単位的可換環

{{< katex >}}R{{< /katex >}} を集合とし，{{< katex >}}+,\cdot{{< /katex >}} を2つの異なる {{< katex >}}R{{< /katex >}} における二項演算とします．
{{< katex >}}0,1\in R{{< /katex >}} とし，{{< katex >}}0\neq1{{< /katex >}} とします．
{{< katex display=true >}}
\begin{aligned}
  &\forall x,y,z\in R\,(x+(y+z)=(x+y)+z),\\
  &\forall x\in R\,(0+x=x+0=x),\\
  &\forall x\in R\,\exists y\in R\,(y+x=x+y=0),\\
  &\forall x,y\in R\,(y+x=x+y),\\
  &\forall x,y,z\in R\,(x(yz)=(xy)z),\\
  &\forall x,y,z\in R\,(x(y+z)=xy+xz),\\
  &\forall x,y,z\in R\,((x+y)z=xz+yz),\\
  &\forall x,y\in R\,(yx=xy),\\
  &\forall x\in R\,(x1=1x=x)
\end{aligned}
{{< /katex >}}
であるとき，{{< katex >}}(R,+,\cdot,0,1){{< /katex >}} は **単位的可換環** をなすといいます．
単に，{{< katex >}}R{{< /katex >}} は単位的可換環をなす，ということもあります．

単位的可換半群と同じく，単位的可換環も，単位的であること，可換であること，環をなすことを意味しますが，
一番下の {{< katex >}}\forall x\in R\,(x1=1x=x){{< /katex >}} が単位的であること，その上の {{< katex >}}\forall x,y\in R\,(yx=xy){{< /katex >}} が可換であること，それ以外が環をなすことを要請しています．

例えば，{{< katex >}}\mathbb{Z}{{< /katex >}} を整数全体の集合とするとき，{{< katex >}}(\mathbb{Z},+,\cdot,0,1){{< /katex >}} は単位的可換環をなします．

### 体

{{< katex >}}k{{< /katex >}} を集合とし，{{< katex >}}+,\cdot{{< /katex >}} を2つの異なる {{< katex >}}k{{< /katex >}} における二項演算とします．
{{< katex >}}0,1\in R{{< /katex >}} とし，{{< katex >}}0\neq1{{< /katex >}} とします．
{{< katex display=true >}}
\begin{aligned}
  &\forall x,y,z\in k\,(x+(y+z)=(x+y)+z),\\
  &\forall x\in k\,(0+x=x+0=x),\\
  &\forall x\in k\,\exists y\in k\,(y+x=x+y=0),\\
  &\forall x,y\in k\,(y+x=x+y),\\
  &\forall x,y,z\in k\,(x(yz)=(xy)z),\\
  &\forall x,y,z\in k\,(x(y+z)=xy+xz),\\
  &\forall x,y,z\in k\,((x+y)z=xz+yz),\\
  &\forall x,y\in k\,(yx=xy),\\
  &\forall x\in k\,(x1=1x=x),\\
  &\forall x\in k\,\exists y\in k\,(x\neq0\implies xy=yx=1)
\end{aligned}
{{< /katex >}}
であるとき，{{< katex >}}(k,+,\cdot,0,1){{< /katex >}} は **体** をなすといいます．
単に，{{< katex >}}k{{< /katex >}} は体をなす，ということもあります．

体は単位的可換環に対して，最後の {{< katex >}}\forall x\in k\,\exists y\in k\,(x\neq0\implies xy=yx=1){{< /katex >}} を付け加えたものです．

例えば，{{< katex >}}\mathbb{Q}{{< /katex >}} を有理数全体の集合とするとき，{{< katex >}}(\mathbb{Q},+,\cdot,0,1){{< /katex >}} は体をなします．

### 単位的可換多元環

{{< katex >}}R,A{{< /katex >}} をそれぞれ単位的可換環とします．
{{< katex >}}R{{< /katex >}} の単位元を {{< katex >}}1_R{{< /katex >}} と表します．

{{< katex >}}R\times A{{< /katex >}} から {{< katex >}}A{{< /katex >}} への写像を {{< katex >}}\cdot:R\times A\to A{{< /katex >}} として，{{< katex >}}a,\in R,x\in A{{< /katex >}} に対する {{< katex >}}a\cdot x{{< /katex >}} を {{< katex >}}ax{{< /katex >}} と表すことにします．

{{< katex display=true >}}
\begin{aligned}
  &\forall a\in R\,\forall x,y\in A\,(a(x+y)=ax+ay),\\
  &\forall a,b\in R\,\forall x\in A\,((a+b)x=ax+bx),\\
  &\forall a,b\in R\,\forall x\in A((ab)x=a(bx)),\\
  &\forall x\in A\,(1_Rx=x),\\
  &\forall a\in R\,\forall x,y\in A\,(a(xy)=(ax)y=x(ay))
\end{aligned}
{{< /katex >}}
が成り立つとき，{{< katex >}}A{{< /katex >}} は {{< katex >}}R{{< /katex >}} の上の **単位的可換多元環** といいます．

{{< katex >}}k{{< /katex >}} を体とすると，体は単位的可換環の特別な場合なので，{{< katex >}}R=k{{< /katex >}} のとき，{{< katex >}}A{{< /katex >}} は {{< katex >}}k{{< /katex >}} の上の単位的可換多元環であるといいます．

## 多項式の定義

{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体の集合とします．
つまり，{{< katex >}}\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．

{{< katex >}}K{{< /katex >}} を空でない集合とします．
{{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} を以下の通り定義します．

{{< katex display=true >}}
\mathbb{N}^{(K)}=\left\{\left.(x_{\kappa})_{\kappa\in K}\in\mathbb{N}^K\,\right|\,\text{有限個の } \kappa\in K \text{ を除いて } x_{\kappa}=0\right\}.
{{< /katex >}}

{{< katex >}}(x_{\kappa})_{\kappa\in K}{{< /katex >}}, {{< katex >}}(y_{\kappa})_{\kappa\in K}{{< /katex >}} に対し，{{< katex >}}(x_{\kappa}+y_{\kappa})_{\kappa \in K}{{< /katex >}} を考えると，{{< katex >}}x_{\kappa}+y_{\kappa}\neq0{{< /katex >}} となる {{< katex >}}\kappa\in K{{< /katex >}} は有限個なので，{{< katex >}}(x_{\kappa}+y_{\kappa})_{\kappa\in K}\in\mathbb{N}^{(K)}{{< /katex >}} となります．

これをもとに，{{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} 上の二項演算 {{< katex >}}+{{< /katex >}} を以下の通り定義します．

{{< katex display=true >}}
  +:\mathbb{N}^{(K)}\times\mathbb{N}^{(K)}\ni((x_{\kappa})_{\kappa\in K},(y_{\kappa})_{\kappa\in K})\mapsto(x_{\kappa}+y_{\kappa})_{\kappa\in K}\in\mathbb{N}^{(K)}
{{< /katex >}}

{{< katex >}}x,y\in\mathbb{N}^{(K)}{{< /katex >}} に対して {{< katex >}}+(x,y){{< /katex >}} を {{< katex >}}x+y{{< /katex >}} と書くと，{{< katex >}}y+x=x+y{{< /katex >}} となります．
よって，{{< katex >}}0=(0)_{\kappa\in K}{{< /katex >}} とすると，{{< katex >}}(\mathbb{N}^{(K)},+,0){{< /katex >}} は **単位的可換半群** をなすといえます．

{{< katex >}}k{{< /katex >}} を体とします．{{< katex >}}k^{(\mathbb{N}^{(K)})}{{< /katex >}} を，
{{< katex display=true >}}
k^{(\mathbb{N}^{(K)})}=\left\{\left.(x_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}\in k^{\mathbb{N}^{(K)}}\right|\text{有限個の } \lambda\in\mathbb{N}^{(K)} \text{ を除いて } x_{\lambda}=0\right\}
{{< /katex >}} 

とします．

{{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} に対して {{< katex >}}e_\lambda\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} を，{{< katex >}}e_\lambda=(\delta_{\kappa\lambda})_{\kappa\in\mathbb{N}^{(K)}}{{< /katex >}} で定めます．
ただし，{{< katex >}}\delta_{ij}{{< /katex >}} は

{{< katex display=true >}}
\delta_{ij}=\begin{cases}
1,\quad i=j,\\
0,\quad i\neq j
\end{cases}
{{< /katex >}}

で定めます（クロネッカーのデルタ）．

すると，任意の {{< katex >}}u\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} に対して，有限個の {{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} を除いて {{< katex >}}a_\lambda=0{{< /katex >}} であるような {{< katex >}}(a_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}} が存在し，

{{< katex display=true >}}
u=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda
{{< /katex >}}

と表せます．

集合 {{< katex >}}E\subseteq k^{(\mathbb{N}^{(K)})}{{< /katex >}} を {{< katex >}}E=\{e_\lambda\mid\lambda\in\mathbb{N}^{(K)}\}{{< /katex >}} とします．
集合 {{< katex >}}E{{< /katex >}} 上の二項演算 {{< katex >}}\cdot{{< /katex >}} を以下で定義します．

{{< katex display=true >}}
  \cdot:E\times E\ni(e_{(x_{\kappa})_{\kappa\in K}},e_{(y_{\kappa})_{\kappa\in K}})\mapsto e_{(x_{\kappa}+y_{\kappa})_{\kappa\in K}}\in E.
{{< /katex >}}

{{< katex >}}e,f\in E{{< /katex >}} に対して {{< katex >}}\cdot(e,f){{< /katex >}} を {{< katex >}}ef{{< /katex >}} と書くと，{{< katex >}}ef=fe{{< /katex >}} となります．
また，{{< katex >}}1_{k^{(\mathbb{N}^{(K)})}}=e_{(0)_{\kappa\in K}}{{< /katex >}} とおくと，{{< katex >}}(E,\cdot,1_{k^{(\mathbb{N}^{(K)})}}){{< /katex >}} も **単位的可換半群** をなします．

{{< katex >}}k^{(\mathbb{N}^{(K)})}{{< /katex >}} 上の二項演算 {{< katex >}}+,\cdot{{< /katex >}} を以下のように定めます．
{{< katex >}}u,v\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} に対して，
{{< katex display=true >}}
\begin{aligned}
  &u=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda,\\
  &v=\sum_{\mu\in\mathbb{N}^{(K)}}b_\mu e_\mu
\end{aligned}
{{< /katex >}}
とします．
このとき，
{{< katex display=true >}}
\begin{aligned}
  &u+v=\sum_{\lambda\in\mathbb{N}^{(K)}}(a_\lambda+b_\lambda)e_\lambda,\\
  &uv=\sum_{\begin{subarray}{c}\lambda,\mu,\nu\in\mathbb{N}^{(K)},\\[3pt]\lambda+\mu=\nu\end{subarray}}a_\lambda b_\mu e_\nu
\end{aligned}
{{< /katex >}}
とします．

{{< katex >}}0_{k^{(\mathbb{N}^{(K)})}}=(0)_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}}, {{< katex >}}1_{k^{(\mathbb{N}^{(K)})}}=e_{(0)_{\kappa\in K}}{{< /katex >}} とすると，{{< katex >}}(k^{(\mathbb{N}^{(K)})},+,\cdot,0_{k^{(\mathbb{N}^{(K)})}},1_{k^{(\mathbb{N}^{(K)})}}){{< /katex >}} は **単位的可換環** をなします．

ここで，{{< katex >}}P(k,K)=k^{(\mathbb{N}^{(K)})}{{< /katex >}} と表すことにして，{{< katex >}}P(k,K){{< /katex >}} を **{{< katex >}}K{{< /katex >}}の上の多項式環** と呼び，{{< katex >}}k{{< /katex >}} を {{< katex >}}P(k,K){{< /katex >}} の **係数体** と呼びます．

{{< katex >}}\kappa\in K{{< /katex >}} に対し，{{< katex >}}\delta_\kappa\in\mathbb{N}^{(K)}{{< /katex >}} を {{< katex >}}\delta_\kappa=(\delta_{\nu\kappa})_{\nu\in K}{{< /katex >}} とします．
このとき，{{< katex >}}\kappa\in K{{< /katex >}} に対し，{{< katex >}}X_\kappa\in P(k,K){{< /katex >}} を {{< katex >}}X_\kappa=e_{\delta_\kappa}{{< /katex >}} とします．

すると，{{< katex >}}(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}{{< /katex >}} に対する {{< katex >}}e_{(n_{\kappa})_{\kappa\in K}}{{< /katex >}} は

{{< katex display=true >}}
e_{(n_{\kappa})_{\kappa\in K}}=\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

と表されます．
ただし，{{< katex >}}e_{(0)_{\kappa\in K}}=1_{P(k,K)}{{< /katex >}} です．

先ほど述べたように，任意の {{< katex >}}u\in P(k,K){{< /katex >}} に対して，有限個の {{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} を除いて {{< katex >}}a_\lambda=0{{< /katex >}} であるような {{< katex >}}(a_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}} が存在し，

{{< katex display=true >}}
u=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda
{{< /katex >}}

が成り立ちますが，これはさらに，

{{< katex display=true >}}
u=\sum_{(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}}a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

と表せます．

このように書かれた {{< katex >}}u{{< /katex >}} を **不定元** {{< katex >}}X_\kappa{{< /katex >}} の {{< katex >}}k{{< /katex >}} の上の **多項式** と呼びます．

{{< katex display=true >}}
a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

を多項式 {{< katex >}}a{{< /katex >}} の **項** といい，{{< katex >}}a_{(n_\kappa)_{\kappa\in K}}{{< /katex >}} をその項の **係数**，または {{< katex >}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}{{< /katex >}} の **係数** といいます．
さらに，{{< katex >}}a_{(0)_{\kappa\in K}}1_{k[X_\kappa]_{\kappa\in K}}{{< /katex >}} と {{< katex >}}a_{(0)_{\kappa\in K}}{{< /katex >}} を同一視し，{{< katex >}}a_{(0)_{\kappa\in K}}{{< /katex >}} を {{< katex >}}u{{< /katex >}} の **定数項** といいます．

{{< katex >}}P(k,K){{< /katex >}} の元をすべて {{< katex >}}\{X_\kappa\}_{\kappa\in K}{{< /katex >}} を使って表すとき，，{{< katex >}}P(k,K){{< /katex >}} を {{< katex >}}k[X_\kappa]_{\kappa\in K}{{< /katex >}} と書き，**{{< katex >}}\{X_\kappa\}_{\kappa\in K}{{< /katex >}} の多項式環** と呼びます．
特に，{{< katex >}}K{{< /katex >}}が有限集合なら {{< katex >}}X_1,X_2,\dots,X_n{{< /katex >}} と書いて，{{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} と書いたり，{{< katex >}}n=1{{< /katex >}} なら {{< katex >}}k[X]{{< /katex >}} と書いたりします．

## 代入

{{< katex >}}P(k,K)=k[X_\kappa]_{\kappa\in K}{{< /katex >}} を多項式環とし，{{< katex >}}\phi:K\to k[X_\kappa]_{\kappa\in K}{{< /katex >}} を
{{< katex display=true >}}
\phi:K\ni \kappa\mapsto X_\kappa\in k[X_\kappa]_{\kappa\in K}
{{< /katex >}}
で定めます．
{{< katex >}}(P',+,\cdot,0_{P'},1_{P'}){{< /katex >}} を {{< katex >}}k{{< /katex >}} の上の単位的可換多元環とし，{{< katex >}}\alpha{{< /katex >}} を {{< katex >}}K{{< /katex >}} から {{< katex >}}P'{{< /katex >}} への写像とします．
このとき，
{{< katex display=true >}}
\begin{aligned}
&\alpha=F\circ \phi,\\
&\forall u,v\in k[X_\kappa]_{\kappa\in K}\,(F(u+v)=F(u)+F(v)),\\
&\forall u,v\in k[X_\kappa]_{\kappa\in K}\,(F(uv)=F(u)F(v)),\\
&F(1_{k[X_\kappa]_{\kappa\in K}})=1_{P'}
\end{aligned}
{{< /katex >}}
を満たす {{< katex >}}F:k[X_\kappa]_{\kappa\in K}\to P'{{< /katex >}} が存在することが知られています．

この {{< katex >}}F{{< /katex >}} を **代入写像** といいます．

{{< katex >}}u\in k[X_\kappa]_{\kappa\in K}{{< /katex >}} とすると，
{{< katex display=true >}}
u=\sum_{(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}}a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}
と表せますが，この {{< katex >}}F{{< /katex >}} による像 {{< katex >}}F(u){{< /katex >}} は
{{< katex display=true >}}
F(u)=F\left(\sum_{(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}}a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}\right)=\sum_{(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}}a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}\alpha_\kappa^{n_\kappa}
{{< /katex >}}
となります．

特に {{< katex >}}(n_\kappa)_{\kappa\in K}=(0)_{\kappa\in K}{{< /katex >}} に対応する級数 {{< katex >}}F(u){{< /katex >}} の項は {{< katex >}}a_{(0)_{\kappa\in K}}1_{P'}{{< /katex >}} になります．

この {{< katex >}}F(u)\in P'{{< /katex >}} を，{{< katex >}}u{{< /katex >}} に {{< katex >}}(\alpha_\kappa)_{\kappa\in K}{{< /katex >}} を代入したときの {{< katex >}}u{{< /katex >}} の **値** といいます．

## おわりに

本ページでは，多項式の定義についてまとめました．

多項式の係数は体の元である必要はないのですが，今後の議論のために体に限定しています．
また，詳細についてはほとんど触れられていないので，詳しい議論は [[1]](#cite:1) をご参照ください．

## 参考文献

{{< anchor "cite:1" >}}[1] 	彌永 昌吉，小平 邦彦，現代数学概説Ⅰ，岩波書店，東京，1961.
