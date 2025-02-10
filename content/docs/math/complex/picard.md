---
title: "Picard の定理"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# Picard の定理

## 概要

複素数上で定義された関数を扱う分野は，複素解析や **函数論** と呼ばれます．

複素解析・函数論の教科書は多く執筆されていますが，吉田洋一の『函数論』[[1]](#cite:1) が古典的名著として知られています．

本ページでは，その中から，**Picard の定理** について概説します．

Picard の定理は **真性特異点** の性質を述べた定理です．
この定理から，真性特異点のまわりでは函数が複雑なふるまいをすることがわかります．

真性特異点とは {{< katex >}}\exp(1/z){{< /katex >}} の {{< katex >}}z=0{{< /katex >}} のような点をいいます．
{{< katex >}}1/z{{< /katex >}} の {{< katex >}}z=0{{< /katex >}} と似ていますが，これは真性特異点ではありません．
{{< katex >}}1/z{{< /katex >}} の {{< katex >}}z=0{{< /katex >}} のまわりより，{{< katex >}}\exp(1/z){{< /katex >}} の {{< katex >}}z=0{{< /katex >}} のまわりの方が，函数は様々な値をとります．

## Picard の定理

[[1]](#cite:1) の {{< katex >}}\S{{< /katex >}}59 では，以下の主張がなされています．

{{% hint info %}}{{< theorem-label name="Theorem" comment="Picard の定理 [[1]](#cite:1)" >}} \\(f(z)\\) は \\(0<|z-c|\<R\\) で有理型で，\\(c\\) は \\(f(z)\\) の真性特異点であるとする．しかるときは

\\[ 0<|z-c|\<R\quad\text{では}\quad f(z)\neq\omega\\]

であるような \\(\omega\\) は，もしあるにしても，その数は2個を超えることはない．
{{% /hint %}}

{{< katex >}}f{{< /katex >}} が有理型という仮定がありますが，これが正則である場合の記述を目にすることの方が多いかもしれません．

さらに，[[1]](#cite:1) では，この定理から，以下がいえることも言及されています．

{{% hint info %}}{{< theorem-label name="Corollary" comment="[[1]](#cite:1)" >}} \\(f(z)\\) は \\(0<|z-c|\<R\\) で有理型で，\\(c\\) は \\(f(z)\\) の真性特異点であるとする．\\(\delta\le R\\) とする．

\\[ 0<|z-c|\<\delta\quad\text{では}\quad f(z)\neq\omega\\]

であるような \\(\omega\\) は，もしあるにしても，その数は2個を超えることはない．
{{% /hint %}}

{{% hint info %}}{{< theorem-label name="Corollary" comment="[[1]](#cite:1)" >}} \\(f(z)\\) は \\(0<|z-c|\<R\\) で有理型で，\\(c\\) は \\(f(z)\\) の真性特異点であるとする．

\\[ 0<|z-c|\<R\quad\text{では}\quad f(z)=\omega\\]

であるような \\(z\\) が高々有限個しかない \\(\omega\\) （**Picard の除外値**）はあるにしても2個もしくは1個である．
{{% /hint %}}

つまり，**真性特異点のまわりでは，その有理型函数は，高々2個の例外を除き，すべての値を無限回とる** ということになり，要するに，函数は真性特異点のまわりで **“大暴れする”** ということになります．

本ページでは，この定理に関する用語・概念や証明の概略を [[1]](#cite:1) に沿ってまとめます．

## 用語や関連する概念

### 有理型・真性特異点

まずは，Theorem 1 の内容を理解するため，用語や関連する概念の説明をします．
ただし，ここではその目的で必要な説明に絞り，ごく基本的なことや，本論に関係しない詳細な議論は適宜省略します．

{{< katex >}}\mathbb{C}{{< /katex >}} を複素数全体の集合とします．

{{< katex >}}D\subseteq\mathbb{C}{{< /katex >}} が **領域** であるとは，{{< katex >}}D{{< /katex >}} 上の任意の2点が {{< katex >}}D{{< /katex >}}上の曲線で結べることをいいます．

函数 {{< katex >}}f:D\to\mathbb{C}{{< /katex >}} を考えます．
このような函数を {{< katex >}}D{{< /katex >}} 上の函数と呼ぶことにします．
{{< katex >}}f{{< /katex >}} が {{< katex >}}D{{< /katex >}} のすべての点で微分可能なら，{{< katex >}}f{{< /katex >}} は {{< katex >}}D{{< /katex >}} 上で **正則** であるといいます．
ここで，{{< katex >}}f{{< /katex >}} が {{< katex >}}c\in D{{< /katex >}} で **微分可能** であるとは，
{{< katex display=true >}}
\frac{f(z)-f(c)}{z-c}
{{< /katex >}}
の {{< katex >}}z\to c{{< /katex >}} における（有限な）極限値が存在することをいいます．

{{< katex >}}\{x\mid R'<|z-c|< R\}\,(0\le R'< R\le+\infty){{< /katex >}} という領域を考えます．
ただし，{{< katex >}}R=+\infty{{< /katex >}} の場合は {{< katex >}}\{x\mid R'<|z-c|\}\,(0\le R'){{< /katex >}} を指すものとします．

いま，{{< katex >}}f{{< /katex >}} が {{< katex >}}\{x\mid R'<|z-c|< R\}\,(0\le R'< R\le+\infty){{< /katex >}} 上で正則であるとします．
このとき，

{{< katex display=true >}}
f(z)=\sum_{n=0}^{\infty}c_n(z-c)^n+\sum_{n=1}^{\infty}\frac{c_{-n}}{(z-c)^n}
{{< /katex >}}

なる {{< katex >}}\{c_n\}_{c\in\mathbb{Z}}{{< /katex >}} が一意に存在することが知られています（**Laurant展開**）．

特に，{{< katex >}}f{{< /katex >}} が {{< katex >}}\{x\mid 0<|z-c|< R\}\,(0< R\le+\infty){{< /katex >}} 上で正則であるならば，{{< katex >}}0<|z-c|< R{{< /katex >}} において，

{{< katex display=true >}}
f(z)=\sum_{n=0}^{\infty}c_n(z-c)^n+\sum_{n=1}^{\infty}\frac{c_{-n}}{(z-c)^n}
{{< /katex >}}

なる {{< katex >}}\{c_n\}_{c\in\mathbb{Z}}{{< /katex >}} が一意に存在します．

ここで，ある {{< katex >}}k{{< /katex >}} が存在し，{{< katex >}}c_{-k}\neq0{{< /katex >}} かつ {{< katex >}}n>k{{< /katex >}} ならば {{< katex >}}c_{-n}=0{{< /katex >}} であるとき，{{< katex >}}f{{< /katex >}} は {{< katex >}}c{{< /katex >}} において **極** を有するといいます．

一方，すべての {{< katex >}}n=1,2,\dots{{< /katex >}} について {{< katex >}}c_{-n}=0{{< /katex >}} である場合，{{< katex >}}c{{< /katex >}} は {{< katex >}}f{{< /katex >}} の **除去可能な特異点** といいます．
このとき，{{< katex >}}f(c)=\lim_{z\to c}f(z)=c_0{{< /katex >}} と定めると，{{< katex >}}f{{< /katex >}} は {{< katex >}}\{z\mid|z-c|< R\}{{< /katex >}} において正則であるようにできます．
以降，**除去可能な特異点は，この方法で函数がその近傍で正則になるように直してしまうことにします．**

{{< katex >}}D{{< /katex >}} を領域とします．{{< katex >}}E\subseteq D{{< /katex >}} が存在し，{{< katex >}}D'=D-E{{< /katex >}} が領域であり，{{< katex >}}f|_{D'}{{< /katex >}} が {{< katex >}}D'{{< /katex >}} 上正則で，{{< katex >}}E{{< /katex >}} の各点で {{< katex >}}f{{< /katex >}} が極を有する場合，{{< katex >}}f{{< /katex >}} は {{< katex >}}D{{< /katex >}} で **有理型** であるといいます．

簡単にいうと，**“その函数が領域 {{< katex >}}D{{< /katex >}} の極を除いて正則ならば，その函数は {{< katex >}}D{{< /katex >}}上で有理型という”** ということです．

有理型函数の例としては，"多項式分の多項式” の形で表される有理函数が挙げられます．

なお，正則函数のように，有理型函数でも，有理型函数 {{< katex >}}f{{< /katex >}} は {{< katex >}}c\in E{{< /katex >}} において極を有する，ということにします．

いま {{< katex >}}f{{< /katex >}} を {{< katex >}}\{z\mid |z-c|< R\}{{< /katex >}} 上の函数とします．
{{< katex >}}f{{< /katex >}} が {{< katex >}}\{z\mid 0<|z-c|< R\}{{< /katex >}} 上有理型で {{< katex >}}\{z\mid |z-c|< R\}{{< /katex >}} では有理型でない場合，{{< katex >}}c{{< /katex >}} は {{< katex >}}f{{< /katex >}} の **真性特異点** であるといいます．

真性特異点の例としては，冒頭に挙げたとおり，{{< katex >}}\exp(1/z){{< /katex >}} の {{< katex >}}z=0{{< /katex >}} があります．

以上により，有理型函数と真性特異点の定義を確認することができました．

### 無限遠点

複素数の世界，特に有理型函数の議論においては，複素平面の原点から無限に離れた点を1つの点とみなし，{{< katex >}}\mathbb{C}{{< /katex >}} の代わりに，この **無限遠点** {{< katex >}}\infty{{< /katex >}} を付け加えた {{< katex >}}\mathbb{C}\cup\{\infty\}{{< /katex >}} を考えると議論がしやすいことがあります．

本節では，その取り扱いについて補足します．
なぜなら，Theorem 1 は {{< katex >}}\mathbb{C}\cup\{\infty\}{{< /katex >}} の上で考えることが前提となっているからです．

まずは，{{< katex >}}f:\mathbb{C}\to\mathbb{C}{{< /katex >}} の値域 {{< katex >}}\mathbb{C}{{< /katex >}} を {{< katex >}}\mathbb{C}\cup\{\infty\}{{< /katex >}} に拡張する考え方について説明します．

{{< katex >}}f{{< /katex >}} を領域 {{< katex >}}D{{< /katex >}} 上の函数とします．
{{< katex >}}c\in D{{< /katex >}} について
{{< katex display=true >}}
  \lim_{z\to c}|f(z)|=+\infty
{{< /katex >}}
であることを，無限遠点 {{< katex >}}\infty{{< /katex >}} を使って
{{< katex >}}
  f(c)=\infty
{{< /katex >}}
と表します．

これで，函数 {{< katex >}}f{{< /katex >}} の値が {{< katex >}}\infty{{< /katex >}} である場合が定義できました．
なお，有理型函数 {{< katex >}}f{{< /katex >}} が {{< katex >}}c{{< /katex >}} において極を有するなら，{{< katex >}}f(c)=\infty{{< /katex >}} であることが知られています．

次に，有理型関数 {{< katex >}}f:\mathbb{C}\to\mathbb{C}\cup\{\infty\}{{< /katex >}} の定義域 {{< katex >}}\mathbb{C}{{< /katex >}} を {{< katex >}}\mathbb{C}\cup\{\infty\}{{< /katex >}} に拡張する考え方について説明します．
まずは，極，真性特異点，正則の概念を，{{< katex >}}z=\infty{{< /katex >}} やその近傍で定義できるようにします．

{{< katex >}}R>0{{< /katex >}} とします．{{< katex >}}f{{< /katex >}} は {{< katex >}}\{z\mid |z|>R\}{{< /katex >}} で有理型であるとします．

{{< katex >}}E=\{c\mid f\text{ は }1/c\text{ において極を有する}\}{{< /katex >}} とすると，{{< katex >}}D'=\{\zeta\mid0<|\zeta|<1/R\}-E{{< /katex >}} は領域になることが示せます．
ここで，{{< katex >}}D'{{< /katex >}} 上の函数 {{< katex >}}\phi_f{{< /katex >}} を {{< katex >}}\phi_f(\zeta)=f(1/\zeta){{< /katex >}} で定めます．
このとき，

* {{< katex >}}\phi_f(\zeta){{< /katex >}} が {{< katex >}}\zeta=0{{< /katex >}} の近傍で正則ならば，{{< katex >}}f{{< /katex >}} は {{< katex >}}z=\infty{{< /katex >}} の近傍で正則であるといいます．
* {{< katex >}}\phi_f(\zeta){{< /katex >}} が {{< katex >}}\zeta=0{{< /katex >}} において極を有するならば，{{< katex >}}f{{< /katex >}} は {{< katex >}}z=\infty{{< /katex >}} で極を有するといいます．
* {{< katex >}}\phi_f(\zeta){{< /katex >}} が {{< katex >}}\zeta=0{{< /katex >}} において真性特異点を有するならば，{{< katex >}}f{{< /katex >}} は {{< katex >}}z=\infty{{< /katex >}} で真性特異点を有するといいます．

これで，極，真性特異点，正則の概念を，{{< katex >}}z=\infty{{< /katex >}} やその近傍で定義できるようにできました．

次に，有理型函数の {{< katex >}}z=\infty{{< /katex >}} における値が定義できるようにします．

{{< katex >}}R'\ge R{{< /katex >}} を選び，{{< katex >}}0<|\zeta|<1/R'{{< /katex >}} で {{< katex >}}f(1/\zeta){{< /katex >}} が正則で，{{< katex >}}f{{< /katex >}} が {{< katex >}}z=\infty{{< /katex >}} の近傍でも正則なら，{{< katex >}}|z|>R'{{< /katex >}} において

{{< katex display=true >}}
  f(z)=\sum_{n=0}^\infty\frac{c_n}{z^n}
{{< /katex >}}
なる {{< katex >}}\{c_n\}_{n=0,1,\dots}{{< /katex >}} が一意に存在することが示せます．
これを利用して，{{< katex >}}f{{< /katex >}} が {{< katex >}}z=\infty{{< /katex >}} の近傍で正則ならば，{{< katex >}}f(\infty)=c_0{{< /katex >}} とします．
また，{{< katex >}}f{{< /katex >}} が {{< katex >}}z=\infty{{< /katex >}} で極を有するなら，{{< katex >}}f(\infty)=\infty{{< /katex >}} とします．

以上により，{{< katex >}}\mathbb{C}{{< /katex >}} の代わりに {{< katex >}}\mathbb{C}\cup\{\infty\}{{< /katex >}} を考えることで，領域 {{< katex >}}D\subseteq\mathbb{C}\cup\{\infty\}{{< /katex >}} 上で有理型な函数 {{< katex >}}f{{< /katex >}} は，{{< katex >}}D{{< /katex >}} の（極や無限遠点を含む）すべての点でその値が定義されることになります．

これで，Theorem 1 の主張が正確に理解できるようになりました．

## Picard の定理の証明

以降では，Picard の定理の証明について述べます．
[[1]](#cite:1) に従い，**Schottky の定理** を用いて証明しますが，いくつかの補題や定理の証明は省略します．

本ページでは認めて使う補題と定理は以下のとおりです．

{{% hint info %}} {{< theorem-label name="Lemma" >}} \\(f\\) は \\(\\{z\mid 0<|z-c|<R\\}\\) で正則な函数とする．\\(\\{R_\nu\\}\\) を \\(R>R_1>\dots>R_{\nu}>\dots\\) であって，\\(R_\nu\to0\\) であるような数列とする．すべての円 \\(\\{z\mid |z-c|=R_\nu\\}\\) の上で \\(|f(z)|< M\\) であるような定数 \\(M\\) が存在するならば，\\(c\\) は \\(f\\) の除去可能な特異点である．
{{% /hint %}}

{{% hint info %}} {{< theorem-label name="Lemma" >}} \\(R>0\\) とする．\\(f\\) を \\(\\{z\mid 0<|z-c|<R\\}\\) で有理型な函数とし，\\(f\\) は \\(c\\) において真性特異点を有するとする．
このとき，
\\[ c_n\neq c,\quad c_n\to c,\quad f(c_n)=\gamma \\]
であるような複素数 \\(\gamma\\) と点列 \\(\\{c_n\\}\\) が存在する．
{{% /hint %}}

{{% hint info %}} {{< theorem-label name="Theorem" comment="Schottky" >}} \\(R>0\\) とする．\\(f\\) が \\(\\{z\mid |z|<R\\}\\) 上正則で，\\(f(z)\neq0\\), \\(f(z)\neq1\\) を満たすとする．
\\(f\\) が
\\[ f(z)=\sum_{n=0}^\infty c_nz^n \\]
と展開されるとする．
\\(0\le\theta<1\\), \\(|z|\le\theta R\\) に対して，\\(c_0\\), \\(\theta\\) のみによって決まる正の定数 \\(S(c_0,\theta)\\) が存在し，
\\[ |f(z)|<S(c_0,\theta) \\]
が成り立つ．
{{% /hint %}}

ここで，Picard の定理の証明に向けて，いくつかの補題を示しておきます．

{{% hint info %}} {{< theorem-label name="Lemma" >}} \\(R>0\\) とする．\\(f\\) を \\(\\{z\mid 0<|z-c|<R\\}\\) で有理型な函数とし，\\(f\\) は値に \\(\omega_1,\omega_2,\omega_3\\) をとらないとする．ただし，\\(\omega_1,\omega_2,\omega_3\\) は相異なるものとする．

\\(\omega_1,\omega_2,\omega_3\\) がすべて有限であれば，

\\[ g(z)=\frac{f(c+zR)-\omega_1}{f(c+zR)-\omega_3}\cdot\frac{\omega_2-\omega_3}{\omega_2-\omega_1},\quad 0<|z|<1 \\]

とする．
そうでない場合は，一般性を失わず \\(\omega_3=\infty\\) として，

\\[ g(z)=\frac{f(c+zR)-\omega_1}{\omega_2-\omega_1},\quad 0<|z|<1 \\]

とする．このとき，以下が成り立つ．

1. \\(g\\) は \\(\\{z\mid 0<|z|<1\\}\\) 上で正則である，
2. \\(z=0\\) は \\(g\\) の真性特異点である，
3. \\(g(z)\not=0\\),
4. \\(g(z)\not=1\\).

{{% /hint %}}

Lemma 7 を示します．

{{< katex >}}D=\{z\mid 0<|z-c|< R\}{{< /katex >}} とします．
{{< katex >}}f{{< /katex >}} は {{< katex >}}D{{< /katex >}} で有理型なので，ある {{< katex >}}E\subseteq D{{< /katex >}} が存在し，{{< katex >}}D-E{{< /katex >}} で {{< katex >}}f{{< /katex >}} は正則で，{{< katex >}}E{{< /katex >}} の各点において {{< katex >}}f{{< /katex >}} は極を有します．

また，{{< katex >}}|(c+zR)-c|=R|z|{{< /katex >}} より，{{< katex >}}0<|z|<1{{< /katex >}} ならば {{< katex >}}0<|(c+zR)-c|< R{{< /katex >}} となります．

そして，{{< katex >}}g(z){{< /katex >}} において {{< katex >}}z=0{{< /katex >}} であることは，{{< katex >}}f(z){{< /katex >}} において {{< katex >}}z=c+0\cdot R=c{{< /katex >}} に対応するので，{{< katex >}}z=0{{< /katex >}} は {{< katex >}}g{{< /katex >}} の真性特異点です．

これで2が示せました．
残りの 1, 3, 4 は {{< katex >}}\omega_1,\omega_2,\omega_3{{< /katex >}} がすべて有限か，そうでないかの場合に分けて示します．

まず \\(\omega_1,\omega_2,\omega_3\\) がすべて有限とします．

{{< katex display=true >}}
g(z)=\frac{f(c+zR)-\omega_1}{f(c+zR)-\omega_3}\cdot\frac{\omega_2-\omega_3}{\omega_2-\omega_1},\quad 0<|z|<1
{{< /katex >}}

とします．
{{< katex >}}g{{< /katex >}} は有理型函数になります．

仮定より {{< katex >}}f(c+zR)=\omega_3{{< /katex >}} となる {{< katex >}}0<|z|<1{{< /katex >}} は存在しないため，分母は0になりません．

{{< katex >}}c'\in E{{< /katex >}} について {{< katex >}}\gamma=(c'-c)/R{{< /katex >}} とします．{{< katex >}}E\subseteq D{{< /katex >}} より， {{< katex >}}0<|\gamma|<1{{< /katex >}} です．
このとき，

{{< katex display=true >}}
\begin{aligned}
&\frac{f(c+z R)-\omega_1}{f(c+z R)-\omega_3}\cdot\frac{\omega_2-\omega_3}{\omega_2-\omega_1}\\
&=\frac{1-\omega_1/f(c+z R)}{1-\omega_3/f(c+z R)}\cdot\frac{\omega_2-\omega_3}{\omega_2-\omega_1}\\
&\to \frac{\omega_2-\omega_3}{\omega_2-\omega_1}\quad (z\to\gamma)
\end{aligned}
{{< /katex >}}

となり，これは有限の値なので，{{< katex >}}\gamma{{< /katex >}} は {{< katex >}}g{{< /katex >}} の除去可能な特異点となります．

よって，各 {{< katex >}}c'\in E{{< /katex >}} について，{{< katex >}}\gamma=(c'-c)/R{{< /katex >}} として，{{< katex >}}g(\gamma)=(\omega_2-\omega_3)/(\omega_2-\omega_1){{< /katex >}} と定めれば，{{< katex >}}g{{< /katex >}} は {{< katex >}}\{z\mid0<|z|<1\}{{< /katex >}} で正則となります．
これで1が示せました．

{{< katex >}}0<|z|<1{{< /katex >}} ならば {{< katex >}}f(c+zR)\not=\omega_1{{< /katex >}} なので，{{< katex >}}g(z)\not=0{{< /katex >}} です．
ここで，{{< katex >}}g(\gamma)=1{{< /katex >}} となる {{< katex >}}0<|\gamma|<1{{< /katex >}} が存在するとします．
{{< katex >}}g(\gamma)=1{{< /katex >}} なので，
{{< katex display=true >}}
  (f(c+\gamma R)-\omega_3)(\omega_2-\omega_1)=(f(c+\gamma R)-\omega_1)(\omega_2-\omega_3)
{{< /katex >}}
となりますが，
{{< katex display=true >}}
  f(c+\gamma R)=\frac{\omega_2(\omega_3-\omega_1)}{\omega_3-\omega_1}=\omega_2
{{< /katex >}}
となり矛盾します．
よって，{{< katex >}}0<|z|<1{{< /katex >}} ならば {{< katex >}}g(z)\neq1{{< /katex >}} です．
これで，3, 4が示せました．

次に，{{< katex >}}\omega_3=\infty{{< /katex >}} とします．

{{< katex display=true >}}
g(z)=\frac{f(c+zR)-\omega_1}{\omega_2-\omega_1}
{{< /katex >}}

とします．
{{< katex >}}g{{< /katex >}} は有理型函数になります．

このとき，{{< katex >}}f(c+zR){{< /katex >}} は {{< katex >}}\omega_3=\infty{{< /katex >}} をとらないので，{{< katex >}}E=\emptyset{{< /katex >}} となり，{{< katex >}}0<|z|<1{{< /katex >}} において {{< katex >}}z\mapsto f(c+zR){{< /katex >}} は正則です．
よって，{{< katex >}}0<|z|<1{{< /katex >}} において {{< katex >}}g{{< /katex >}} は正則です．
これで1が示せました．

{{< katex >}}0<|z|<1{{< /katex >}} ならば {{< katex >}}f(c+zR)\not=\omega_1{{< /katex >}} なので，{{< katex >}}g(z)\not=0{{< /katex >}} です．
ここで，{{< katex >}}g(\gamma)=1{{< /katex >}} となる {{< katex >}}0<|\gamma|<1{{< /katex >}} が存在するとします．
{{< katex >}}g(\gamma)=1{{< /katex >}} なので，{{< katex >}}f(c+zR)=\omega_2{{< /katex >}} となり矛盾します．
よって，{{< katex >}}0<|z|<1{{< /katex >}} ならば {{< katex >}}g(z)\neq1{{< /katex >}} です．
これで，3, 4が示せました．

以上より，Lemma 7 が示せました．

{{% hint info %}} {{< theorem-label name="Lemma" >}} \\(c\ge0\\) とする．\\(|z|< c\\) ならば \\(|e^z|< e^c\\) である．
{{% /hint %}}

Lemma 8 を示します．

{{< katex >}}c\ge0{{< /katex >}} とし，{{< katex >}}|z|< c{{< /katex >}} とします．
{{< katex >}}z=x+iy{{< /katex >}}, {{< katex >}}x,y\in\mathbb{R}{{< /katex >}} とします．
{{< katex >}}|z|=\sqrt{x^2+y^2}{{< /katex >}} より {{< katex >}}|z|< c{{< /katex >}} なら {{< katex >}}x< c{{< /katex >}} です．
これは例えば，{{< katex >}}x\ge c{{< /katex >}} なら {{< katex >}}|z|=\sqrt{x^2+y^2}\ge\sqrt{c^2+y^2}\ge\sqrt{c^2}=c{{< /katex >}} より矛盾することから確かめられます．

すると，
{{< katex display=true >}}
\begin{aligned}
|e^z|&=|e^{x+iy}|\\
&=|e^xe^{iy}|\\
&=|e^x||e^{iy}|\\
&=e^x|e^i|^y\\
&=e^x\\
&< e^c\\
\end{aligned}
{{< /katex >}}

より成り立ちます．

{{% hint info %}} {{< theorem-label name="Lemma" >}} 函数 \\(g\\) が以下を満たすとする．
1. \\(g\\) は \\(\\{z\mid 0<|z|<1\\}\\) 上で正則である，
2. \\(g(z)\not=0\\),
3. \\(g(z)\not=1\\).

複素数 \\(c\'\\) が \\(0<|c\'|<e^{-2\pi}\\) を満たすとする．
このとき，\\(h(\zeta)=g(c\'e^{2\pi i\zeta})\\) は \\(\\{\zeta\mid|\zeta|<1\\}\\) において正則で，\\(h(\zeta)\neq0\\), \\(h(\zeta)\neq1\\) である．
{{% /hint %}}

Lemma 9 を示します．

複素数 {{< katex >}}c'{{< /katex >}} が {{< katex >}}0<|c'|< e^{-2\pi i}{{< /katex >}} を満たすとします．{{< katex >}}|\zeta|<1{{< /katex >}} とします．

すると，{{< katex >}}|2\pi i\zeta|=2\pi|\zeta|<2\pi{{< /katex >}} なので，Lemma 8 より {{< katex >}}|e^{2\pi i\zeta}|< e^{2\pi}{{< /katex >}} です．

よって，{{< katex >}}|c'e^{2\pi i\zeta}|=|c'|\cdot|e^{2\pi i\zeta}|<|c'|\cdot|e^{2\pi}|< e^{-2\pi}e^{2\pi}=1{{< /katex >}} です．また，{{< katex >}}|c'e^{2\pi i\zeta}|>0{{< /katex >}} なので，{{< katex >}}0<|c'e^{2\pi i\zeta}|<1{{< /katex >}} です．
したがって，{{< katex >}}g{{< /katex >}} は {{< katex >}}\{z\mid 0<|z|<1\}{{< /katex >}} 上で正則なので，{{< katex >}}h{{< /katex >}} は {{< katex >}}\{\zeta\mid|\zeta|<1\}{{< /katex >}} において正則で，{{< katex >}}g(z)\neq0{{< /katex >}}, {{< katex >}}g(z)\neq1{{< /katex >}} から {{< katex >}}h(\zeta)\neq0{{< /katex >}}, {{< katex >}}h(\zeta)\neq1{{< /katex >}} とわかります．

以上より，Lemma 9 が成り立ちます．

さて，ここから Picard の定理を証明します．
Picard の定理を再掲すると以下のとおりです．

{{% hint info %}}
**Theorem 1** (Picard の定理 [[1]](#cite:1)). \\(f(z)\\) は \\(0<|z-c|\<R\\) で有理型で，\\(c\\) は \\(f(z)\\) の真性特異点であるとする．しかるときは

\\[ 0<|z-c|\<R\quad\text{では}\quad f(z)\neq\omega\\]

であるような \\(\omega\\) は，もしあるにしても，その数は2個を超えることはない．
{{% /hint %}}

Theorem 1 を示します．

{{< katex >}}R>0{{< /katex >}} とします．
仮に，{{< katex >}}\omega{{< /katex >}} の3つの相異なる値 {{< katex >}}\omega_1,\omega_2,\omega_3{{< /katex >}} について

{{< katex display=true >}}
  0<|z-c|< R\quad\text{では}\quad f(z)\neq\omega
{{< /katex >}}

であるとします．

{{< katex >}}\omega_1,\omega_2,\omega_3{{< /katex >}} がすべて有限であれば，

{{< katex display=true >}}
  g(z)=\frac{f(c+zR)-\omega_1}{f(c+zR)-\omega_3}\cdot\frac{\omega_2-\omega_3}{\omega_2-\omega_1},\quad 0<|z|<1
{{< /katex >}}

として，そうでない場合は，一般性を失わず {{< katex >}}\omega_3=\infty{{< /katex >}} として，

{{< katex display=true >}}
  g(z)=\frac{f(c+zR)-\omega_1}{\omega_2-\omega_1},\quad 0<|z|<1
{{< /katex >}}

とします．このとき，Lemma 7 より，{{< katex >}}g{{< /katex >}} は {{< katex >}}\{z\mid 0<|z|<1\}{{< /katex >}} 上で正則で，{{< katex >}}g(z)\neq0{{< /katex >}}, {{< katex >}}g(z)\neq1{{< /katex >}} で，{{< katex >}}z=0{{< /katex >}} は {{< katex >}}g{{< /katex >}} の真性特異点になります．

よって，Lemma 5 により，
{{< katex display=true >}}
  c_\nu\neq0,\quad c_\nu\to0,\quad g(c_\nu)=\gamma
{{< /katex >}}
であるような点列 {{< katex >}}\{c_\nu\}{{< /katex >}} と複素数 {{< katex >}}\gamma{{< /katex >}} が存在します．

したがって，必要ならばこの点列の部分列をとることで，一般性を失わず，

{{< katex display=true >}}
  e^{-2\pi}>|c_1|>|c_2|>\dots,\quad c_\nu\to0,\quad g(c_\nu)=\gamma
{{< /katex >}}

とすることができます．

各 {{< katex >}}\nu{{< /katex >}} について，{{< katex >}}g_\nu(\zeta)=g(c_\nu e^{2\pi i\zeta}){{< /katex >}} とします．
すると，Lemma 9 より，{{< katex >}}g_\nu{{< /katex >}} は {{< katex >}}\{\zeta\mid |\zeta|<1\}{{< /katex >}} において正則で，{{< katex >}}g_\nu(\zeta)\neq0{{< /katex >}}, {{< katex >}}g_\nu(\zeta)\neq1{{< /katex >}} となります．
すると，Schottky の定理 (Theorem 6) より，{{< katex >}}|\zeta|\le(1/2)\cdot1{{< /katex >}} に対して，定数 {{< katex >}}S(\gamma,1/2){{< /katex >}} が存在し，{{< katex >}}|g_\nu(\zeta)|< S(\gamma,1/2){{< /katex >}} が成り立ちます．

ここで，{{< katex >}}\zeta\in\mathbb{R}{{< /katex >}} ならば {{< katex >}}|c_\nu e^{2\pi i\zeta}|=|c_\nu|{{< /katex >}} なので，{{< katex >}}\zeta\in\mathbb{R}\cap\{\zeta\mid |\zeta|\le1/2\}{{< /katex >}} においては，{{< katex >}}z=c_\nu e^{2\pi i\zeta}{{< /katex >}} とおくと，{{< katex >}}|z|=|c_\nu|{{< /katex >}} であって，{{< katex >}}g(z)=g(c_\nu e^{2\pi i\zeta})=g_\nu(\zeta){{< /katex >}} より {{< katex >}}|g(z)|\le S(\gamma,1/2){{< /katex >}} となります．

{{< katex >}}R_\nu=|c_\nu|{{< /katex >}}, {{< katex >}}M=S(\gamma,1/2){{< /katex >}} とおくと，{{< katex >}}R_1>R_2>\dots{{< /katex >}}, {{< katex >}}R_\nu\to0{{< /katex >}} であり，{{< katex >}}\{z\mid |z|=R_\nu\}{{< /katex >}} の上で {{< katex >}}|g(z)|< M{{< /katex >}} なので，Lemma 4 より，{{< katex >}}z=0{{< /katex >}} は {{< katex >}}g{{< /katex >}} の除去可能な特異点となります．

これは {{< katex >}}z=0{{< /katex >}} が {{< katex >}}g{{< /katex >}} の真性特異点であることに反するので，背理法によって主張が示せました．

なお，Corollay 2 は，{{< katex >}}R{{< /katex >}} を {{< katex >}}\delta{{< /katex >}} に置き換えても証明が成り立つことからわかり，Corollary 3 は，除外値が3個存在し，{{< katex >}}\omega_1,\omega_2,\omega_3{{< /katex >}} であるとすると，{{< katex >}}\delta=\min\{z\mid f(z)\in\{\omega_1,\omega_2,\omega_3\}\}{{< /katex >}} とおくと，{{< katex >}}0<|z-c|<\delta{{< /katex >}} では {{< katex >}}f(z)\notin\{\omega_1,\omega_2,\omega_3\}{{< /katex >}} となり，Corollary 2 に反することから示せます．

また，{{< katex >}}f{{< /katex >}} が {{< katex >}}0<|z-c|< R{{< /katex >}} で正則な場合は，{{< katex >}}\infty{{< /katex >}} をとらないことがわかっているので，Theorem 1 や Collorary 2, 3 にある {{< katex >}}\omega{{< /katex >}} は，ほかにあっても1個ということになります．

## まとめ

本ページでは，Picard の定理について概説しました．
はじめに，Picard の定理を説明し，定理に関連する用語や概念を簡単にまとめ，その後，いくつかの事実を認めて証明を述べました．

Picard の定理は，真性特異点の強烈な特徴を述べた，非常に面白い定理と思います．

証明や周辺の議論に関する詳細は [[1]](#cite:1) をご参照ください．

## 参考文献

{{< anchor "cite:1" >}}[1] 吉田洋一，函数論 第2版，岩波全書，東京，1965.
