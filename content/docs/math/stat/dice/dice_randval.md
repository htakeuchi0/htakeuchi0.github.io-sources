---
title: "サイコロをN回投げたときおよそ6回に1回程度の割合で1の目が出ることの確率変数の導入による整理"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# サイコロをN回投げたときおよそ6回に1回程度の割合で1の目が出ることの確率変数の導入による整理

## 概要

前ページまでで，サイコロを {{< katex >}}N{{< /katex >}}回投げるとき，次が成り立つことがわかりました．
* 確率が最大となる1の目の出る回数は {{< katex >}}N/6{{< /katex >}}程度である
* 平均的に{{< katex >}}N/6{{< /katex >}}回程度，1の目が出る

しかし，もとの“およそ6回に1回程度の割合で1の目が出る”という主張に対して，平均といった概念をもちだしているなど，直接的な結果に感じません．

そこで本ページでは，**確率変数**を導入することで，この問題をより取り扱いやすくして，**およそ6回に1回程度の割合で1の目が出ることを，より直接的に示せないかを検討します．**

## 確率変数

まずは，確率変数の定義について述べます．

{{< hint info >}}
{{< theorem-label name="Definition" >}}
1. \\(A\\) を集合，\\(\mathfrak{F}\\) をその完全加法族とする．一般に，\\((A,\mathfrak{F})\\) を **可測空間** という．また，\\((A,\mathfrak{F}),(B,\mathfrak{G})\\) を可測空間とするとき，関数 \\(F:A\to B\\) を \\(F:(A,\mathfrak{F})\to(B,\mathfrak{B})\\) と表す．
2. \\((A,\mathfrak{F}),(B,\mathfrak{G})\\) を可測空間とする．関数 \\(F:(A,\mathfrak{F})\to (B,\mathfrak{F})\\) が，任意の \\(b\in B\\) について \\(F^{-1}(b)=\\{a\in A\mid F(a)=b\\}\in\mathfrak{F}\\) であるとき，関数 \\(F\\) を**可測関数**と呼ぶ．
3. \\(\mathbb{R}\\) の開集合全体の集合を \\(\mathfrak{O}(\mathbb{R})\\) と表す．\\(\mathfrak{O}(\mathbb{R})\\) を含む最小の完全加法族を \\(\mathfrak{B}(\mathbb{R})\\) と表す．
4. \\(\Omega,\mathfrak{F}\\) を標本空間とする，\\(X:(\Omega,\mathfrak{F})\to(\mathbb{R},\mathfrak{B}(\mathbb{R}))\\) が可測関数のとき，\\(X\\) を**確率変数**という．
{{< /hint >}}

なお，可測空間も標本空間も集合とその完全加法族の組なので，実質的には同じものですが，数理統計の文脈では，可測空間のことを標本空間と呼ぶ，という理解でよいです．また，本来は {{< katex >}}\mathfrak{B}(\mathbb{R}){{< /katex >}} の存在を示す必要がありますが，ここでは認めるものとします．

{{< katex >}}X{{< /katex >}} の像 {{< katex >}}X(\Omega)=\{x\in\mathbb{R}\mid \exists \omega\in\Omega\,(X(\omega)=x)\}{{< /katex >}} が高々可算のとき，{{< katex >}}X{{< /katex >}} は**離散型確率変数**と呼ばれます．

ここで，{{< katex >}}[X=x]=\{\omega\in\Omega_N\mid X(\omega)=x\}{{< /katex >}}とし，{{< katex >}}P([X=x]){{< /katex >}} を {{< katex >}}P(X=x){{< /katex >}} と略記することにします．{{< katex >}}[X<x],[X\le x],P(X<x),P(X\le x){{< /katex >}}なども同様です．

確率変数 {{< katex >}}X{{< /katex >}} に対し，{{< katex >}}f_X:\mathbb{R}\to\mathbb{R}{{< /katex >}} を {{< katex >}}f_X(x)=P(X\le x){{< /katex >}} と定め，**確率関数**, または**確率質量関数**と呼びます．

確率変数 {{< katex >}}X{{< /katex >}} に対し，{{< katex >}}\mathbb{E}[X]=\sum_{x=0}^{\infty}xf_X(x){{< /katex >}}, {{< katex >}}\mathbb{V}[X]=\mathbb{E}[(X-\mathbb{E}[X])^2]{{< /katex >}} を**期待値**, **分散**といい，それぞれ平均と散らばりを表すと解釈されます．

このとき，以下の式が成り立つことが知られています．

{{< hint info >}}
{{< theorem-label name="Theorem" comment="Chebyshev の不等式" >}} 任意の \\(\epsilon>0\\) について，次の式が成り立つ．

