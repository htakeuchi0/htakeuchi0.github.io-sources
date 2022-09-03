---
title: "サイコロをN回投げたときおよそ6回に1回程度の割合で1の目が出ることの確認"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# サイコロをN回投げたときおよそ6回に1回程度の割合で1の目が出ることの確認

## 概要

サイコロを繰り返し投げると，およそ6回に1回程度の割合で1の目が出ることを確認したいと思いますが，**ちょうど**6回に1回の割合で出るわけではないことがわかりました．

そこで，本ページでは，**およそ**6回に1回**程度**の割合で出ることを確認する方法を考えます．

いま，{{< katex >}}p(N,k)=\binom{N}{k}5^{N-k}/6^N{{< /katex >}}とします．

このとき，以下の方針が考えられます．

1. {{< katex >}}p(N,k){{< /katex >}}が最大となる{{< katex >}}k{{< /katex >}}が，およそ{{< katex >}}N/6{{< /katex >}}であることを確認する．
2. サイコロを繰り返し投げると，平均的に{{< katex >}}N/6{{< /katex >}}程度の回数だけ1の目が出ることを確認する．

1は，{{< katex >}}N{{< /katex >}}を固定したとき，1の目が出る回数として最もあり得るのがおよそ{{< katex >}}N/6{{< /katex >}} のときであることを確認する方針です．

2は，サイコロを {{< katex >}}N{{< /katex >}}投げる試行自体を繰り返すと，試行ごとにばらつきがあるが，平均的には {{< katex >}}N/6{{< /katex >}} 回程度1の目が出ることを確認する方針です．

## 確率が最大となる1の目の出る回数がN/6程度であることの確認

まず，{{< katex >}}p(N,k){{< /katex >}} を数値的に計算してみます．{{< katex >}}N=10,100,1000{{< /katex >}} の場合を計算しますが，値が小さくなりすぎるので，{{< katex >}}\log_{10}p(N,k){{< /katex >}} を計算することにします．

縦軸・横軸のスケールが各グラフで異なる点に注意してください．

{{< figure src="/images/docs/math/stat/dice/dice_plot-1.png" title="Figure 1. N=10の場合" class="text-center" >}}
{{< figure src="/images/docs/math/stat/dice/dice_plot-2.png" title="Figure 2. N=100の場合" class="text-center" >}}
{{< figure src="/images/docs/math/stat/dice/dice_plot-3.png" title="Figure 3. N=1000の場合" class="text-center" >}}


Figs. 1--3 より，{{< katex >}}k=k_0{{< /katex >}} で {{< katex >}}p(N,k){{< /katex >}} が最大になるとき，{{< katex >}}k<k_0{{< /katex >}} の範囲では {{< katex >}}p(N,k){{< /katex >}} は大きくなり，{{< katex >}}k>k_0{{< /katex >}} の範囲では，{{< katex >}}p(N,k){{< /katex >}} は小さくなるようです．よって，この頂点となる {{< katex >}}k=k_0{{< /katex >}} が {{< katex >}}N/6{{< /katex >}} 程度だとわかればよさそうです．

{{< katex >}}p(N,k)>0{{< /katex >}} なので，{{< katex >}}p(N,k+1)/p(N,k){{< /katex >}}を計算すると，
* {{< katex >}}p(N,k+1)/p(N,k)>1{{< /katex >}} ならば {{< katex >}}p(N,k+1)>p(N,k){{< /katex >}} ，
* {{< katex >}}p(N,k+1)/p(N,k)=1{{< /katex >}} ならば {{< katex >}}p(N,k+1)=p(N,k){{< /katex >}} ，
* {{< katex >}}p(N,k+1)/p(N,k)<1{{< /katex >}} ならば {{< katex >}}p(N,k+1)<p(N,k){{< /katex >}} 

となるので，**隣り合う項の比を計算することで，頂点がわかるだろうと考えられます**．

