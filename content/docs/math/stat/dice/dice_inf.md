---
title: "サイコロを無限回投げる場合の確率モデル"
weight: 5
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---
# サイコロを無限回投げる場合の確率モデル

## 概要

前ページまでで，サイコロを繰り返し投げる試行の確率モデルを定義しました．しかし，投げる回数 {{< katex >}}N{{< /katex >}} を固定した場合でしか説明していません．

本ページでは，サイコロを無限回投げる場合の確率モデルについて説明します．有限の場合ほど明らかではないので，ひとつずつ確認しながら構成します．

## 確率の定義

[既に述べたとおり]({{< ref dice_basic.md >}}#確率の定義)，{{< katex >}}\Omega{{< /katex >}} を集合，{{< katex >}}\mathfrak{F}{{< /katex >}} を {{< katex >}}\Omega{{< /katex >}} の完全加法族としたとき，以下を満たす関数 {{< katex >}}P:\mathfrak{F}\to\mathbb{R}{{< /katex >}} を確率と呼ぶのでした．

1. \\(A\in\mathfrak{F}\\) ならば \\(P(A)\ge0\\),
2. \\(P(\Omega)=1\\),
3. \\(A_1,A_2,\dots\in\mathfrak{F}\\) が互いに素ならば，\\(P(\sum_{i=1}^{\infty}A_i)=\sum_{i=1}^{\infty}P(A_i)\\).

また，{{< katex >}}(\Omega,\mathfrak{F},P){{< /katex >}} を確率空間と呼ぶのでした．

## サイコロを無限回投げる場合を表す確率空間の具体的構成

以降では，サイコロを無限回投げる場合を表す確率空間 {{< katex >}}(\Omega_{\infty},\mathfrak{F}_{\infty},P_{\infty}){{< /katex >}} を具体的に構成します．

### \\(\Omega_\infty\\) の構成

{{< katex >}}\Omega_1=\{\omega_1,\omega_2,\dots,\omega_6\}{{< /katex >}} とし，{{< katex >}}\Omega_{\infty}{{< /katex >}} を，

{{< katex display >}}
\Omega_{\infty}=\{(\omega^i)_{i\in\mathbb{N}}\mid\forall i\in\mathbb{N}\,(\omega^i\in\Omega_1)\}
{{< /katex >}}

つまり，{{< katex >}}\Omega_{\infty}=\Omega^{\mathbb{N}}{{< /katex >}} とします[^1]<sup>, </sup>[^2]．
[^1]:一般に，集合 {{< katex >}}A,B{{< /katex >}} について，{{< katex >}}A^B{{< /katex >}} で {{< katex >}}B{{< /katex >}} から {{< katex >}}A{{< /katex >}} への写像全体を表します．
[^2]:{{< katex >}}\omega^i{{< /katex >}} は {{< katex >}}\omega{{< /katex >}} の {{< katex >}}i{{< /katex >}} 乗ではありません．

### \\(\mathfrak{F}\_{\infty},P\_{\infty}\\) の構成

{{< katex >}}\mathfrak{F}_{\infty},P_{\infty}{{< /katex >}} を定めるには準備が必要です．
まず，{{< katex >}}1\le k\in\mathbb{N}{{< /katex >}} について，
{{< katex display >}}
N^{(k)}=\{(n_1,n_2,\dots,n_k)\in\mathbb{N}^k\mid 1\le n_1<\dots<n_k\}
{{< /katex >}}

とし，{{< katex >}}N^{(0)}=\{\emptyset\}{{< /katex >}} とします．

次に，{{< katex >}}1\le k\in\mathbb{N}{{< /katex >}} に対し，{{< katex >}}\Omega\in2^{\Omega_1^k},n\in N^{(k)}{{< /katex >}} に対して，
{{< katex display >}}
F_{k,\Omega,n}=\{\omega\in\Omega_{\infty}\mid(\omega^{n_1},\omega^{n_2},\dots,\omega^{n_k})\in\Omega\}
{{< /katex >}}
とし，{{< katex >}}F_{0,\{\emptyset\},n}=\Omega_{\infty},F_{0,\emptyset,n}=\emptyset{{< /katex >}} とします．

ここで，{{< katex >}}\mathfrak{F}_{\infty}^0\subset2^{\Omega_{\infty}}{{< /katex >}} を，
{{< katex display >}}
\mathfrak{F}_{\infty}^0=\{F_{k,\Omega,n}\mid\Omega\in2^{\Omega_1^k},n\in N^{(k)},k\in\mathbb{N}\}
{{< /katex >}}
とします．

{{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} は以下の性質を満たします．

{{< hint info >}}
{{< theorem-label name="Lemma" >}} \\(\mathfrak{F}_{\infty}^0\\) は以下の性質を満たす．
1. \\(\emptyset\in\mathfrak{F}_{\infty}^0\\),
2. \\(A\in\mathfrak{F}\_{\infty}^0\\) ならば \\(A^c\in\mathfrak{F}\_{\infty}^0\\),
3. \\(A,B\in\mathfrak{F}\_{\infty}^0\\) ならば \\(A\cup B\in\mathfrak{F}\_{\infty}^0\\),
{{< /hint >}}

Lem.1 を示します．まず，1 を示します．{{< katex >}}k=1{{< /katex >}} とし，{{< katex >}}\emptyset\in2^{\Omega_1^1}{{< /katex >}}, {{< katex >}}n=(1)\in N^{(1)}{{< /katex >}} とします．このとき，{{< katex >}}\omega\in F_{1,\emptyset,(1)}{{< /katex >}} が存在するとすると，{{< katex >}}(\omega_1)\in\emptyset{{< /katex >}} となり矛盾します．よって，背理法によって，{{< katex >}}F_{1,\emptyset,(1)}=\emptyset{{< /katex >}} となります．したがって，{{< katex >}}\emptyset=F_{1,\emptyset,(1)}\in\mathfrak{F}_{\infty}^0{{< /katex >}} です．

2 を示します．{{< katex >}}A\in\mathfrak{F}_{\infty}^0{{< /katex >}} ならば，{{< katex >}}\Omega\in2^{\Omega_1^k},n\in N^{(k)}{{< /katex >}} が存在し，{{< katex >}}A=F_{k,\Omega,n}{{< /katex >}} となります．このとき，
{{< katex display >}}
A^c=F_{k,\Omega,n}^c=\{\omega\in\Omega_{\infty}\mid(\omega^{n_1},\omega^{n_2},\dots,\omega^{n_k})\in\Omega^c\}
{{< /katex >}}
ですが，{{< katex >}}\Omega^c\in2^{\Omega_1^k}{{< /katex >}} なので，{{< katex >}}A^c=F_{k,\Omega,n}^c=F_{k,\Omega^c,n}\in\mathfrak{F}_{\infty}^0{{< /katex >}} が成り立ちます．

3 を示します．{{< katex >}}A,B\in\mathfrak{F}_{\infty}^0{{< /katex >}} ならば，{{< katex >}}\Omega^{(1)}\in2^{\Omega_1^{k_1}},\Omega^{(2)}\in2^{\Omega_2^{k_2}},n^{(1)}\in N^{(k_1)},n^{(2)}\in N^{(k_2)}{{< /katex >}} が存在し，{{< katex >}}A=F_{k_1,\Omega^{(1)},n^{(1)}},B=F_{k_2,\Omega^{(2)},n^{(2)}}{{< /katex >}} が成り立ちます．

ここで，{{< katex >}}n^{(1)},n^{(2)}{{< /katex >}} の要素を重複を除いて小さい順に並べたものを {{< katex >}}n'_1,n'_2,\dots,n'_{k_3}{{< /katex >}} と表し，{{< katex >}}n^{(3)}=(n'_1,n'_2,\dots,n'_{k_3})\in N^{(k_3)}{{< /katex >}} とします．

いま，{{< katex >}}n^{(1)}=(n_1,n_2,\dots,n_{k_1}){{< /katex >}} とし，単射 {{< katex >}}I:\{1,2,\dots,k_1\}\to\{1,2,\dots,k_3\}{{< /katex >}} を，{{< katex >}}n_k=n'_{I(k)}\,(k=1,2,\dots,k_1){{< /katex >}} が成り立つように定めます．

さらに，{{< katex >}}\omega=(\omega^1,\omega^2,\dots,\omega^{k_1})\in\Omega^{(1)}{{< /katex >}} に対し，{{< katex >}}\bar{\omega}\in 2^{\Omega_1^{k_3}}{{< /katex >}} を以下のように定めます．
{{< katex display >}}
\begin{aligned}
&\bar{\omega}=\prod_{k=1}^{k_3}\Omega^{[k]},\\
&\Omega^{[k]}=\begin{cases}
  \{\omega^{I^{-1}(k)}\},&k\in I(\{1,2,\dots,k_1\}),\\
  \Omega_1,&k\notin I(\{1,2,\dots,k_1\}).
\end{cases}
\end{aligned}
{{< /katex >}}

ここで，{{< katex >}}\bar{\Omega}^{(1)}=\bigcup_{\omega\in\Omega^{(1)}}\bar{\omega}{{< /katex >}} とし，同様に {{< katex >}}\bar{\Omega}^{(2)}{{< /katex >}} も定めます．
{{< katex >}}\Omega^{(3)}=\bar{\Omega}^{(1)}\cup\bar{\Omega}^{(2)}{{< /katex >}} とすると，{{< katex >}}\Omega^{(3)}\in2^{\Omega_1^{k_3}}{{< /katex >}} が成り立ちます．

このとき，
{{< katex display >}}
A\cup B=\{\omega\in\Omega_{\infty}\mid(\omega^{n'_1},\omega^{n'_2},\dots,\omega^{n'_{k_3}})\in\Omega^{(3)}\}
{{< /katex >}}
が成り立ちますので，{{< katex >}}A\cup B=F_{k_3,\Omega^{(3)},n^{(3)}}\,(\Omega^{(3)}\in2^{\Omega_1^{k_3}},n^{(3)}\in N^{(k_3)}){{< /katex >}} と表せます．したがって，{{< katex >}}A\cup B\in\mathfrak{F}_{\infty}^0{{< /katex >}} が成り立ちます．

以上より，Lem. 1 が示せました．

Lem. 1 により，**{{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} は {{< katex >}}\Omega_{\infty}{{< /katex >}} の有限加法族である** とわかりました [^3]．
[^3]:集合 {{< katex >}}X{{< /katex >}} の部分集合の族 {{< katex >}}\mathfrak{F}{{< /katex >}} が，(1) {{< katex >}}\emptyset\in\mathfrak{F}{{< /katex >}}, (2) {{< katex >}}A\in\mathfrak{F}{{< /katex >}} ならば {{< katex >}}A^c\in\mathfrak{F}{{< /katex >}}, (3) {{< katex >}}A,B\in\mathfrak{F}{{< /katex >}} ならば {{< katex >}}A\cup B\in\mathfrak{F}{{< /katex >}}, を満たすとき，{{< katex >}}\mathfrak{F}{{< /katex >}} は有限加法族であるといいます．

次に，{{< katex >}}P_{\infty}^0:\mathfrak{F}_{\infty}^0\to\mathbb{R}{{< /katex >}} を，
{{< katex display >}}
P_{\infty}^0(F_{k,\Omega,n})=\frac{|\Omega|}{6^k}
{{< /katex >}}
で定めます．

{{< katex >}}P_{\infty}^0{{< /katex >}} は以下の性質を満たします．

{{< hint info >}}
{{< theorem-label name="Lemma" >}} \\(P_{\infty}^0\\) は以下の性質を満たす．
1. \\(P_{\infty}^0(\emptyset)=0\\),
2. \\(A\in\mathfrak{F}\_{\infty}^0\\) ならば \\(0\le P_{\infty}^0(A)\le\infty\\),
3. \\(n\ge2\\) に対し，\\(A_1,A_2,\dots,A_n\in\mathfrak{F}_{\infty}^0\\) が互いに素なら，以下が成り立つ．

{{< katex display >}}
P_{\infty}^0\left(\sum_{i=1}^nA_i\right)=\sum_{i=1}^nP_{\infty}^0(A_i)
{{< /katex >}}

{{< /hint >}}

Lem.2 を示します．1 は {{< katex >}}\emptyset=F_{1,\emptyset,(1)}{{< /katex >}} より，{{< katex >}}P_{\infty}^0(\emptyset)=P_{\infty}^0(F_{1,\emptyset,(1)})=|\emptyset|/6^1=0{{< /katex >}} から成り立ちます [^4]．
[^4]:{{< katex >}}k=1{{< /katex >}} の場合で述べましたが，{{< katex >}}k{{< /katex >}} のとり方によりません．任意の {{< katex >}}k{{< /katex >}} について，{{< katex >}}\emptyset\in2^{\Omega_1^k}{{< /katex >}} であるためです．

2 は定義より負にならないことから成り立ちます．

3 を示します．まず，{{< katex >}}A,B\in\mathfrak{F}_{\infty}^0{{< /katex >}} が {{< katex >}}A\cap B=\emptyset{{< /katex >}} を満たすとき，{{< katex >}}P_{\infty}^0(A+B)=P_{\infty}^0(A)+P_{\infty}^0(B){{< /katex >}} であることを示します．

{{< katex >}}A,B\in\mathfrak{F}_{\infty}^0{{< /katex >}} なので，{{< katex >}}\Omega^{(1)}\in2^{\Omega_1^{k_1}},\Omega^{(2)}\in2^{\Omega_2^{k_2}},n^{(1)}\in N^{(k_1)},n^{(2)}\in N^{(k_2)}{{< /katex >}} が存在し，{{< katex >}}A=F_{k_1,\Omega^{(1)},n^{(1)}},B=F_{k_2,\Omega^{(2)},n^{(2)}}{{< /katex >}} が成り立ちます．

Lem.1 の証明と同様に，{{< katex >}}\bar{\Omega}^{(1)},\bar{\Omega}^{(2)}{{< /katex >}} をつくると，{{< katex >}}A\cap B=\emptyset{{< /katex >}} ならば {{< katex >}}\bar{\Omega}^{(1)}\cap\bar{\Omega}^{(2)}=\emptyset{{< /katex >}} であることがわかります．

{{< katex >}}A\cap B=\emptyset{{< /katex >}} ならば，{{< katex >}}A+B=F_{k_3,\bar{\Omega}^{(1)}+\bar{\Omega}^{(2)},n^{(3)}}{{< /katex >}} と表せるため，
{{< katex display >}}
\begin{aligned}
P_{\infty}^0(A+B)&=\frac{|\bar{\Omega}^{(1)}+\bar{\Omega}^{(2)}|}{6^{k_3}}\\
&=\frac{|\bar{\Omega}^{(1)}|+|\bar{\Omega^{(2)}}|}{6^{k_3}}\\
&=\frac{6^{k_3-k_1}|\Omega^{(1)}|+6^{k_3-k_2}|\Omega^{(2)}|}{6^{k_3}}\\
&=\frac{|\Omega^{(1)}|}{6^{k_1}}+\frac{|\Omega^{(2)}|}{6^{k_2}}\\
&=P_{\infty}^0(A)+P_{\infty}^0(B).
\end{aligned}
{{< /katex >}}
が成り立ちます．つまり，{{< katex >}}n=2{{< /katex >}} のとき主張が示せました．

ある {{< katex >}}n\,(\ge2){{< /katex >}} について主張を満たすとき，{{< katex >}}n+1{{< /katex >}} のときも満たすことは，同じ議論から示せます．したがって，数学的帰納法によって，任意の {{< katex >}}n\in\mathbb{N}{{< /katex >}} について主張が成り立ちます．

以上より，Lem. 2 が示せました．

Lem. 2 より，{{< katex >}}P_{\infty}^0{{< /katex >}} は **測度空間 {{< katex >}}(\Omega_{\infty},\mathfrak{F}_{\infty}^0){{< /katex >}} の有限加法的測度** であるとわかりました[^5]．
[^5]:集合 {{< katex >}}X{{< /katex >}} とその部分集合の有限加法族 {{< katex >}}\mathfrak{F}{{< /katex >}} があって，{{< katex >}}\mathfrak{F}{{< /katex >}} 上の集合関数 {{< katex >}}m{{< /katex >}} が，(1) すべての {{< katex >}}A\in\mathfrak{F}{{< /katex >}} に対して {{< katex >}}0\le m(A)\le\infty{{< /katex >}}，(2) {{< katex >}}m(\emptyset)=0{{< /katex >}}, (3) {{< katex >}}A_1,A_2,\dots,A_n{{< /katex >}} が互いに素なら {{< katex >}}m(\sum_{i=1}^nA_i)=\sum_{i=1}^nm(A_i){{< /katex >}}, を満たすとき，{{< katex >}}m{{< /katex >}} を {{< katex >}}\mathfrak{F}{{< /katex >}} 上の有限加法的測度といいます．

さて一般に，コンパクト空間のその閉集合族 {{< katex >}}\mathcal{F}{{< /katex >}} について，任意の {{< katex >}}k{{< /katex >}} と任意の {{< katex >}}F_1,F_2,\dots,F_k\in\mathcal{F}{{< /katex >}} について {{< katex >}}\bigcap_{i=1}^kF_i\neq\emptyset{{< /katex >}} が成り立つ（有限交叉性をもつ）ならば，{{< katex >}}\bigcap_{F\in\mathcal{F}}F\neq\emptyset{{< /katex >}} であることが知られています [[1]](#cite:1)．

この事実を利用して，{{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} の性質を一つ述べます．

まず，有限集合 {{< katex >}}\Omega_1{{< /katex >}} に離散位相をいれた位相空間 {{< katex >}}(\Omega_1,2^{\Omega_1}){{< /katex >}} を考えます．

{{< katex >}}\mathcal{F}\subset2^{\Omega_1}{{< /katex >}} が {{< katex >}}\Omega_1=\bigcup_{F\in\mathcal{F}}F{{< /katex >}} を満たすならば，{{< katex >}}i=1,2,\dots,6{{< /katex >}} について {{< katex >}}\omega_i\in F_i{{< /katex >}} である {{< katex >}}F_i\in\mathcal{F}{{< /katex >}} が存在します．よって，{{< katex >}}\Omega_1=\bigcup_{i=1}^6F_i{{< /katex >}} と書けますので，この位相空間はコンパクト空間とわかります．

次に，{{< katex >}}\Omega_{\infty}{{< /katex >}} は {{< katex >}}\Omega_1{{< /katex >}} の無限個の直積なので，直積位相をいれた位相空間を考えることができます．この空間もまたコンパクト空間になることが知られています（Tychonoff の定理）．また，この位相空間の各開集合は，{{< katex >}}\prod_{i=1}^{\infty}U_i\,(U_i\in2^{\Omega_1}){{< /katex >}} であって有限個を除いて {{< katex >}}U_i=\Omega_1{{< /katex >}} であるような集合の（必ずしも有限個ではない）和集合となります [[1]](#cite:1)．

いま，{{< katex >}}X_n\in\mathfrak{F}_{\infty}^0\,(n=1,2,\dots){{< /katex >}} が {{< katex >}}X_n\supset X_{n+1}{{< /katex >}} かつ {{< katex >}}\bigcap_{n=1}^{\infty}X_n=\emptyset{{< /katex >}} を満たすとします．

この {{< katex >}}X_n{{< /katex >}} は，その直積位相においてすべて閉集合です．もし，どの有限個の {{< katex >}}X_1,X_2,\dots,X_k\in\mathfrak{F}_{\infty}^0{{< /katex >}} をとっても {{< katex >}}\bigcap_{i=1}^kX_i\neq\emptyset{{< /katex >}} （つまり，有限交叉性をもつ）ならば，{{< katex >}}\bigcap_{n=1}^{\infty}F_n=\emptyset{{< /katex >}} となり矛盾します．{{< katex >}}\bigcap_{i=1}^nX_i=X_n{{< /katex >}} であることに注意すると，背理法によって，ある {{< katex >}}N{{< /katex >}} が存在し，{{< katex >}}n\ge N{{< /katex >}} ならば {{< katex >}}X_n=\emptyset{{< /katex >}} であることがわかります．

したがって，以下が成り立ちます．

{{< hint info >}}
{{< theorem-label name="Lemma" >}} \\(X_n\in\mathfrak{F}\_{\infty}^0\,(n=1,2,\dots)\\) が \\(X_n\supset X\_{n+1}\\) かつ \\(\bigcap_{n=1}^{\infty}X\_n=\emptyset\\) を満たすとする．このとき，\\(\lim_{n\to\infty}P_{\infty}^0(X_n)=0\\) である．
{{< /hint >}}

これは既に述べたことから，ある {{< katex >}}N{{< /katex >}} が存在し，{{< katex >}}n\ge N{{< /katex >}} ならば {{< katex >}}X_n=\emptyset{{< /katex >}} なので，{{< katex >}}n\ge N{{< /katex >}} ならば {{< katex >}}P_{\infty}^0(X_n)=0{{< /katex >}} であることから従います．

この事実を使うと，以下が示せます．

{{< hint info >}}
{{< theorem-label name="Lemma" >}} \\((\Omega\_{\infty},\mathfrak{F}\_{\infty}^0,P\_{\infty}^0)\\) は以下を満たす．

* \\(A\_k\in\mathfrak{F}\_{\infty}^0\,(k=1,2,\dots)\\) が互いに素ならば，\\(P_{\infty}^0(\sum\_{k=1}^{\infty}A_k)=\sum_{k=1}^{\infty}P_{\infty}^0(A_k)\\) である．
{{< /hint >}}

これは，Lem. 3 と同値であることが知られています [[2]](#cite:2)．

また，以下も満たします．

{{< hint info >}}
{{< theorem-label name="Lemma" >}} \\((\Omega\_{\infty},\mathfrak{F}\_{\infty}^0,P\_{\infty}^0)\\) は以下を満たす．
* \\(\Omega=\bigcup\_{k=1}^{\infty}A_k,A_k\in\mathfrak{F}\_{\infty}^0,P\_{\infty}^0(A_k)<\infty\\) を満たす \\(A_k\ (k=1,2,\dots)\\) が存在する．
{{< /hint >}}

たとえば，{{< katex >}}A=F_{1,\{\omega_1\},(1)},B=F_{1,\Omega_1-\{\omega_1\},(1)}{{< /katex >}} とすれば，{{< katex >}}P_{\infty}^0(A)=1/6<\infty,P_{\infty}^0(B)=5/6<\infty,A\cup B=\Omega_{\infty}{{< /katex >}} です．

Lem. 4, 5 より **{{< katex >}}P_{\infty}^0{{< /katex >}} は {{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} 上で完全加法的かつ{{< katex >}}\sigma{{< /katex >}}-有限であることがわかります [^6]<sup>, </sup>[^7]．**
[^6]:有限加法族{{< katex >}}\mathfrak{F}{{< /katex >}} 上の有限加法的測度 {{< katex >}}m{{< /katex >}} が，{{< katex >}}A_1,A_2,\dots\in\mathfrak{F}{{< /katex >}} が互いに素で {{< katex >}}\sum_{n=1}^{\infty}A_n\in\mathfrak{F}{{< /katex >}} ならば {{< katex >}}m(\sum_{n=1}^{\infty}A_i)=\sum_{n=1}^{\infty}m(A_n){{< /katex >}} であるとき，{{< katex >}}m{{< /katex >}} は {{< katex >}}\mathfrak{F}{{< /katex >}} の上で完全加法的な測度といいます．
[^7]:{{< katex >}}\mathfrak{F}{{< /katex >}}上の有限加法的測度 {{< katex >}}m{{< /katex >}} について，{{< katex >}}m(X_k)<\infty{{< /katex >}} なる {{< katex >}}X_1,X_2,\dots\in\mathfrak{F}{{< /katex >}} が存在して {{< katex >}}X=\bigcup_{k=1}^{\infty}X_k{{< /katex >}} と書けるとき，{{< katex >}}m{{< /katex >}} は {{< katex >}}\sigma{{< /katex >}}-有限であるといいます．

次に，{{< katex >}}\mathfrak{F}_{\infty}{{< /katex >}} を以下のように定めます．

{{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} を含む完全加法族全体の集合を {{< katex >}}\mathcal{B}{{< /katex >}} とします．{{< katex >}}2^{\Omega_{\infty}}\in\mathcal{B}{{< /katex >}} であるため，{{< katex >}}\mathcal{B}\neq\emptyset{{< /katex >}} であることに注意し，
{{< katex >}}
\mathfrak{F}_{\infty}=\bigcap_{\mathfrak{B}\in\mathcal{B}}\mathfrak{B}
{{< /katex >}}
とします．このようにすると，{{< katex >}}\mathfrak{F}_{\infty}{{< /katex >}} は {{< katex >}}\mathfrak{F}_{\infty}^0{{< /katex >}} を含む最小の完全加法族であることが確認できます（例えば，[[2]](#cite:2)）．

以上より，次の定理が成り立ちます．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} \\((\Omega\_{\infty},\mathfrak{F}\_{\infty}^0)\\) 上の有限加法的測度 \\(P\_{\infty}^0\\) は，\\((\Omega\_{\infty},\mathfrak{F}\_{\infty})\\) 上の完全加法的測度 \\(P_{\infty}\\) に一意に拡張できる．
{{< /hint >}}

これは，Lem. 4, 5 から，E. Hopf の拡張定理 （例えば，[[2]](#cite:2)） が適用できるため，成り立ちます．

Thm. 6 によって，{{< katex >}}P_{\infty}{{< /katex >}} は完全加法的測度なので，{{< katex >}}A\in\mathfrak{F}_{\infty}{{< /katex >}} ならば {{< katex >}}P_{\infty}(A)\ge0{{< /katex >}} であることと，{{< katex >}}A_1,A_2,\dots\in\mathfrak{F}_{\infty}{{< /katex >}} が互いに素ならば，{{< katex >}}P_{\infty}(\sum_{i=1}^{\infty}A_i)=\sum_{i=1}^{\infty}P_{\infty}(A_i){{< /katex >}} であることが従います．{{< katex >}}\Omega_{\infty}\in\mathfrak{F}_{\infty}^0{{< /katex >}} で {{< katex >}}\Omega_{\infty}=F_{0,\{\emptyset\},n}{{< /katex >}} なので，{{< katex >}}P_{\infty}(\Omega_{\infty})=1/6^0=1{{< /katex >}} より {{< katex >}}P_{\infty}{{< /katex >}} は確率になります．

よって，サイコロを無限回投げる場合を表す確率空間 {{< katex >}}(\Omega_{\infty},\mathfrak{F}_{\infty},P_{\infty}){{< /katex >}} が具体的に構成できました．

## まとめ

本ページでは，サイコロを無限回投げる場合を表す確率空間を具体的に構成しました．有限回の場合は簡単に構成できますが，無限回の場合はそれほど明らかでないことがわかります．

なお，本ページでは，ひとつずつ確認しながら確率モデルを構成しましたが，一般にはコルモゴロフの拡張定理によって，無限回試行の確率モデルが構成できることが示せます．

## 参考文献

{{< anchor "cite:1" >}}[1] 彌永 昌吉，小平 邦彦，現代数学概説I，岩波書店，東京，1961.    
{{< anchor "cite:2" >}}[2] 伊藤 清三，数学選書4 ルベーグ積分入門，裳華房，東京，1963. 