{{< katex display >}}P(|X-\mathbb{E}[X]|\ge\epsilon)\le\frac{\mathbb{V}[X]}{\epsilon^2}{{< /katex >}}
{{< /hint >}}

## 確率変数の導入

前ページの確率空間 {{< katex >}}(\Omega_N,\mathfrak{F}_N,P_N){{< /katex >}} を考えます．本ページでは，{{< katex >}}N{{< /katex >}}を省略し，{{< katex >}}(\Omega,\mathfrak{F},P){{< /katex >}} と表すことにします．1の目が出た回数だけが問題のため，以下のような可測関数 {{< katex >}}X:(\Omega,\mathfrak{F})\to(\mathbb{R},\mathfrak{B}(\mathbb{R})){{< /katex >}} を考えます．
{{< katex display >}}
X(\omega^1,\omega^2,\dots,\omega^N)=|\{i\mid \omega^i=\omega_1\}|.
{{< /katex >}}
このとき，{{< katex >}}x\notin\{0,1,\dots,N\}{{< /katex >}} ならば {{< katex >}}X^{-1}(x)=\emptyset\in\mathfrak{F}{{< /katex >}} であり，{{< katex >}}k\in\{0,1,\dots,N\}{{< /katex >}} ならば {{< katex >}}X^{-1}(k)=\{(\omega^i)\in\Omega\mid |\{i\mid \omega^i=\omega_1\}|=k\}\in 2^{\Omega}=\mathfrak{F}{{< /katex >}} なので {{< katex >}}X{{< /katex >}} は確率変数です．

ここまで定めた記号で以下が成り立ちます．

{{< hint info >}}
{{< theorem-label name="Proposition" >}} 以下が成り立つ．

{{< katex display >}}
f_X(x)=\begin{cases}
  \displaystyle\binom{N}{x}\frac{5^{N-x}}{6^N},&x=0,1,\dots,N,\\
  0,&\mathrm{otherwise}.
\end{cases}
{{< /katex >}}
{{< /hint >}}

## 二項分布の導入

一般に，確率変数 {{< katex >}}X{{< /katex >}} の確率質量関数が
{{< katex display >}}
f_X(x)=\begin{cases}
  \displaystyle\binom{N}{x}p^x(1-p)^{N-x},&x=0,1,\dots,N,\\
  0,&\mathrm{otherwise}
\end{cases}
{{< /katex >}}
となるとき，確率変数 {{< katex >}}X{{< /katex >}} は，**パラメータ {{< katex >}}(N,p){{< /katex >}} の二項分布に従う**といいます．

二項分布の確率関数は，独立な試行を {{< katex >}}N{{< /katex >}} 回繰り返したとき，確率 {{< katex >}}p{{< /katex >}} で生起する事象が {{< katex >}}x{{< /katex >}} 回発生する確率を表します．

二項分布については以下が成り立つことが知られています．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} 以下が成り立つ．
1. \\(\mathbb{E}\[X\]=Np\\).
2. \\(\mathbb{V}\[X\]=Np^2\\).
3. \\(f_X(x)\\) が最大になる \\(x\\) は，\\((N+1)p\\) が整数のとき \\((N+1)p-1,(N+1)p\\), そうでないとき \\(\lfloor(N+1)p\rfloor\\) である．
{{< /hint >}}

確率関数が Prop. 2 となる確率変数は，パラメータ {{< katex >}}p{{< /katex >}} が {{< katex >}}1/6{{< /katex >}} である二項分布に従うといえます．

よって，Thm. 4.1 より，{{< katex >}}\mathbb{E}[X]=N/6{{< /katex >}}, Thm.4.2 より {{< katex >}}f_X(x){{< /katex >}}が最大になる {{< katex >}}x{{< /katex >}}はおよそ{{< katex >}}N/6{{< /katex >}}程度となりますが，これは前ページの結論に一致します．

## サイコロをN回投げたときおよそ6回に1回程度の割合で1の目が出ることの新たな説明

さらに，Thm. 2 より，以下を示すことができます．ただし，パラメータ{{< katex >}}(N,1/6){{< /katex >}} の二項分布に従う確率変数を{{< katex >}}X_N{{< /katex >}} と表します．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} 任意の \\(\epsilon>0\\) について，以下が成り立つ．

{{< katex display >}}\lim_{N\to\infty}P\left(\left|\frac{X_N}{N}-\frac{1}{6}\right|\ge\epsilon\right)=0{{< /katex >}}
{{< /hint >}}