{{< katex display >}}
  \begin{aligned}
  &\frac{p(N,k+1)}{p(N,k)}\\
  &=\frac{\binom{N}{k+1}5^{N-(k+1)}/6^N}{\binom{N}{k}5^{N-k}/6^N}\\
  &=\frac{\binom{N}{k+1}}{\binom{N}{k}}\frac{5^{N-(k+1)}/6^N}{5^{N-k}/6^N}\\
  &=\frac{N!/((k+1)!(N-k-1)!)}{N!/(k!(N-k)!)}\frac{5^{N-(k+1)}}{5^{N-k}}\\
  &=\frac{k!}{(k+1)!}\frac{(N-k)!}{(N-k-1)!}\frac{5^{N-(k+1)}}{5^{N-k}}\\
  &=\frac{1}{k+1}\cdot(N-k)\cdot\frac{1}{5}\\
  &=\frac{1}{5}\left(-1+\frac{N+1}{k+1}\right)
  \end{aligned}
{{< /katex >}}
が成り立ちます．よって，
{{< katex display >}}
  \frac{p(N,k+1)}{p(N,k)}\begin{cases}
    >1&\mathrm{if}\ k<(N+1)/6-1,\\
    =1&\mathrm{if}\ k=(N+1)/6-1,\\
    <1&\mathrm{if}\ k>(N+1)/6-1
  \end{cases}
{{< /katex >}}
となります．つまり，およそ {{< katex >}}(N+1)/6-1\approx N/6{{< /katex >}} に確率のピークがあることがわかりました．

## 平均的にN/6回程度1の目が出ることの確認

{{< katex >}}A_k{{< /katex >}}を前に定めたとおりとします．このとき，{{< katex >}}A_k{{< /katex >}}は，サイコロを {{< katex >}}N{{< /katex >}}回投げて1の目が {{< katex >}}k{{< /katex >}}回出る事象を表し，{{< katex >}}\sum_{k=0}^NA_k=\Omega{{< /katex >}} すなわち {{< katex >}}\sum_{k=0}^NP(A_k)=P(\sum_{k=0}^NA_k)=P(\Omega)=1 {{< /katex >}} なので，
{{< katex display >}}
  \mu_N=\sum_{k=0}^NkP(A_k)=\sum_{k=0}^Nk\binom{N}{k}\frac{5^{N-k}}{6^N}
{{< /katex >}}
を計算することで，平均的に何回程度1の目が出るかを計算できそうです．

試しに，{{< katex >}}N=1,2,3{{< /katex >}} のときを計算します．

{{< katex display >}}

\begin{aligned}
\mu_1&=\sum_{k=0}^1k\binom{1}{k}\frac{5^{1-k}}{6^1}=\frac{1}{6},\\
\mu_2&=\sum_{k=0}^2k\binom{2}{k}\frac{5^{2-k}}{6^2}\\
&=0+1\cdot2\cdot\frac{5}{6^2}+2\cdot1\cdot\frac{1}{6^2}\\
&=\frac{1}{3},\\
\mu_3&=\sum_{k=0}^3k\binom{3}{k}\frac{5^{3-k}}{6^3}\\
&=0+1\cdot3\cdot\frac{5^2}{6^3}+2\cdot3\cdot\frac{5}{6^3}+3\cdot1\cdot\frac{1}{6^3}\\
&=\frac{1}{2}.
\end{aligned}

{{< /katex >}}

{{< katex >}}N=1,2,3{{< /katex >}}ではすべて {{< katex >}}\mu_N=N/6{{< /katex >}} が成り立っています．
したがって，すべての {{< katex >}}N{{< /katex >}} で {{< katex >}}\mu_N=N/6{{< /katex >}} が成り立つことを示せばよさそうです．

{{< katex >}}N=1{{< /katex >}} のときは既に示した通り，成り立ちます．いま，{{< katex >}}N\ge1{{< /katex >}} について，{{< katex >}}\mu_N=N/6{{< /katex >}} であると仮定し，{{< katex >}}\mu_{N+1}=(N+1)/6{{< /katex >}} であることを示します．

以下，{{< katex >}}\binom{N+1}{k}=\binom{N}{k}+\binom{N}{k-1}{{< /katex >}}であることを使います．また，{{< katex >}}\binom{N}{N+1}=\binom{N}{-1}=0{{< /katex >}}と解釈することとします．

