---
title: "サイコロをN回投げたときちょうど6回に1回の割合で1の目が出る確率"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# サイコロをN回投げたときちょうど6回に1回の割合で1の目が出る確率

## 概要

前ページでは，サイコロを繰り返し投げる試行の確率モデルを定義しました．

本ページからは，サイコロを繰り返し投げると，およそ6回に1回程度の割合で1の目が出ることを確認します．

しかし，そもそもこれはどのように確認したらよいのでしょうか．

本ページではひとまず，**ちょうど** 6回に1回の割合で1の目が出る確率を計算してみます．

まず，サイコロを{{< katex >}}N{{< /katex >}}回投げたとき {{< katex >}}k{{< /katex >}} 回だけ1の目が出る確率を求めます．その後，サイコロを繰り返し投げたとき，**ちょうど** 6回に1回の割合で1の目が出る確率を求めます．

## サイコロをN回投げたときk回だけ1の目が出る確率

いま，確率空間 {{< katex >}}(\Omega_N,\mathfrak{F}_N,P_N){{< /katex >}} を考えます．{{< katex >}}A_k=\{(\omega^j)\in\Omega_N\mid |\{j\mid \omega^j=\omega_1\}|=k\}{{< /katex >}} とすると，{{< katex >}}A_k{{< /katex >}} は {{< katex >}}N{{< /katex >}} 回サイコロをなげて {{< katex >}}k{{< /katex >}} 回だけ1の目が出た事象を表します．

{{< katex >}}(\omega^j)\in A_k{{< /katex >}} とすると，{{< katex >}}\omega^1,\omega^2,\dots,\omega^N{{< /katex >}} のうち {{< katex >}}k{{< /katex >}}個が {{< katex >}}\omega_1{{< /katex >}}ですが，これは{{< katex >}}N{{< /katex >}}個から{{< katex >}}k{{< /katex >}}個を選ぶ選び方を考えればよいので，{{< katex >}}\binom{N}{k}=N!/(k!(N-k)!){{< /katex >}}個あります．

このとき，ある {{< katex >}}\{i_1,i_2,\dots,i_k\}\subset\{1,2,\dots,N\}{{< /katex >}} について，{{< katex >}}k{{< /katex >}}個の要素 {{< katex >}}\omega^{i_j}\,(j=1,2,\dots,k){{< /katex >}} は {{< katex >}}\omega_1{{< /katex >}}の1通りの値しかとれませんが，それ以外の {{< katex >}}N-k{{< /katex >}} 個の要素は {{< katex >}}\omega_2,\omega_3,\dots,\omega_6{{< /katex >}} の5通りの値をとれます．

したがって，{{< katex >}}|A_k|=\binom{N}{k}5^{N-k}{{< /katex >}}とわかります．さらに，{{< katex >}}|\Omega_N|=6^N{{< /katex >}} なので，{{< katex >}}P_N(A_k)=\binom{N}{k}5^{N-k}/6^N{{< /katex >}} となります．

よって，以下のことがいえそうです．

{{< hint info >}}
{{< theorem-label name="Proposition" >}} 偏りのないサイコロを \\(N\\) 回投げて \\(k\\) 回だけ1の目が出る確率は

{{< katex display >}}
\binom{N}{k}\frac{5^{N-k}}{6^N}
{{< /katex >}}
となる．
{{< /hint >}}

## ちょうど6回に1回の割合で1の目が出る確率

Prop. 1 を使って，**ちょうど** 6回に1回の割合で1の目が出る確率を計算してみます．

Prop. 1 より，{{< katex >}}N{{< /katex >}} 回サイコロを投げて，ちょうど {{< katex >}}\lfloor N/6\rfloor{{< /katex >}} 回1の目が出る確率 {{< katex >}}p(N){{< /katex >}}は，

{{< katex display >}}
  p(N)=\binom{N}{\lfloor N/6\rfloor}\frac{5^{N-\lfloor N/6\rfloor}}{6^N}
{{< /katex >}}

と表せます．ただし，{{< katex >}}\lfloor x\rfloor=\max\{y\in\mathbb{Z}\mid y\le x\}{{< /katex >}} とします．

{{< katex >}}N=1,2,\dots,1000{{< /katex >}} の {{< katex >}}p(N){{< /katex >}} の値を図示すると以下のようになります．

{{< figure src="/images/docs/math/stat/dice/dice_plot-n_n6.png" title="Figure 1. p(N) のグラフ" class="text-center" >}}

{{< katex >}}N{{< /katex >}} を大きくすると，**ちょうど** 6回に1回の割合で1の目が出る確率は小さくなっていくことがわかります．たとえば，{{< katex >}}N=1000{{< /katex >}} のときは {{< katex >}}3\%{{< /katex >}} 程度なので，比較的まれな現象といえそうです．

つまり，サイコロを1回だけ投げて1の目が出る確率が {{< katex >}}1/6{{< /katex >}} であるということは，**ちょうど** 6回に1回の割合で1の目が出るというわけ**ではない**ことがわかりました．

## まとめ

本ページでは，サイコロを繰り返し投げるとき，**ちょうど** 6回に1回の割合で1の目が出る確率を計算しました．

その結果，確率としては小さい値となり，サイコロを1回だけ投げて1の目が出る確率が {{< katex >}}1/6{{< /katex >}} であるということは，**ちょうど** 6回に1回の割合で1の目が出るというわけ**ではない**ことがわかりました．