これは，例えば {{< katex >}}\epsilon=10^{-10}{{< /katex >}} のような小さな値をとったとしても，{{< katex >}}N{{< /katex >}}を十分大きくとると，サイコロを {{< katex >}}N{{< /katex >}}回投げて1の目が出た割合 {{< katex >}}X_N/N{{< /katex >}} と {{< katex >}}1/6{{< /katex >}} が {{< katex >}}\epsilon=10^{-10}{{< /katex >}} 以上になる確率（{{< katex >}}1/6{{< /katex >}} からほんの少しでもずれる確率）は0に近づく（ほとんど起こらなくなる）ということなので，サイコロを投げる回数 {{< katex >}}N{{< /katex >}} を十分大きくとると，**サイコロを {{< katex >}}N{{< /katex >}}回投げたときおよそ6回に1回程度の割合で1の目が出る** ことを示しています．

## 大数の法則を用いた説明

Thm. 5 が，サイコロを {{< katex >}}N{{< /katex >}}回投げたときおよそ6回に1回程度の割合で1の目が出ることの，かなり直接的な説明を与えており，本節の目的は達成したといえます．

ただし，Thm. 5 は**確率収束**と呼ばれる収束性を用いて説明されますが，さらに強く，**概収束**と呼ばれる収束性を用いて説明できることが知られています．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} 以下が成り立つ．

{{< katex display >}}P\left(\lim_{n\to\infty}\frac{X_N}{N}=\frac{1}{6}\right)=1{{< /katex >}}
{{< /hint >}}

これは，サイコロを {{< katex >}}N{{< /katex >}}回投げて1の目が出た割合 {{< katex >}}X_N/N{{< /katex >}} の {{< katex >}}N{{< /katex >}} を大きくすると，ほとんど確実に {{< katex >}}1/6{{< /katex >}} に収束することを表しています．これもかなり直接的に，**サイコロを {{< katex >}}N{{< /katex >}}回投げたときおよそ6回に1回程度の割合で1の目が出る** ことを示しています．


Thm. 5 の結果は**大数の弱法則**，Thm. 6 の結果は**大数の強法則** と呼ばれる法則の特殊ケースです．どちらも，二項分布でなく，ベルヌーイ分布と呼ばれる分布を考えて，それぞれの法則をあてはめることで得られます．

## コンピュータでのシミュレーション

最後に，コンピュータによるシミュレーション結果について説明します．

大数の弱法則では，{{< katex >}}N{{< /katex >}} を十分大きくすると，{{< katex >}}X_N/N{{< /katex >}} が{{< katex >}}1/6{{< /katex >}} から外れることはほとんどないことを主張しています．大数の強法則では，{{< katex >}}N{{< /katex >}} を十分大きくすると，{{< katex >}}X_N/N{{< /katex >}} はほとんど確実に {{< katex >}}1/6{{< /katex >}} に近づくことを主張しています．

そこで，サイコロを1000回投げることをコンピュータ上でシミュレートし，サイコロを {{< katex >}}N\,(0\le N\le 1000){{< /katex >}} 回投げたとき1の目が出た回数の割合を求めてプロットします．これを数回繰り返し，各 {{< katex >}}N{{< /katex >}} でどれくらいのばらつきがあるか，{{< katex >}}1/6{{< /katex >}} に近づくかを確認します．

区間 {{< katex >}}[0,1){{< /katex >}} 上の値を一様ランダムに返してくれる関数があるとします．
ランダムに得られた {{< katex >}}y\in[0,1){{< /katex >}} に対し，{{< katex >}}x=\lfloor 6y\rfloor+1{{< /katex >}} とすると，一様ランダムに {{< katex >}}\{1,2,\dots,6\}{{< /katex >}} を返す関数をつくることができます．

これを利用して，サイコロを1000回投げることコンピュータでシミュレートし，それを4回繰り返した結果を図示したものは以下のとおりです．この4回の試行は4つの色で区別します．

{{< figure src="/images/docs/math/stat/dice/dice.png" title="Figure 1. シミュレーション結果" class="text-center" >}}

Fig. 1 を見ると，100回までは結果にばらつきがありますが，{{< katex >}}N{{< /katex >}} を大きくすると，ばらつきは小さくなり，{{< katex >}}1/6{{< /katex >}} に近づいていることが確認できました．

## まとめ

本ページでは，確率変数を導入し，大数の弱法則，大数の強法則を用いることで，**およそ6回に1回程度の割合で1の目が出ることを，より直接的に示せる**ことを説明しました．

これは，公理的確率論が頻度主義的確率論と矛盾しないことの一例を確認したことになります．