まず，
{{< katex display >}}
\begin{aligned}
\mu_{N+1}&=\sum_{k=0}^{N+1}k\binom{N+1}{k}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\sum_{k=0}^{N+1}k\left(\binom{N}{k}+\binom{N}{k-1}\right)\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\sum_{k=0}^{N+1}k\binom{N}{k}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&\qquad{}+\sum_{k=0}^{N+1}k\binom{N}{k-1}\frac{5^{(N+1)-k}}{6^{N+1}}\\
\end{aligned}
{{< /katex >}}
となります．

第1項は，
{{< katex display >}}
\begin{aligned}
&\sum_{k=0}^{N+1}k\binom{N}{k}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\frac{5}{6}\sum_{k=0}^Nk\binom{N}{k}\frac{5^{N-k}}{6^N}\\
&=\frac{5}{6}\cdot\frac{N}{6}
\end{aligned}
{{< /katex >}}
です．

第2項は，
{{< katex display >}}
\begin{aligned}
&\sum_{k=0}^{N+1}k\binom{N}{k-1}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\sum_{k=1}^{N+1}k\binom{N}{k-1}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\sum_{k=0}^N(k+1)\binom{N}{k}\frac{5^{N-k}}{6^{N+1}}\\
&=\sum_{k=0}^Nk\binom{N}{k}\frac{5^{N-k}}{6^{N+1}}+\sum_{k=0}^N\binom{N}{k}\frac{5^{N-k}}{6^{N+1}}\\
\end{aligned}
{{< /katex >}}
です．

この第1項は，
{{< katex display >}}
\begin{aligned}
&\sum_{k=0}^Nk\binom{N}{k}\frac{5^{N-k}}{6^{N+1}}\\
&=\frac{1}{6}\sum_{k=0}^Nk\binom{N}{k}\frac{5^{N-k}}{6^N}\\
&=\frac{1}{6}\cdot\frac{N}{6}
\end{aligned}
{{< /katex >}}
で，第2項は，
{{< katex display >}}
\begin{aligned}
&\sum_{k=0}^N\binom{N}{k}\frac{5^{N-k}}{6^{N+1}}\\
&=\frac{5^N}{6^{N+1}}\sum_{k=0}^N\binom{N}{k}5^{-k}\\
&=\frac{5^N}{6^{N+1}}\sum_{k=0}^N\binom{N}{k}\left(\frac{1}{5}\right)^k1^{N-k}\\
&=\frac{5^N}{6^{N+1}}\left(\frac{1}{5}+1\right)^N\\
&=\frac{5^N}{6^{N+1}}\left(\frac{6}{5}\right)^N\\
&=\frac{1}{6}
\end{aligned}
{{< /katex >}}
なので，あわせて {{< katex >}}N/6^2+1/6{{< /katex >}} となります．

したがって，
{{< katex display >}}
\begin{aligned}
\mu_{N+1}&=\sum_{k=0}^{N+1}k\binom{N+1}{k}\frac{5^{(N+1)-k}}{6^{N+1}}\\
&=\frac{5N}{6^2}+\left(\frac{N}{6^2}+\frac{1}{6}\right)\\
&=\frac{N}{6}+\frac{1}{6}\\
&=\frac{N+1}{6}
\end{aligned}
{{< /katex >}}
が成り立ちます．

以上より，数学的帰納法によって，すべての {{< katex >}}N{{< /katex >}} で {{< katex >}}\mu_N=N/6{{< /katex >}} が成り立ちます．

したがって，偏りのないサイコロを {{< katex >}}N{{< /katex >}} 回投げたとき，平均的に {{< katex >}}N/6{{< /katex >}}回，1の目が出ることがわかりました．

## まとめ

本ページでは，サイコロを繰り返し投げると，およそ6回に1回程度の割合で1の目が出ることを確認しました．具体的には，サイコロを {{< katex >}}N{{< /katex >}}回投げるとき，次が成り立つことがわかりました．
* 確率が最大となる1の目の出る回数は {{< katex >}}N/6{{< /katex >}}程度である
* 平均的に{{< katex >}}N/6{{< /katex >}}回程度，1の目が出る
