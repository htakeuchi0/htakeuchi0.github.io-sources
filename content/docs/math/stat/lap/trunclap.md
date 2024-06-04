---
title: "ラプラス分布と切断ラプラス分布"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# ラプラス分布と切断ラプラス分布

## 概要

本ページでは，ラプラス分布と切断ラプラス分布の定義を述べ，切断ラプラス分布の確率密度関数，累積分布関数を具体的に求めます．

## ラプラス分布と切断ラプラス分布の定義

まずは，ラプラス分布を定義します．
切断ラプラス分布に従う確率変数に {{< katex >}}X{{< /katex >}} の文字を使うため，ラプラス分布に従う確率変数には {{< katex >}}Y{{< /katex >}} を使います．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\) とする．
連続的確率変数 \\(Y:(\Omega,\mathfrak{F})\to(\mathbb{R},\mathfrak{B}[\mathbb{R}])\\) の確率密度関数 \\(f_Y\\) が
\\[
  f_Y(y;\mu,b)=\frac{1}{2b}\exp\left(-\frac{|y-\mu|}{b}\right)
\\]
と表されるとき，\\(Y\\) を **ラプラス分布** に従う確率変数であるという．
{{< /hint >}}

ラプラス分布はどのような実数でもとり得る分布ですが，これを区間 {{< katex >}}[A,B]\,(A\le B){{< /katex >}} に制限した分布を **切断ラプラス分布** といいます．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\), \\(A,B\in\mathbb{R}\\), \\(A\le B\\) とする．連続的確率変数 \\(X:(\Omega,\mathfrak{F})\to(\mathbb{R},\mathfrak{B}[\mathbb{R}])\\) の確率密度関数 \\(f_X\\) が
\\[
  f_X(x;\mu,b,A,B)=\begin{cases}
   \dfrac{1}{2bC}\exp\left(-\dfrac{|y-\mu|}{b}\right),&A\le x\le B,\\\\
   0,&\text{otherwise}
  \end{cases}
\\]
と表されるとき，\\(X\\) を **切断ラプラス分布** に従う確率変数であるという．
{{< /hint >}}

## 切断ラプラス分布の確率密度関数

以下，Definition 2 の {{< katex >}}C{{< /katex >}} を具体的に求めてみます．
{{< katex >}}C{{< /katex >}} は {{< katex >}}\mu,b,A,B{{< /katex >}} から決まるので， {{< katex >}}C_{\mu,b}(A,B){{< /katex >}} と表します．

まず，{{< katex >}}Y{{< /katex >}} をパラメータ {{< katex >}}\mu,b{{< /katex >}} であるラプラス分布に従う確率変数としたとき，その累積分布関数 {{< katex >}}F_Y(y;\mu,b){{< /katex >}} を求めます．

累積分布関数の定義より，
{{< katex display >}}
\begin{aligned}
  F_Y(y;\mu,b)&=\int_{-\infty}^yf_Y(t;\mu,b)dt\\
  &=\int_{-\infty}^y\frac{1}{2b}\exp\left(-\frac{|t-\mu|}{b}\right)dt
\end{aligned}
{{< /katex >}}
となります．
積分範囲を {{< katex >}}y<\mu{{< /katex >}}, {{< katex >}}y\ge\mu{{< /katex >}} に分けて計算を行います．

まず {{< katex >}}y<\mu{{< /katex >}} のとき，{{< katex >}}t<y{{< /katex >}} ならば {{< katex >}}t-\mu<y-\mu<0{{< /katex >}} なので，
{{< katex display >}}
\begin{aligned}
  F_Y(y;\mu,b)&=\int_{-\infty}^y\frac{1}{2b}\exp\left(\frac{t-\mu}{b}\right)dt\\
  &=\left[\frac{1}{2}\exp\left(\frac{t-\mu}{b}\right)\right]_{-\infty}^y\\
  &=\frac{1}{2}\exp\left(\frac{y-\mu}{b}\right)\\
  &=\frac{1}{2}\exp\left(-\frac{|y-\mu|}{b}\right)
