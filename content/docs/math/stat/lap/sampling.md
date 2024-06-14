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

指定した分布に従う乱数をサンプリングする方法として，**逆関数法** と呼ばれる方法が知られています．

ラプラス分布や切断ラプラス分布に従う乱数を，この方法で生成することを考えます．まずは，逆関数法についてまとめます．
本節の議論は，ラプラス分布や切断ラプラス分布に限らず適用できます．

{{< katex >}}X{{< /katex >}} を確率変数とし，{{< katex >}}F_X{{< /katex >}} を {{< katex >}}X{{< /katex >}}の累積分布関数とします．
{{< katex >}}F_X{{< /katex >}} は単調増加関数です．
{{< katex >}}F_X^*:[0,1]\to\mathbb{R}{{< /katex >}} を，{{< katex >}}F_X^*(u)=\inf\{x\mid F(x)\ge u\}{{< /katex >}} とします[^1]．
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

[^1]: [[1]](#wiki:1) で述べられている定め方です．

したがって，{{< katex >}}u{{< /katex >}} を区間 {{< katex >}}[0,1]{{< /katex >}} 上の一様分布に従う乱数とし，{{< katex >}}x=F_X^*(u){{< /katex >}} と変換すると，{{< katex >}}X{{< /katex >}} の従う分布からのサンプリングができることになります．
特に，{{< katex >}}F_X{{< /katex >}} が可逆であれば，{{< katex >}}F_X^*=F_X^{-1}{{< /katex >}} なので，{{< katex >}}x=F_X^{-1}(u){{< /katex >}} と計算できます．

## ラプラス分布からのサンプリング

本節では，逆関数法を用いた，ラプラス分布からのサンプリング方法について述べます．

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
    \mu-b\log(1-2w),&0<w\le1/2
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
  {{< theorem-label name="Proposition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\) とする．\\(W\\) を区間 \\([-1/2,1/2]\\) 上の一様分布に従う連続的確率変数とすると，\\(Y=\mu-\mathrm{sgn}(W)b\log(1-2|W|)\\) は，パラメータ \\(\mu,b\\) のラプラス分布に従う連続的確率変数である．
{{< /hint >}}

## 切断ラプラス分布からのサンプリング

[前節]({{< ref "#ラプラス分布からのサンプリング" >}})と同様に，切断ラプラス分布からのサンプリングの方法を導きます．

ラプラス分布に従う確率変数の累積分布関数は，[前ページ]({{< ref trunclap >}}) で述べたとおり，
{{< katex display >}}
\begin{aligned}
  &F_X(x;\mu,b,A,B)\\
  &=\begin{cases}
    0,&x<A,\\
    \dfrac{F_Y(x;\mu,b)-F_Y(A;\mu,b)}{C_{\mu,b}(A,B)},&A\le x\le B\\
    1,&x>B
  \end{cases}
\end{aligned}
{{< /katex >}}
となります．

まず，{{< katex >}}x<A{{< /katex >}} ならば {{< katex >}}F_X(x;\mu,b,A,B)=0{{< /katex >}} なので，{{< katex >}}F_X^*(0)=-\infty{{< /katex >}} です．
次に，{{< katex >}}x>B{{< /katex >}} ならば {{< katex >}}F_X(x;\mu,b,A,B)=1{{< /katex >}} なので，{{< katex >}}F_X^*(1)=B{{< /katex >}} です．

ここで，{{< katex >}}0<u<1{{< /katex >}} とし，{{< katex >}}F_X(x;\mu,b,A,B)=u{{< /katex >}} となる {{< katex >}}x{{< /katex >}} を求めます．
まず，
{{< katex display >}}
  \frac{F_Y(x;\mu,b)-F_Y(A;\mu,b)}{C_{\mu,b}(A,B)}=u
{{< /katex >}}
なので，
{{< katex display >}}
  F_Y(x;\mu,b)=uC_{\mu,b}(A,B)+F_Y(A;\mu,b)
{{< /katex >}}
です．したがって，{{< katex >}}w=uC_{\mu,b}(A,B)+F_Y(A;\mu,b)-1/2{{< /katex >}} とおくと，
{{< katex display >}}
  x=\mu-\mathrm{sgn}(w)b\log(1-2|w|)
{{< /katex >}}
となります．ここで，
{{< katex display >}}
  F_Y(A;\mu,b)-\frac{1}{2}<w<C_{\mu,b}(A,B)+F_Y(A;\mu,b)-\frac{1}{2}=F_Y(B;\mu,b)-\frac{1}{2}
{{< /katex >}}
です．

さて，{{< katex >}}w=F_Y(A;\mu,b)-1/2,F_Y(B;\mu,b)-1/2{{< /katex >}} であるとき，それぞれ {{< katex >}}x=A,B{{< /katex >}} であることがわかります[^2]．
[^2]:前者は {{< katex >}}A<\mu,A\ge\mu{{< /katex >}} で場合分けして整理すると得られます．後者も同様です．

そこで，{{< katex >}}F_X^*(0)=A{{< /katex >}} と定義し直すと[^3]，以下の結論が得られます．
[^3]:{{< katex >}}F_X^*(0)=-\infty{{< /katex >}}として，{{< katex >}}Z=F_X^*(U){{< /katex >}} としてつくる確率変数 {{< katex >}}Z{{< /katex >}}と，{{< katex >}}F_X^*(0)=A{{< /katex >}}として，{{< katex >}}Z'=F_X^*(U){{< /katex >}} としてつくる確率変数 {{< katex >}}Z'{{< /katex >}} は，ほとんど至るところ等しいので，本質的な違いはありません．

{{< hint info >}}
  {{< theorem-label name="Proposition" >}} \\(\mu,b\in\mathbb{R}\\), \\(b>0\\), \\(A,B\in\mathbb{R}\\), \\(A\le B\\) とする．\\(W\\) を区間 \\([F_Y(A;\mu,b)-1/2,F_Y(B;\mu,b)-1/2]\\) 上の一様分布に従う連続的確率変数とすると，\\(Y=\mu-\mathrm{sgn}(W)b\log(1-2|W|)\\) は，パラメータ \\(\mu,b,A,B\\) の切断ラプラス分布に従う連続的確率変数である．
{{< /hint >}}

## 数値例

実際に切断ラプラス分布に従う乱数を生成してみます．
サンプリング数 {{< katex >}}N=100000{{< /katex >}} で，相対度数によるヒストグラムを作成します．

その結果は以下のとおりで，各パラメータにしたがった分布をなしていることがわかります．
例えば，
* Figs. 1--4 では，区間 {{< katex >}}[A,B]{{< /katex >}} で分布が切断されていることがわかります．
* Figs. 1, 2 を比較すると，切断点は変わらないまま，Fig. 2の方が値がばらついていることがわかります．これは，Fig. 2の方が，パラメータ {{< katex >}}b{{< /katex >}} の値が大きいからです．

{{< figure src="/images/docs/math/stat/lap/hist1.png" title="Figure 1. \(\mu=0, b=1, A=-1, B=1\)のヒストグラム" class="text-center" >}}

{{< figure src="/images/docs/math/stat/lap/hist2.png" title="Figure 2. \(\mu=0.5, b=1, A=-1, B=1\)のヒストグラム" class="text-center" >}}

{{< figure src="/images/docs/math/stat/lap/hist3.png" title="Figure 3. \(\mu=0, b=2, A=-1, B=1\)のヒストグラム" class="text-center" >}}

{{< figure src="/images/docs/math/stat/lap/hist4.png" title="Figure 4. \(\mu=0.5, b=2, A=1, B=3\)のヒストグラム" class="text-center" >}}

また，本数値実験は，以下の実装で行いました．

```python
import numpy as np
import scipy.stats as stats

def trunclap(loc=0.0, scale=1.0, low=-1.0, high=1.0, size=None):
    uniform_low = stats.laplace.cdf(low, loc, scale) - 1/2
    uniform_high = stats.laplace.cdf(high, loc, scale) - 1/2
    w = np.random.default_rng().uniform(low=uniform_low, high=uniform_high, size=size)
    r = loc - np.sign(w) * scale * np.log(1 - 2*np.abs(w))
    return r
```

なお，ヒストグラムは以下の方法で作成しています．

```python
import matplotlib.pyplot as plt

def hist(random_values):
    plt.hist(random_values, bins=100, density=True)
    plt.show()
```

## まとめ

本ページでは，ラプラス分布や切断ラプラス分布からのサンプリングの方法についてまとめました．
切断ラプラス分布に従う乱数も，通常のラプラス分布に従う乱数と同様に，ある区間上の一様乱数を変換することで得られることがわかりました．

数値例では，実際に切断ラプラス分布に従う乱数が生成できることを確認しましたが，目視での確認はできるものの，実際に指定したパラメータで乱数生成ができているかまで確認できませんでした．
{{< katex >}}A,B,\mu{{< /katex >}} はよいですが，{{< katex >}}b{{< /katex >}} が困難です．
次ページでは，その部分的な解決策を与えます．

## 参考文献

{{< anchor "wiki:1" >}}[1] Wikipedia，“逆関数法 - Wikipedia”, https://ja.wikipedia.org/wiki/%E9%80%86%E9%96%A2%E6%95%B0%E6%B3%95, 2024/6/5 最終アクセス．



