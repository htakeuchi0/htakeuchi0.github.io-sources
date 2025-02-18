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

## 多項式の定義

{{< katex >}}\mathbb{N}{{< /katex >}} を0以上の整数全体の集合とします．
つまり，{{< katex >}}\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．

{{< katex >}}K{{< /katex >}} を空でない集合とします．
{{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} を以下の通り定義します．

{{< katex display=true >}}
\mathbb{N}^{(K)}=\left\{\left.(x_{\kappa})_{\kappa\in K}\in\prod_{\kappa\in K}\mathbb{N}\,\right|\,\text{有限個の } \kappa\in K \text{ を除いて } x_{\kappa}=0\right\}.
{{< /katex >}}

{{< katex >}}(x_{\kappa})_{\kappa\in K}{{< /katex >}}, {{< katex >}}(y_{\kappa})_{\kappa\in K}{{< /katex >}} に対し，{{< katex >}}(x_{\kappa}+y_{\kappa})_{\kappa \in K}{{< /katex >}} を考えると，{{< katex >}}x_{\kappa}+y_{\kappa}\neq0{{< /katex >}} となる {{< katex >}}\kappa\in K{{< /katex >}} は有限個なので，{{< katex >}}(x_{\kappa}+y_{\kappa})\in\mathbb{N}^{(K)}{{< /katex >}} となります．

これをもとに，{{< katex >}}\mathbb{N}^{(K)}{{< /katex >}} 上の二項演算 {{< katex >}}+{{< /katex >}} を以下の通り定義します．

{{< katex display=true >}}
  +:\mathbb{N}^{(K)}\times\mathbb{N}^{(K)}\ni((x_{\kappa})_{\kappa\in K},(y_{\kappa})_{\kappa\in K})\mapsto(x_{\kappa}+y_{\kappa})_{\kappa\in K}\in\mathbb{N}^{(K)}
{{< /katex >}}

ここで，{{< katex >}}x,y\in\mathbb{N}^{(K)}{{< /katex >}} に対して {{< katex >}}+(x,y){{< /katex >}} を {{< katex >}}x+y{{< /katex >}} と書くと，{{< katex >}}y+x=x+y{{< /katex >}} となります．
よって，{{< katex >}}0=(0)_{\kappa\in K}{{< /katex >}} とすると，{{< katex >}}(\mathbb{N}^{(K)},+,0){{< /katex >}} は **単位的可換半群** をなすといえます．

{{< katex >}}k{{< /katex >}} を体とします．{{< katex >}}k^{(\mathbb{N}^{(K)})}{{< /katex >}} を，
{{< katex display=true >}}
k^{(\mathbb{N}^{(K)})}=\left\{\left.(x_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}\in\prod_{\lambda\in\mathbb{N}^{(K)}}k\,\right|\,\text{有限個の } \lambda\in\mathbb{N}^{(K)} \text{ を除いて } x_{\lambda}=0\right\}.
{{< /katex >}} 

とします．

{{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} に対して {{< katex >}}e_\lambda\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} を，{{< katex >}}e_\lambda=(\delta_{\kappa\lambda})_{\kappa\in\mathbb{N}^{(K)}}{{< /katex >}} で定めます．
ただし，{{< katex >}}\delta_{ij}{{< /katex >}} はクロネッカーのデルタで，

{{< katex display=true >}}
\delta_{ij}=\begin{cases}
1,\quad i=j,\\
0,\quad i\neq j
\end{cases}
{{< /katex >}}
とします．

このとき，任意の {{< katex >}}a\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} に対して，有限個の {{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} を除いて {{< katex >}}a_\lambda=0{{< /katex >}} であるような {{< katex >}}(a_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}} が存在し，

{{< katex display=true >}}
a=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda
{{< /katex >}}

が成り立ちます．

集合 {{< katex >}}E\subseteq k^{(\mathbb{N}^{(K)})}{{< /katex >}} を {{< katex >}}E=\{e_\lambda\mid\lambda\in\mathbb{N}^{(K)}\}{{< /katex >}} とします．
ここで，集合 {{< katex >}}E{{< /katex >}} 上の二項演算 {{< katex >}}\cdot{{< /katex >}} を以下で定義します．

{{< katex display=true >}}
  \cdot:E\times E\ni(e_{(x_{\kappa})_{\kappa\in K}},e_{(y_{\kappa})_{\kappa\in K}})\mapsto e_{(x_{\kappa}+y_{\kappa})_{\kappa\in K}}\in E.
{{< /katex >}}

ここで，{{< katex >}}e,f\in E{{< /katex >}} に対して {{< katex >}}\cdot(e,f){{< /katex >}} を {{< katex >}}ef{{< /katex >}} と書くと，{{< katex >}}ef=fe{{< /katex >}} となります．
また，{{< katex >}}1=e_{(0)_{\kappa\in K}}{{< /katex >}} とおくと，{{< katex >}}(E,\cdot,1){{< /katex >}} も単位的可換半群をなします．