\end{aligned}
{{< /katex >}}
となります．

一方，{{< katex >}}y\ge\mu{{< /katex >}} のとき，{{< katex >}}t\ge\mu{{< /katex >}} ならば {{< katex >}}t-\mu\ge0{{< /katex >}} なので，
{{< katex display >}}
\begin{aligned}
  F_Y(y;\mu,b)&=\int_{-\infty}^\mu\frac{1}{2b}\exp\left(\frac{t-\mu}{b}\right)dt+\int_\mu^y\frac{1}{2b}\exp\left(-\frac{t-\mu}{b}\right)dt\\
  &=\left.\frac{1}{2}\exp\left(\frac{y-\mu}{b}\right)\right|_{y=\mu}+\left[-\frac{1}{2}\exp\left(-\frac{t-\mu}{b}\right)\right]_\mu^y\\
  &=\frac{1}{2}+\left(-\frac{1}{2}\exp\left(-\frac{y-\mu}{b}\right)+\frac{1}{2}\right)\\
  &=1-\frac{1}{2}\exp\left(-\frac{y-\mu}{b}\right)\\
  &=1-\frac{1}{2}\exp\left(-\frac{|y-\mu|}{b}\right)
\end{aligned}
{{< /katex >}}
となります．

よって，
{{< katex display >}}
F_Y(y;\mu,b)=\begin{cases}
\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y<\mu,\\
1-\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y\ge\mu
\end{cases}
{{< /katex >}}
となります．

{{< katex >}}X{{< /katex >}} がパラメータ {{< katex >}}\mu,b,A,B{{< /katex >}} の切断ラプラス分布に従う確率変数であるなら，
{{< katex display >}}
  \int_{-\infty}^\infty f_X(x;\mu,b,A,B)dx=1
{{< /katex >}}
を満たします．

ここで，{{< katex >}}Y{{< /katex >}} を（{{< katex >}}X{{< /katex >}} と同じ）パラメータ {{< katex >}}\mu,b{{< /katex >}} のラプラス分布に従う確率変数とすると，
{{< katex display >}}
\begin{aligned}
1&=\int_{-\infty}^{\infty}\frac{1}{2bC}\exp\left(-\frac{|x-\mu|}{b}\right)dx\\
&=\frac{1}{C}\int_A^B\frac{1}{2b}\exp\left(-\frac{|x-\mu|}{b}\right)dx\\
&=\frac{1}{C}(F_Y(B;\mu,b)-F_Y(A;\mu,b))
\end{aligned}
{{< /katex >}}
となります．
よって，
{{< katex display >}}
C=F_Y(B;\mu,b)-F_Y(A;\mu,b)
{{< /katex >}}
とわかります．
パラメータ {{< katex >}}\mu,b,A,B{{< /katex >}} を明示して書くと，
{{< katex display >}}
C_{\mu,b}(A,B)=F_Y(B;\mu,b)-F_Y(A;\mu,b)
{{< /katex >}}
です．

