---
title: "特殊なラプラス分布や切断ラプラス分布のパラメータ推定"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 特殊なラプラス分布や切断ラプラス分布のパラメータ推定

## 概要

[前ページ]({{< ref sampling >}}) では，ラプラス分布や切断ラプラス分布からのサンプリングについてまとめました．

本ページでは，ラプラス分布や切断ラプラス分布に従う乱数から，各分布のパラメータを推定する方法についてまとめます．

ただし，本節は，簡易な直接計算でラプラス分布の性質を述べることを目的としているので，すべてのパラメータでなく，一部のパラメータのみを推定する場合を考えます．

具体的には，{{< katex >}}\mu{{< /katex >}} は {{< katex >}}0{{< /katex >}} に固定し，切断ラプラス分布では左右対称な分布となるケースのみを考えます．

## \\(\mu=0\\) であるラプラス分布のパラメータ推定

いま，{{< katex >}}X_1,X_2,\dots,X_N{{< /katex >}} を，独立にパラメータ {{< katex >}}\mu,b{{< /katex >}} のラプラス分布に従う確率変数とし，{{< katex >}}\mu=0{{< /katex >}} とします．

このとき，
{{< katex display=true >}}
  f_{X_1,X_2,\dots,X_N}(x_1,x_2,\dots,x_N;b)=\prod_{i=1}^N\frac{1}{2b}\exp\left(-\frac{|x_i|}{b}\right)
{{< /katex >}}
と表されます．
{{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b)=\log f_{X_1,X_2,\dots,X_N}(x_1,x_2,\dots,x_N;b){{< /katex >}} とおくと，
{{< katex display=true >}}
\begin{aligned}
  \mathcal{L}_{x_1,\dots,x_N}(b)&=\log\prod_{i=1}^N\frac{1}{2b}\exp\left(-\frac{|x_i|}{b}\right)\\
  &=\sum_{i=1}^N\left(\log\frac{1}{2b}+\log\exp\left(-\frac{|x_i|}{b}\right)\right)\\
  &=-N\log 2b-\frac{1}{b}\sum_{i=1}^N|x_i|
\end{aligned}
{{< /katex >}}
となります．

ここで，{{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b){{< /katex >}} が最大となるような {{< katex >}}b{{< /katex >}} を求めます．
{{< katex display=true >}}
\begin{aligned}
\frac{d\mathcal{L}_{x_1,\dots,x_N}}{db}(b)&=-\frac{N}{b}+\frac{1}{b^2}\sum_{i=1}^N|x_i|\\
&=-\frac{N}{b^2}\left(b-\frac{1}{N}\sum_{i=1}^N|x_i|\right),\\
\frac{d^2\mathcal{L}_{x_1,\dots,x_N}}{db^2}(b)&=\frac{N}{b^2}-\frac{2}{b^3}\sum_{i=1}^N|x_i|\\
&=\frac{N}{b^3}\left(b-\frac{2}{N}\sum_{i=1}^N|x_i|\right)
\end{aligned}
{{< /katex >}}
なので，{{< katex >}}b=(1/N)\sum_{i=1}^N|x_i|{{< /katex >}} とすると，{{< katex >}}d\mathcal{L}_{x_1,\dots,x_N}/db=0{{< /katex >}}, {{< katex >}}d^2\mathcal{L}_{x_1,\dots,x_N}/db^2=-(1/b^3)\sum_{i=1}^N|x_i|<0{{< /katex >}} なので，{{< katex >}}b=(1/N)\sum_{i=1}^N|x_i|{{< /katex >}} で {{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b){{< /katex >}} は最大値をとります．

よって，{{< katex >}}x_1,x_2,\dots,x_N{{< /katex >}} がパラメータ {{< katex >}}\mu,b{{< /katex >}} のラプラス分布からサンプリングされた乱数であって，{{< katex >}}\mu=0{{< /katex >}} が既知であれば，{{< katex >}}b=(1/N)\sum_{i=1}^N|x_i|{{< /katex >}} と推定することができます．

このように，**対数尤度関数** {{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b){{< /katex >}} を最大化してパラメータを推定する方法を，**最尤推定** といいます[^1]．
[^1]: {{< katex >}}\mu{{< /katex >}} が未知の場合，{{< katex >}}x_1,\dots,x_N{{< /katex >}} の中央値を {{< katex >}}\mu{{< /katex >}} の推定値として，その推定値を用いて {{< katex >}}b=(1/N)\sum_{i=1}^N|x_i-\mu|{{< /katex >}} と推定できることが知られています [[1]](#wiki:1)．

## \\(\mu=0\\) である対称な切断ラプラス分布のパラメータ推定

いま，{{< katex >}}X_1,X_2,\dots,X_N{{< /katex >}} を，独立に同一の分布に従う確率変数とし，その確率密度関数が，
{{< katex display=true >}}
\begin{aligned}
  &f_{X_i}(x;b,A)=\begin{cases}
   \dfrac{1}{2bC_{b}(A)}\exp\left(-\dfrac{|x|}{b}\right),&-A\le x\le A,\\
   0,&\text{otherwise},
  \end{cases},\\
  &C_{b}(A)=1-\exp\left(-\dfrac{A}{b}\right)
\end{aligned}
{{< /katex >}}
であるとします．
これは，切断ラプラス分布の特殊な場合ものです．

前節と同様に，{{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b,A)=\log f_{X_1,X_2,\dots,X_N}(x_1,x_2,\dots,x_N;b,A){{< /katex >}} とおくと，
{{< katex display=true >}}
\begin{aligned}
  \mathcal{L}_{x_1,\dots,x_N}(b,A)&=\log\prod_{i=1}^N\frac{1}{2bC_b(A)}\exp\left(-\frac{|x_i|}{b}\right)\\
  &=\sum_{i=1}^N\left(\log\frac{1}{2bC_b(A)}+\log\exp\left(-\frac{|x_i|}{b}\right)\right)\\
  &=-N\log 2bC_b(A)-\frac{1}{b}\sum_{i=1}^N|x_i|
\end{aligned}
{{< /katex >}}
となります．

まず，{{< katex >}}b>0{{< /katex >}} とすると，{{< katex >}}A\to0{{< /katex >}} のとき {{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b,A)\to+\infty{{< /katex >}} なので，{{< katex >}}A{{< /katex >}} は小さければ小さいほどよいです．
一方で，すべての {{< katex >}}i{{< /katex >}} について {{< katex >}}|x_i|\le A{{< /katex >}} となる必要があるため，{{< katex >}}A=\max_{i=1,2,\dots,N}|x_i|{{< /katex >}} と推定することにします．

次に，{{< katex >}}b{{< /katex >}} について考えます．
偏導関数に着目すると，

{{< katex display=true >}}
\begin{aligned}
  &\frac{\partial\mathcal{L}_{x_1,\dots,x_N}}{\partial b}(b,A)\\
  &\quad=-\frac{N}{b^2}\left(b-\frac{A}{\exp(A/b)-1}-\frac{1}{N}\sum_{i=1}^N|x_i|\right),\\
\end{aligned}
{{< /katex >}}
となります．

ここで，
* {{< katex >}}b\to+0{{< /katex >}} において，{{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)\to+\infty{{< /katex >}}
* {{< katex >}}b\to+\infty{{< /katex >}} において，{{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)\to+0{{< /katex >}}

であることがわかります．

さらに，{{< katex >}}b-(1/N)\sum_{i=1}^N|x_i|{{< /katex >}} は {{< katex >}}b{{< /katex >}} に関する1次関数，{{< katex >}}A/(\exp(A/b)-1){{< /katex >}} は {{< katex >}}b{{< /katex >}} に関する狭義凸関数なので，これら関数のグラフは高々2点で交わります．よって，{{< katex >}}b{{< /katex >}} に関する方程式 {{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)=0{{< /katex >}} は高々2個の実数解をもちます．

{{< katex >}}b\approx0{{< /katex >}} において {{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)>0{{< /katex >}} で，{{< katex >}}b{{< /katex >}} が十分大きい範囲で {{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)>0{{< /katex >}} なので，偏導関数の連続性から，次のいずれかが成り立ちます．
* 常に {{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)\ge0{{< /katex >}} である，
* {{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A)=0{{< /katex >}} は異なる2個の実数解をもち，小さい方の解 {{< katex >}}b^*{{< /katex >}} は，{{< katex >}}(\partial\mathcal{L}_{x_1,\dots,x_N}/\partial b)(b,A){{< /katex >}} が正から負に変化する零点である．

さらに，{{< katex >}}b\to+\infty{{< /katex >}} のとき，{{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b,A)\to-N\log 2A{{< /katex >}} であることに注意すると，{{< katex >}}b^*{{< /katex >}} が存在し，かつ {{< katex >}}\mathcal{L}_{x_1,\dots,x_N}(b^*,A)\ge-N\log 2A{{< /katex >}} のとき {{< katex >}}b^*{{< /katex >}} をパラメータ {{< katex >}}b{{< /katex >}} の推定値とできることがわかります．

ただし，解くべき以下の方程式は，一般に解析的に解けないので，数値的に解く必要があります．
{{< katex display=true >}}
  b=\frac{A}{\exp(A/b)-1}+\frac{1}{N}\sum_{i=1}^N|x_i|
{{< /katex >}}

なお，
{{< katex display=true >}}
\begin{aligned}
  &\frac{\partial^2\mathcal{L}_{x_1,\dots,x_N}}{\partial b^2}(b,A)\\
  &\quad=\frac{N}{b^4}\left(\frac{A^2\exp(A/b)}{(\exp(A/b)-1)^2}-\frac{2Ab}{\exp(A/b)-1}+b\left(b-\frac{2}{N}\sum_{i=1}^N|x_i|\right)\right)
\end{aligned}
{{< /katex >}}
と表せることを利用して，数値的に得られた {{< katex >}}b^*{{< /katex >}} が極大点であることを確認することができます．

## 数値実験

実際に切断ラプラス分布に従う乱数を生成し，本ページの方法でパラメータ推定を行います．

条件は以下のとおりとします．
* サンプリング数 {{< katex >}}N=100000{{< /katex >}} とします．
* 乱数生成は[前ページ]({{< ref sampling >}})の方法で行います．
* {{< katex >}}b{{< /katex >}}に関する方程式は，初期値を {{< katex >}}1{{< /katex >}}, 収束判定条件を残差の絶対値が {{< katex >}}10^{-15}{{< /katex >}} 未満であることとするNewton法で求めます．

### 典型的なパラメータでの推定結果

まずは，典型的なパラメータで推定できるかを確認します．
結果は以下のとおりで，正しく推定できていることがわかります．

|{{< katex >}}A{{< /katex >}}|{{< katex >}}b{{< /katex >}}|{{< katex >}}A{{< /katex >}} の推定値|{{< katex >}}b{{< /katex >}} の推定値|
|----|----|----|----|
|1.0|1.0|0.999994|0.996397|
|5.0|2.0|4.999925|2.004784|
|1.0|0.1|0.984138|0.099924|

### 乱数パラメータでの推定結果

次に，{{< katex >}}A{{< /katex >}}, {{< katex >}}b{{< /katex >}} をそれぞれ {{< katex >}}0.1{{< /katex >}} 以上 {{< katex >}}5{{< /katex >}} 以下の一様乱数で決めて，それらパラメータが推定できるかを確認します．
パラメータ推定を1000回行い，{{< katex >}}(A,b){{< /katex >}} によらず計算できるかを確認します．

実行した結果，計算が収束した割合は 98.3% でした．
1000回のうち17回は，Newton 法が収束せず，解が得られませんでした．

ここで，収束した場合としなかった場合でどのような差があるかを確認します．

まず，収束した場合の {{< katex >}}A{{< /katex >}}, {{< katex >}}b{{< /katex >}} の相対誤差は以下のとおりです[^2]．
[^2]: 3.41e-09 とは {{< katex >}}3.41\times10^{-9}{{< /katex >}} という意味で，ほかも同様です．

||最小|中央|最大|平均|標本標準偏差|
|----|----|----|----|----|----|
|\\(A\\)|3.41e-09|1.26e-05|6.75e-01|6.51e-03|5.02e-02|
|\\(b\\)|4.71e-06|7.18e-03|3.43e-01|1.63e-02|2.85e-02|

次に，収束しない場合の，反復終了時点の {{< katex >}}A{{< /katex >}}, {{< katex >}}b{{< /katex >}} の相対誤差は以下のとおりです．

||最小|中央|最大|平均|標本標準偏差|
|----|----|----|----|----|----|
|\\(A\\)|2.68e-07|7.35e-06|3.81e-05|9.58e-06|9.36e-06|
|\\(b\\)|3.30e-02|1.15e-01|6.15e-01|1.66e-01|1.51e-01|

{{< katex >}}b{{< /katex >}} の相対誤差の平均値，中央値，最大値は，収束したかどうかで変わらないように見えます．一方で，{{< katex >}}b{{< /katex >}} の相対誤差の最小値を比較すると，反復が終了した場合の方が誤差が小さいので，反復が収束する場合の方が精度よく求まるケースはあるようです．
ですので，収束した場合に精度よく求まるケースが観測されたものの，収束したかどうかで精度が明確に異なるとも言い難いという結果になりました．

ところで，収束した場合の {{< katex >}}A{{< /katex >}} の平均値が 2.59205, 収束しなかった場合の {{< katex >}}A{{< /katex >}} の平均値が 0.234635 なので，切断点が小さいときに，収束が難しい可能性があります．
{{< katex >}}A,b{{< /katex >}} の組み合わせによる可能性もありますので，正確に条件を把握するために，計算に成功した場合と失敗した場合の {{< katex >}}(A,b){{< /katex >}} をプロットしてみます．

{{< figure src="/images/docs/math/stat/lap/sucfail.png" title="Figure 1. 計算に成功した場合と失敗した場合の \((A,b)\)" class="text-center" >}}

Fug. 1 より，{{< katex >}}A{{< /katex >}} が小さく，{{< katex >}}b{{< /katex >}} が大きい場合に失敗しやすいことがわかります．

まとめると，以下のようになります．
* 収束したかどうかで，精度が明確に異なるとは言い難い．
* 収束しても精度よく求まるとは限らないが，収束した場合に精度よく求まったケースはあった．
* {{< katex >}}A{{< /katex >}} が小さく {{< katex >}}b{{< /katex >}} が大きい場合に収束が難しい可能性がある．

以上より，{{< katex >}}b{{< /katex >}} を数値的に求める方法に検討の余地があると考えられます．

### Python による実装例

Python による実装例は以下のとおりです．
また，本数値実験は，以下の実装で行いました．

```python
import numpy as np
import scipy.stats as stats

def estimate(random_values):
    a = np.max(np.abs(random_values))
    m = np.mean(np.abs(random_values))

    b = 1.0
    max_loop = 100000
    threshold = 1.0e-15
    converged = False
    for _ in range(max_loop):
        exp_a_b = np.exp(a / b)
        if np.abs(b - a / (exp_a_b - 1) - m) < threshold:
            converged = True
            break

        c = a / (b * (exp_a_b - 1))
        b -= (b - a/(exp_a_b - 1) - m)/(1 + c*c*exp_a_b)

    if not converged:
        raise RuntimeError('Did not converge. (A={}, b={})'.format(a, b))

    exp_a_b = np.exp(a / b)
    d = a / (exp_a_b - 1)
    n = len(random_values)
    f = -n*np.log(2*b*(1 - np.exp(-a / b))) - m*n / b
    if f < -n*np.log(2*a):
        raise RuntimeError('Failed.')

    ddf = (n / b**4)*(d*d*exp_a_b - 2*b*d + b*(b - 2*m))
    if ddf >= 0:
        raise RuntimeError('Failed.')

    return a, b
```

## まとめ

本ページでは，一部のパラメータが既知である，特殊なラプラス分布や切断ラプラス分布のパラメータ推定方法についてまとめました．

{{< katex >}}\mu=0{{< /katex >}} のラプラス分布では，{{< katex >}}b{{< /katex >}} が簡単に推定できますが，切断ラプラス分布の場合は，一般には数値的にしか求まらないことがわかりました．

数値実験では，典型的な例では，切断ラプラス分布のパラメータが推定できていそうな様子は確認できましたが，計算が収束しない場合があることもわかりました．

パラメータよらず，より確実にパラメータ推定を行う方法や，本ページの方法を，一般の切断ラプラス分布のパラメータ推定に拡張する方法は，現時点でわかっておらず，今後の課題です．

## 参考文献

{{< anchor "wiki:1" >}}[1] Wikipedia，“Laplace distribution - Wikipedia”, https://en.wikipedia.org/wiki/Laplace_distribution#Statistical_inference, 2024/6/6 最終アクセス．