このとき，{{< katex >}}k^{(\mathbb{N}^{(K)})}{{< /katex >}} 上の二項演算 {{< katex >}}+,\cdot{{< /katex >}} を以下のように定めます．
{{< katex >}}x,y\in k^{(\mathbb{N}^{(K)})}{{< /katex >}} に対して，
{{< katex display=true >}}
\begin{aligned}
  &x=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda,\\
  &y=\sum_{\mu\in\mathbb{N}^{(K)}}b_\mu e_\mu
\end{aligned}
{{< /katex >}}
とします．
このとき，
{{< katex display=true >}}
\begin{aligned}
  &x+y=\sum_{\lambda\in\mathbb{N}^{(K)}}(a_\lambda+b_\lambda)e_\lambda,\\
  &xy=\sum_{\begin{subarray}{c}\lambda,\mu,\nu\in\mathbb{N}^{(K)},\\[3pt]\lambda+\mu=\nu\end{subarray}}a_\lambda b_\mu e_\nu
\end{aligned}
{{< /katex >}}
とします．

{{< katex >}}0=(0)_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}}, {{< katex >}}1=e_{(0)_{\kappa\in K}}{{< /katex >}} とすると，{{< katex >}}(k^{(\mathbb{N}^{(K)})},+,\cdot,0,1){{< /katex >}} は環をなします．

ここで，{{< katex >}}P(k,K)=k^{(\mathbb{N}^{(K)})}{{< /katex >}} と表すことにして，これを **{{< katex >}}K{{< /katex >}}の上の多項式環** と呼び，{{< katex >}}k{{< /katex >}} を {{< katex >}}P(k,K){{< /katex >}} の **係数体** と呼びます．

{{< katex >}}\kappa\in K{{< /katex >}} に対し，{{< katex >}}\delta_\kappa\in\mathbb{N}^{(K)}{{< /katex >}} を {{< katex >}}\delta_\kappa=(\delta_{\nu\kappa})_{\nu\in K}{{< /katex >}} とします．
このとき，{{< katex >}}\kappa\in K{{< /katex >}} に対し，{{< katex >}}X_\kappa\in P(k,K){{< /katex >}} を {{< katex >}}X_\kappa=e_{\delta_\kappa}{{< /katex >}} とします．

すると，{{< katex >}}(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}{{< /katex >}} に対する {{< katex >}}e_{(n_{\kappa})_{\kappa\in K}}{{< /katex >}} は

{{< katex display=true >}}
e_{(n_{\kappa})_{\kappa\in K}}=\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

と表されます．

次に，任意の {{< katex >}}a\in P(k,K){{< /katex >}} に対して，有限個の {{< katex >}}\lambda\in\mathbb{N}^{(K)}{{< /katex >}} を除いて {{< katex >}}a_\lambda=0{{< /katex >}} であるような {{< katex >}}(a_{\lambda})_{\lambda\in\mathbb{N}^{(K)}}{{< /katex >}} が存在し，

{{< katex display=true >}}
a=\sum_{\lambda\in\mathbb{N}^{(K)}}a_\lambda e_\lambda
{{< /katex >}}

が成り立ちますが，これはさらに，

{{< katex display=true >}}
a=\sum_{(n_\kappa)_{\kappa\in K}\in\mathbb{N}^{(K)}}a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

と表せます．

このように書かれた {{< katex >}}a{{< /katex >}} を **不定元** {{< katex >}}X_\kappa{{< /katex >}} の {{< katex >}}k{{< /katex >}} の上の **多項式** と呼びます．

{{< katex display=true >}}
a_{(n_\kappa)_{\kappa\in K}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}
{{< /katex >}}

を多項式 {{< katex >}}a{{< /katex >}} の **項** といい，{{< katex >}}a_{(n_\kappa)_{\kappa\in K}}{{< /katex >}} をその項または {{< katex >}}\prod_{\kappa\in K}X_\kappa^{n_\kappa}{{< /katex >}} の **係数** といいます．
さらに，すべての {{< katex >}}\kappa\in K{{< /katex >}} について {{< katex >}}n_\kappa=0{{< /katex >}} になる項を {{< katex >}}a{{< /katex >}} の **定数項** といいます．

この記号を使って，{{< katex >}}P(k,K){{< /katex >}} を {{< katex >}}k[X_\kappa]_{\kappa\in K}{{< /katex >}} と書き，**{{< katex >}}\{X_\kappa\}_{\kappa\in K}{{< /katex >}} の多項式環** と呼びます．
特に，{{< katex >}}K{{< /katex >}}が有限集合なら {{< katex >}}X_1,X_2,\dots,X_n{{< /katex >}} と書いて，{{< katex >}}k[X_1,X_2,\dots,X_n]{{< /katex >}} と書いたり，{{< katex >}}n=1{{< /katex >}} なら {{< katex >}}k[X]{{< /katex >}} と書いたりします．



## おわりに

## 参考文献
