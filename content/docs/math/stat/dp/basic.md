---
title: "差分プライバシの基本"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 差分プライバシの基本

## 概要

本ページでは，差分プライバシの基本事項についてまとめます．

## 準備

### 記号定義

{{< katex >}}\Omega{{< /katex >}} を集合，{{< katex >}}\mathfrak{F}\subseteq 2^\Omega{{< /katex >}}, {{< katex >}}P:\mathfrak{F}\to\mathbb{R}{{< /katex >}} とし，{{< katex >}}(\Omega,\mathfrak{F},P){{< /katex >}} を確率空間とします．

{{< katex >}}X:(\Omega,\mathfrak{F})\to(\mathbb{R}^{n\times d},\mathfrak{B}(\mathbb{R}^{n\times d})){{< /katex >}} を確率変数としたとき，{{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{n\times d}){{< /katex >}} について {{< katex >}}[X\in S]{{< /katex >}} を
{{< katex display >}}
  [X\in S]=\{\omega\in\Omega\mid X(\omega)\in S\}
{{< /katex >}}
とし，{{< katex >}}P([X\in S]){{< /katex >}} を {{< katex >}}P(X\in S){{< /katex >}} と略記します．

ただし，{{< katex >}}\mathfrak{B}(\mathbb{R}^{n\times d}){{< /katex >}} とは，{{< katex >}}\mathbb{R}^{n\times d}{{< /katex >}} の開集合全体 {{< katex >}}\mathcal{O}(\mathbb{R}^{n\times d}){{< /katex >}} について，{{< katex >}}\mathcal{O}(\mathbb{R}^{n\times d}){{< /katex >}} を含む最小の完全加法族を表します．

### \\(\epsilon\\)-indistinguishable

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(X:(\Omega,\mathfrak{F})\to(\mathbb{R}^{n\times d},\mathfrak{B}(\mathbb{R}^{n\times d}))\\), \\(Y:(\Omega,\mathfrak{F})\to(\mathbb{R}^{n\times d},\mathfrak{B}(\mathbb{R}^{n\times d}))\\) を確率変数とする．
任意の \\(S\in\\mathfrak{B}(\mathbb{R}^{n\times d})\\) について \\(P(X\in S)\le e^\epsilon P(Y\in S)\\) かつ \\(P(Y\in S)\le e^\epsilon P(X\in S)\\) ならば，\\(X\\) と \\(Y\\) は **\\(\epsilon\\)-indistinguishable** であるといい，\\(X\approx_\epsilon Y\\) と表す．
{{< /hint >}}

{{< katex >}}P(Y\in S){{< /katex >}} ならば，
{{< katex display >}}e^{-\epsilon}\le\frac{P(X\in S)}{P(Y\in S)}\le e^{\epsilon}{{< /katex >}}
なので，{{< katex >}}\epsilon{{< /katex >}} は {{< katex >}}X,Y{{< /katex >}} の離れ具合を表しているといえます．

特に，{{< katex >}}\epsilon=0{{< /katex >}} ならば，任意の {{< katex >}}S\in\mathfrak{B}(\mathbb{R}^{n\times d}){{< /katex >}} について {{< katex >}}P(X\in S)=P(Y\in S){{< /katex >}} なので，{{< katex >}}X=Y{{< /katex >}} となります．

{{< katex >}}\epsilon>0{{< /katex >}} ならば，{{< katex >}}X=Y{{< /katex >}} ではないまでも，{{< katex >}}P(X\in S){{< /katex >}} と {{< katex >}}P(Y\in S){{< /katex >}} の離れ具合が {{< katex >}}\epsilon{{< /katex >}} によって制限され，特に {{< katex >}}\epsilon{{< /katex >}} が小さいほど，その制限は強くなります．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(\mathscr{D}\subseteq\bigcup_{n=1}^\infty\mathbb{R}^{n\times d}\\), \\(\mathscr{D}\'\subseteq\mathbb{R}^{n\'\times d}\\) とする．\\(\mathscr{M}:\mathscr{D}\times\Omega\to\mathscr{D}\'\\) とする．任意の \\(D\in\mathscr{D}\\) について，\\(\mathscr{M}(D):\Omega\to\mathscr{D}\'\\) が確率変数になるとき，\\(\mathscr{M}\\) を **メカニズム** という．
{{< /hint >}}

メカニズム {{< katex >}}\mathscr{M}{{< /katex >}} は，2次元配列状のデータ {{< katex >}}D{{< /katex >}} を変換するロジックとして導入したいものですが，確率的操作を含むため，単なる関数でなく，上記のような定義としています．

{{< hint info >}}
{{< theorem-label name="Definition" >}} \\(R_{\mathrm{adj}}\subseteq\mathscr{D}^2\\) を
1. \\((D_1,D_1)\in R_{\mathrm{adj}}\\)
1. \\((D_1,D_2)\in R_{\mathrm{adj}}\\implies (D_2,D_1)\in R_{\mathrm{adj}}\\)

を満たす \\(\mathscr{D}\\) 上の関係とする．
{{< /hint >}}

実用上は意味付けが重要ですが，ここでは単に反射律と対称律だけを課しておきます．
"adj" は "adjacent" の略で，隣接したデータであるという関係を表しています．

{{< hint info >}}
{{< theorem-label name="Definition" >}} 任意の \\((D_1,D_2)\in R_{\mathrm{adj}}\\) について，\\(\mathscr{M}(D_1)\approx_\epsilon\mathscr{M}(D_2)\\) であるとき，メカニズム \\(\mathscr{M}\\) は **\\(\epsilon\\)-differential privacy を満たす** という．
{{< /hint >}}

\\(\epsilon\\) が小さいとき，\\(\mathscr{M}(D_1)\\) と \\(\mathscr{M}(D_2)\\) が確率変数としておおよそ似たようなものだということは，公開される情報が \\(D_1\\) や \\(D_2\\) でなく，\\(\mathscr{M}(D_1)\\) や \\(\mathscr{M}(D_2)\\) の実現値であれば，公開される情報から \\(D_1\\) と \\(D_2\\) の区別が難しいということを主張しています．

たとえば，\\(D_1\\) と \\(D_2\\) の違いが，特定の個人に関するレコードの有無だけであれば，メカニズムの出力結果から，元データにその特定の個人が含まれているかどうかが，類推困難であるということになります．

したがって，データそのものを公開するのではなく，\\(\epsilon\\)-differential privacy を満たすメカニズムでそのデータを変換してから情報を公開することで，そこに含まれる個人の情報が保護されることが期待されるため，\\(\epsilon\\)-differentai privacy は一種の安全性指標とみることができます．

この安全性指標は，計算量に基づくものではなく，統計的性質だけから主張されている点も特徴的です．

ところで，{{< katex >}}\epsilon{{< /katex >}}-differential privacy について，以下の性質が成り立ちます．

{{< hint info >}}
{{< theorem-label name="Proposition" >}} メカニズム \\(\mathscr{M}\\) が \\(\epsilon\\)-differential privacy を満たすならば，任意の \\((D_1,D_2)\in R_{\mathrm{adj}}\\) について，
\\[ 
  P(\mathscr{M}(D_1)\in S)\le e^\epsilon P(\mathscr{M}(D_2)\in S)
\\]
を満たす．
{{< /hint >}}

これは，{{< katex >}}R_{\mathrm{adj}}{{< /katex >}} の対称律から明らかです．

これらの準備のもと，近似的な differential privacy の定義が以下のように述べられます．

{{< hint info >}}
{{< theorem-label name="Definition" >}} 任意の \\((D_1,D_2)\in R_{\mathrm{adj}}\\) と \\(S\in\mathscr{B}(\mathbb{R}^{n\times d})\\)について，
\\[ 
  P(\mathscr{M}(D_1)\in S)\le e^\epsilon P(\mathscr{M}(D_2)\in S)+\delta
\\]
であるとき，メカニズム \\(\mathscr{M}\\) は **\\((\epsilon,\delta)\\)-differential privacy を満たす** という．
{{< /hint >}}

この定義は，メカニズム \\(\mathscr{M}\\) が {{< katex >}}1-\delta{{< /katex >}} の確率で \\(\epsilon\\)-differential privacy を満たすことと等価であることが知られています．
