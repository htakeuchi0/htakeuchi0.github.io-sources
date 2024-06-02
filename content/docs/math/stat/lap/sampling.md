---
title: "ラプラス分布や切断ラプラス分布からのサンプリング"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# ラプラス分布や切断ラプラス分布からのサンプリング

## 概要

[ラプラス分布と切断ラプラス分布]({{< ref trunclap >}}) のページでは，ラプラス分布と切断ラプラス分布の定義を述べ，切断ラプラス分布の確率密度関数，累積分布関数を具体的に求めました．

本ページでは，ラプラス分布や切断ラプラス分布からのサンプリングの方法について述べます．

## 逆関数法

{{< katex >}}X{{< /katex >}} を確率変数とし，その分布に従う乱数をサンプリングする方法として，**逆関数法** と呼ばれる方法が知られています．

{{< katex >}}F_X{{< /katex >}} を {{< katex >}}X{{< /katex >}}の累積分布関数とします．
{{< katex >}}F_X{{< /katex >}} は単調増加関数です．
{{< katex >}}F_X^*:[0,1]\to\mathbb{R}{{< /katex >}} を，{{< katex >}}F_X^*(u)=\inf\{x\mid F(x)\ge u\}{{< /katex >}} とします．
ここで，{{< katex >}}U{{< /katex >}} を区間 {{< katex >}}[0,1]{{< /katex >}} 上の一様分布とします．
つまり，
{{< katex display >}}
  f_U(u)=\begin{cases}
    1,& 0\le u\le 1,\\
    0,&\text{otherwise}
  \end{cases}
{{< /katex >}}
とします．
{{< katex >}}Z=F_X^*(U){{< /katex >}} とすると，
{{< katex display >}}
\begin{aligned}
  F_Z(z)&=P([Z\le z])\\
  &=P([F^*_X(U)\le z])\\
\end{aligned}
{{< /katex >}}
となりますが，{{< katex >}}F^*_X(u)\le z{{< /katex >}} であることと {{< katex >}}u\le F_X(z){{< /katex >}} であることは同じことなので，
{{< katex display >}}
\begin{aligned}
  F_Z(z)&=P([F^*_X(U)\le z])\\
  &=P([U\le F_X(z)])\\
  &=F_U(F_X(z))\\
  &=F_X(z)
\end{aligned}
{{< /katex >}}
となり，{{< katex >}}Z{{< /katex >}} の累積分布関数は {{< katex >}}X{{< /katex >}} の累積分布関数に一致します．

したがって，{{< katex >}}u{{< /katex >}} を区間 {{< katex >}}[0,1]{{< /katex >}} 上の一様分布に従う乱数とし，{{< katex >}}x=F_X^*(u){{< /katex >}} と変換すると，{{< katex >}}X{{< /katex >}} の従う分布からのサンプリングができることになります．
特に，{{< katex >}}F_X{{< /katex >}} が可逆であれば，{{< katex >}}F_X^*=F_X^{-1}{{< /katex >}} なので，{{< katex >}}x=F_X^{-1}(u){{< /katex >}} と計算できます．

## ラプラス分布からのサンプリング

[前ページ]({{< ref trunclap >}}) にあわせて，{{< katex >}}Y{{< /katex >}} をパラメータ {{< katex >}}\mu,b{{< /katex >}} のラプラス分布に従う確率変数とします．
逆関数法でラプラス分布からのサンプリングを行うには，{{< katex >}}Y{{< /katex >}} の累積分布関数 {{< katex >}}F_Y{{< /katex >}} の逆関数 {{< katex >}}F_Y^{-1}{{< /katex >}} を求める必要があります．
ここで，{{< katex >}}F_Y{{< /katex >}} は狭義単調増加関数であることに注意してください．

ラプラス分布に従う確率変数の累積分布関数は，[前ページ]({{< ref trunclap >}}) で述べたとおり，
{{< katex display >}}
F_Y(y;\mu,b)=\begin{cases}
\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y<\mu,\\
1-\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y\ge\mu
\end{cases}
{{< /katex >}}
となります．

{{< katex >}}0\le u\le 1/2{{< /katex >}} とします．
{{< katex >}}y<\mu{{< /katex >}} において，
{{< katex display >}}
  \frac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right)=u
{{< /katex >}}
を満たす {{< katex >}}y{{< /katex >}} を求めると，
{{< katex display >}}
  |y-\mu|=-b\log 2u
{{< /katex >}}
となりますが，{{< katex >}}y<\mu{{< /katex >}} なので，
{{< katex display >}}
  y=\mu+b\log 2u
{{< /katex >}}
となります．

次に，{{< katex >}}1/2<u\le 1{{< /katex >}} とします．
{{< katex >}}y\ge\mu{{< /katex >}} において，
{{< katex display >}}
  1-\frac{1}{2}\exp\left(-\frac{|y-\mu|}{b}\right)=u
{{< /katex >}}
を満たす {{< katex >}}y{{< /katex >}} を求めると，
{{< katex display >}}
  |y-\mu|=-b\log 2(1-u)
{{< /katex >}}
となりますが，{{< katex >}}y\ge\mu{{< /katex >}} なので，
{{< katex display >}}
  y=\mu-b\log 2(1-u)
{{< /katex >}}
となります．

よって，
{{< katex display >}}
  y=\begin{cases}
    \mu+b\log 2u,&0\le u\le1/2,\\
    \mu-b\log 2(1-u),&1/2<u\le1
  \end{cases}
{{< /katex >}}
となります．

ここで，{{< katex >}}w=u-1/2{{< /katex >}} とすると，
{{< katex display >}}
  y=\begin{cases}
    \mu+b\log(1+2w),&-1/2\le w\le0,\\
    \mu-b\log(1-2w)),&0<w\le1/2
  \end{cases}
{{< /katex >}}
となるので，
{{< katex display >}}
  \mathrm{sgn}(w)=\begin{cases}
    +1,\quad w\ge0,\\
    -1,\quad w<0
  \end{cases}
{{< /katex >}}
とすると，
{{< katex display >}}
  \begin{aligned}
  y&=\mu-\mathrm{sgn}(w)b\log(1-2\mathrm{sgn}(w)w)\\
  &=\mu-\mathrm{sgn}(w)b\log(1-2|w|)\\
  \end{aligned}
{{< /katex >}}
と書けます．
ここで，{{< katex >}}\mathrm{sgn}(w)w=|w|{{< /katex >}} を使いました．

したがって，次が成り立ちます．

{{< hint info >}}
  {{< theorem-label name="Proposition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\) とする．\\(W\\) を区間 \\([-1/2,1/2]\\) 上の一様分布に従う連続型確率変数とすると，\\(Y=\mu-\mathrm{sgn}(W)b\log(1-2|W|)\\) は，パラメータ \\(\mu,b\\) のラプラス分布に従う連続型確率変数である．
{{< /hint >}}

## 切断ラプラス分布からのサンプリング

[前節]({{< ref "#ラプラス分布からのサンプリング" >}})と同様に，切断ラプラス分布からのサンプリングの方法を導きます．

## まとめ