以上より，次のことがわかります．
{{< hint info >}}
  {{< theorem-label name="Proposition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\), \\(A,B\in\mathbb{R}\\), \\(A\le B\\) とする．
  \\[
    C_{\mu,b}(A,B)=\begin{cases}
      \dfrac{1}{2}\left(\exp\left(-\dfrac{|B-\mu|}{b}\right)-\exp\left(-\dfrac{|A-\mu|}{b}\right)\right),&A\le B<\mu,\\\\
      1-\dfrac{1}{2}\left(\exp\left(-\dfrac{|B-\mu|}{b}\right)+\exp\left(-\dfrac{|A-\mu|}{b}\right)\right),&A\le\mu\le B,\\\\
      -\dfrac{1}{2}\left(\exp\left(-\dfrac{|B-\mu|}{b}\right)-\exp\left(-\dfrac{|A-\mu|}{b}\right)\right),&\mu<A\le B
    \end{cases}
  \\]
  とする．
  連続的確率変数 \\(X:(\Omega,\mathfrak{F})\to(\mathbb{R},\mathfrak{B}[\mathbb{R}])\\) の確率密度関数 \\(f_X\\) が
  \\[
  f_X(x;\mu,b,A,B)=\begin{cases}
   \dfrac{1}{2bC_{\mu,b}(A,B)}\exp\left(-\dfrac{|y-\mu|}{b}\right),&A\le x\le B,\\\\
   0,&\text{otherwise}
  \end{cases}
  \\]
  を満たすとき，\\(X\\) は切断ラプラス分布に従う確率変数である．
{{< /katex >}}

## 切断ラプラス分布の累積分布関数

切断ラプラス分布に従う確率変数の累積分布関数を求めます．

{{< katex >}}A\le x\le B{{< /katex >}} ならば，
{{< katex display >}}
\begin{aligned}
  &F_X(x;\mu,b,A,B)\\
  &=\int_{-\infty}^xf_X(t;\mu,b,A,B)dt\\
  &=\int_{-\infty}^x\frac{1}{2bC_{\mu,b}(A,B)}\exp\left(-\frac{|t-\mu|}{b}\right)dt\\
  &=\frac{F_Y(x;\mu,b)-F_Y(A;\mu,b)}{C_{\mu,b}(A,B)}
\end{aligned}
{{< /katex >}}
です．
ただし，{{< katex >}}F_Y(y;\mu,b){{< /katex >}} は，パラメータ {{< katex >}}\mu,b{{< /katex >}} のラプラス分布に従う確率変数の累積分布関数です．
そして，{{< katex >}}x<A{{< /katex >}} ならば {{< katex >}}F_X(x;\mu,b,A,B)=0{{< /katex >}}, {{< katex >}}x>B{{< /katex >}} ならば {{< katex >}}F_X(x;\mu,b,A,B)=1{{< /katex >}} です．

通常のラプラス分布とあわせてまとめると以下のようになります．

{{< hint info >}}
{{< theorem-label name="Proposition" >}} 
1. \\(Y\\) をパラメータ \\(\mu,b\\) のラプラス分布に従う確率変数とする．\\(Y\\) の累積分布関数 \\(F_Y(y;\mu,b)\\) は，
\\[
  F\_Y(y;\mu,b)=\\begin{cases}
  \\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y<\mu,\\\\
  1-\\dfrac{1}{2}\exp\left(-\dfrac{|y-\mu|}{b}\right),&y\ge\mu
  \end{cases}
\\]
と表される．

2. \\(X\\) をパラメータ \\(\mu,b,A,B\\) の切断ラプラス分布に従う確率変数とする．\\(X\\) の累積分布関数 \\(F_X(x;\mu,b,A,B)\\) は，
\\[
\begin{aligned}
  &F_X(x;\mu,b,A,B)\\\\
  &=\begin{cases}
    0,&x<A,\\\\
    \dfrac{F_Y(x;\mu,b)-F_Y(A;\mu,b)}{C_{\mu,b}(A,B)},&A\le x\le B\\\\
    1,&x>B
  \end{cases}
\end{aligned}
\\]
と表される．
{{< /hint >}}

## まとめ

本ページでは，ラプラス分布と切断ラプラス分布の定義を述べ，切断ラプラス分布の確率密度関数，累積分布関数を具体的に求めました．

[切断ラプラス分布の確率密度関数]({{< ref trunclap >}}#切断ラプラス分布の確率密度関数) の議論から，ラプラス分布の累積分布関数が簡単な形で表せることで（Prop. 4も参照），切断ラプラス分布の確率密度関数や，累積分布関数も具体的に書き下せることがわかります．
