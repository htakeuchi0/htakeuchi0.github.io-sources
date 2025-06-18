---
title: "p進整数環と射影極限"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# {{< katex >}}p{{< /katex >}}進整数環と射影極限

## 概要

ホモロジー代数の教科書として，志甫 淳の『層とホモロジー代数』[[1]](#cite:1) があります．
[[1]](#cite:1) は，基本的な集合論的知識以外の予備知識をほとんど仮定せずに，層やホモロジー代数が説明されている教科書だそうです [[1, まえがき]](#cite:1)．

さて，[[1, 例1.55, p.41]](#cite:1) では，**射影極限** の例として **{{< katex >}}p{{< /katex >}}進整数環** が紹介されています．
そこでは {{< katex >}}p{{< /katex >}}進整数環 {{< katex >}}\mathbb{Z}_p{{< /katex >}} が整域であることを示すため，{{< katex >}}a=(a_n)_n,b=(b_n)_n\in\mathbb{Z}_p{{< /katex >}} について {{< katex >}}a,b\neq0{{< /katex >}} ならば {{< katex >}}a_n,b_n\neq0{{< /katex >}} なる {{< katex >}}n{{< /katex >}} がとれると書かれています．
しかし，その詳細までは触れられていませんでした．
本ページの作者は，射影極限にも {{< katex >}}p{{< /katex >}}進整数環にも不慣れなので[^1]，そこで述べられた主張をひとつひとつ確認しながら読み進めたいと思います．
本ページはその軌跡を残したものです．
[^1]: そもそも代数に不慣れです．

したがって本ページは，表題の内容に関する解説書ではなく，正確な理解を求めるには不向きです．
正確な理解を求める場合は，原典 [[1]](#cite:1) またはその他資料をご確認ください．

## 準備：[1] の議論の引用

まず， **帰納極限** の定義を述べます．
すべての定義は書ききれないので，ここでは [[1, 定義1.49, pp.36, 37]](#cite:1) だけを引用します．
そこに出てくる記号だけを簡単に補足すると，{{< katex >}}I{{< /katex >}} は有向グラフの頂点の集合，{{< katex >}}J(i,i'){{< /katex >}} は頂点 {{< katex >}}i{{< /katex >}} から頂点 {{< katex >}}i'{{< /katex >}} に向かう辺の集合，{{< katex >}}\mathcal{I}^{\mathrm{op}}{{< /katex >}} は {{< katex >}}\mathcal{I}{{< /katex >}} の辺の向きを反対にしたもの，{{< katex >}}R{{< /katex >}} は環，{{< katex >}}M_i{{< /katex >}} は左 {{< katex >}}R{{< /katex >}} 加群，{{< katex >}}f_{\varphi}{{< /katex >}} は準同型写像，{{< katex >}}\prod{{< /katex >}} は左 {{< katex >}}R{{< /katex >}} 加群としての直積，{{< katex >}}\varphi\in J(i,i'){{< /katex >}} に対して {{< katex >}}\mathrm{s}(\varphi)=i,\mathrm{t}(\varphi)=i'{{< /katex >}}, {{< katex >}}\mathrm{Ker}(f){{< /katex >}} は準同型写像 {{< katex >}}f{{< /katex >}} の核です．

{{% hint info %}}{{< theorem-label name="Definition" comment="帰納極限 [[1, 定義1.49, pp.36, 37]](#cite:1)" >}}{{< katex >}}\mathcal{I}=(I,J(i,i'))_{i,i'\in I}{{< /katex >}} を圏とし，
{{< katex display=true >}}
\begin{align}
((M_i)_{i\in I},(f_{\varphi}:M_{i'}\to M_i)_{i,i'\in I,\varphi\in J(i,i')})
\end{align}
{{< /katex >}}
を \\(\mathcal{I}^{\mathrm{op}}\\) 上の左 \\(R\\) 加群の図式とする．
そして，
\\[
X=\prod_{i\in I}M_i,\quad Y=\prod_{\varphi\in\bigsqcup_{i,i'\in I}J(i,i')}M_{\mathrm{s}(\varphi)}
\\]
とおき，\\(f_\mathrm{s}\\), \\(f_\mathrm{t}\\) を
\\[
  f_{\mathrm{s}}((x_i)\_i)=(x_{\mathrm{s}(\varphi)})\_{\varphi},\quad f_{\mathrm{t}}((x_i)\_i)=(f_{\varphi}(x_{\mathrm{t}(\varphi)}))\_{\varphi}
\\]
とおく．
このとき，図式 (1) の射影極限 \\(\varprojlim_{i\in I}M_i\\) を
\\[
  \varprojlim_{i\in I}M_i=\mathrm{Ker}(f_{\mathrm{t}}-f_{\mathrm{s}})
\\]
と定義する．
{{% /hint %}}

続けて [[1, 例1.55, p.41]](#cite:1) の内容を引用します．

空でない順序集合 {{< katex >}}(I,\le){{< /katex >}} に対して，{{< katex >}}J(i,i'){{< /katex >}} ({{< katex >}}i,i'\in I{{< /katex >}}) を，{{< katex >}}i\le i'{{< /katex >}} のとき {{< katex >}}J(i,i')=\{*_{i,i'}\}{{< /katex >}}（一点集合），{{< katex >}}i\le i'{{< /katex >}} でないとき {{< katex >}}J(i,i')=\emptyset{{< /katex >}} とし，合成則
{{< katex display=true >}}
J(i',i'')\times J(i,i')\ni(*_{i',i''},*_{i,i'})\mapsto *_{i,i''}\in J(i,i'')
{{< /katex >}}
を定めれば {{< katex >}}\mathcal{I}=(I,J(i,i'))_{i,i'\in I}{{< /katex >}} は圏となります．
これを {{< katex >}}(I,\le){{< /katex >}} に対応する圏といいます．
また，{{< katex >}}\mathcal{I}^{\mathrm{op}}{{< /katex >}} 上の左 {{< katex >}}R{{< /katex >}} 加群の図式のことを {{< katex >}}(I,\le)^{\mathrm{op}}{{< /katex >}} 上の左 {{< katex >}}R{{< /katex >}} 加群と呼びます．
つまり，{{< katex >}}(I,\le)^{\mathrm{op}}{{< /katex >}} 上の左 {{< katex >}}R{{< /katex >}} 加群の図式とは，
* {{< katex >}}i\in\mathbb{N}=\{0,1,\dots\}{{< /katex >}} について {{< katex >}}M_i{{< /katex >}} は左 {{< katex >}}R{{< /katex >}} 加群
* {{< katex >}} i\le i'{{< /katex >}} に対して {{< katex >}}f_{i,i'}:M_{i'}\to M_i{{< /katex >}} は準同型写像

であって，
* {{< katex >}}i\in\mathbb{N}=\{0,1,\dots\}{{< /katex >}} について {{< katex >}}f_{i,i}=\mathrm{id}_{M_i}{{< /katex >}}
* {{< katex >}}i\le i'\le i''{{< /katex >}} に対して {{< katex >}}f_{i,i'}\circ f_{i',i''}=f_{i,i''}{{< /katex >}}

を満たすものとなります．

## 射影極限と\\(p\\) 進整数環

冒頭に述べたとおり，[[1, 例1.55, p.41]](#cite:1) では基本的なことまで遡って書かれているわけではないので，復習も兼ねてその例の主張に到達するまでの主要な議論を書き下します．

### 左 \\(\mathbb{Z}\\) 加群 \\(\mathbb{Z}/p^n\mathbb{Z}\\)

まず，{{< katex >}}\mathbb{Z}{{< /katex >}} を有理整数環とします．
{{< katex >}}\mathbb{Z}{{< /katex >}} は環なので自然に左 {{< katex >}}\mathbb{Z}{{< /katex >}} 加群とみなせます [[1, 例1.17 (2), p.8]](#cite:1)．

{{< katex >}}n\in\mathbb{N}=\{0,1,\dots\}{{< /katex >}} として，{{< katex >}}p\in\mathbb{N}{{< /katex >}} を素数とします．
{{< katex >}}p^n\mathbb{Z}{{< /katex >}} を {{< katex >}}p^n\mathbb{Z}=\{p^nk\mid k\in\mathbb{Z}\}{{< /katex >}} で定めます．
すると，{{< katex >}}p^n\mathbb{Z}{{< /katex >}} は {{< katex >}}\mathbb{Z}{{< /katex >}} の空でない部分集合になります．
ここで {{< katex >}}p^n\mathbb{Z}{{< /katex >}} が {{< katex >}}\mathbb{Z}{{< /katex >}} の部分加群であることを確認します．

{{< katex >}}x,y\in p^n\mathbb{Z}{{< /katex >}} なら {{< katex >}}x=x'p^n{{< /katex >}}, {{< katex >}}y=y'p^n{{< /katex >}} なる {{< katex >}}x',y'\in\mathbb{Z}{{< /katex >}} が存在します．
{{< katex >}}x+y=(x'+y')p^n{{< /katex >}} となりますが {{< katex >}}x'+y'\in\mathbb{Z}{{< /katex >}} なので，{{< katex >}}x+y\in p^n\mathbb{Z}{{< /katex >}} となります．
次に，{{< katex >}}x\in p^n\mathbb{Z}{{< /katex >}} なら {{< katex >}}x=x'p^n{{< /katex >}} なる {{< katex >}}x'\in\mathbb{Z}{{< /katex >}} が存在しますが，{{< katex >}}-x'\in\mathbb{Z}{{< /katex >}} なので，{{< katex >}}y=(-x')p^n{{< /katex >}} も {{< katex >}}p^n\mathbb{Z}{{< /katex >}} に属します．
ここで，{{< katex >}}x+y=(x'+(-x'))p^n=0{{< /katex >}}, {{< katex >}}y+x=((-x')+x')p^n=0{{< /katex >}} なので，{{< katex >}}-x=y\in p^n\mathbb{Z}{{< /katex >}} となります．
さらに，{{< katex >}}x\in p^n\mathbb{Z}{{< /katex >}} に対し，{{< katex >}}x=x'p^n{{< /katex >}} なる {{< katex >}}x'\in\mathbb{Z}{{< /katex >}} が存在するので，任意の {{< katex >}}a\in\mathbb{Z}{{< /katex >}} について {{< katex >}}ax=(ax')p^n{{< /katex >}} と表せます．
{{< katex >}}ax'\in\mathbb{Z}{{< /katex >}} なので {{< katex >}}ax\in p^n\mathbb{Z}{{< /katex >}} となります．
よって，[[1, p.8]](#cite:1) の議論より，{{< katex >}}p^n\mathbb{Z}{{< /katex >}} は {{< katex >}}\mathbb{Z}{{< /katex >}} の部分加群です．

ここで {{< katex >}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} を {{< katex >}}\mathbb{Z}/p^n\mathbb{Z}=\{x+p^n\mathbb{Z}\mid x\in\mathbb{Z}\}{{< /katex >}} で定めます．
ただし，{{< katex >}}x+p^n\mathbb{Z}=\{x+y\mid y\in p^n\mathbb{Z}\}{{< /katex >}} です．
いま，{{< katex >}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} における和と {{< katex >}}\mathbb{Z}{{< /katex >}} の元による左乗法を
* {{< katex >}}x+p^n\mathbb{Z},y+p^n\mathbb{Z}\in \mathbb{Z}/p^n\mathbb{Z}{{< /katex >}}, {{< katex >}}x,y\in\mathbb{Z}{{< /katex >}} に対して {{< katex >}}(x+p^n\mathbb{Z})+(y+p^n\mathbb{Z})=(x+y)+p^n\mathbb{Z}{{< /katex >}} 
* {{< katex >}}a\in\mathbb{Z}, x+p^n\mathbb{Z}\in \mathbb{Z}/p^n\mathbb{Z}{{< /katex >}}, {{< katex >}}x\in\mathbb{Z}{{< /katex >}} に対して {{< katex >}}a(x+p^n\mathbb{Z})=ax+p^n\mathbb{Z}{{< /katex >}} 

と定めることを考えます．
一般に {{< katex >}}x+p^n\mathbb{Z}=x'+p^n\mathbb{Z},x\neq x'{{< /katex >}} なる {{< katex >}}x,x'\in\mathbb{Z}{{< /katex >}} が存在するので，{{< katex >}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} の要素の “表現” によらずに演算結果が定まること（well-defined であること）を確認する必要があります．
ここでは省略しますが，[[1, 補題1.18, p.9]](#cite:1) よりこれは well-defined であることがわかります．

以上より，{{< katex >}}n\in\mathbb{N}{{< /katex >}} について {{< katex >}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} が左 {{< katex >}}\mathbb{Z}{{< /katex >}} 加群となることがわかりました．

### 左 \\(\mathbb{Z}\\) 加群 \\(\mathbb{Z}/p^n\mathbb{Z}\\) 上の準同型写像 \\(f_{nm}\\)

{{< katex >}}n,m\in\mathbb{N}{{< /katex >}}, {{< katex >}}n\le m{{< /katex >}} に対して，
{{< katex display=true >}}
  f_{nm}:\mathbb{Z}/p^m\mathbb{Z}\to\mathbb{Z}/p^n\mathbb{Z}
{{< /katex >}}
を，{{< katex >}}x+p^m\mathbb{Z}\in \mathbb{Z}/p^m\mathbb{Z}{{< /katex >}}, {{< katex >}}x\in\mathbb{Z}{{< /katex >}} に対して
{{< katex display=true >}}
\begin{align}
  f_{nm}(x+p^m\mathbb{Z})=x+p^n\mathbb{Z}
\end{align}
{{< /katex >}}
で定めることを考えます．
これも前節と同様に，well-defined であることを確認する必要があります．

いま，{{< katex >}}x+p^m\mathbb{Z}=x'+p^m\mathbb{Z}\in\mathbb{Z}/p^m\mathbb{Z}{{< /katex >}} であるとします．
このとき {{< katex >}}x'=x+kp^m{{< /katex >}} なる {{< katex >}}k\in\mathbb{Z}{{< /katex >}} が存在します．
すると，
{{< katex display=true >}}
\begin{aligned}
  x'+p^n\mathbb{Z}&=(x+kp^m)+p^n\mathbb{Z}\\
  &=x+(kp^{m-n})p^n+p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
と書けますが，{{< katex >}}m\ge n{{< /katex >}} なので {{< katex >}}m-n\ge0{{< /katex >}} となり {{< katex >}}kp^{m-n}\in\mathbb{Z}{{< /katex >}} だから {{< katex >}}(kp^{m-n})p^n\in p^n\mathbb{Z}{{< /katex >}} となります．
よって，
{{< katex display=true >}}
\begin{aligned}
  x'+p^n\mathbb{Z}&=x+(kp^{m-n})p^n+p^n\mathbb{Z}\\
  &=x+p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
となります．
したがって，{{< katex >}}x+p^m\mathbb{Z}=x'+p^m\mathbb{Z}\in\mathbb{Z}/p^m\mathbb{Z}{{< /katex >}} ならば {{< katex >}}f_{nm}(x'+p^m\mathbb{Z})=x'+p^n\mathbb{Z}=x+p^n\mathbb{Z}=f_{nm}(x+p^m\mathbb{Z}){{< /katex >}} となるので，{{< katex >}}f_{nm}{{< /katex >}} の定義は well-defined です．

次に，{{< katex >}}f_{nm}{{< /katex >}} が準同型写像であることを確認します．

{{< katex >}}x,y\in\mathbb{Z}/p^m\mathbb{Z}{{< /katex >}} とします．
{{< katex >}}f_{nm}(x+y)=f_{nm}(x)+f_{nm}(y){{< /katex >}} であることを確認します．
{{< katex >}}x=x'+p^m\mathbb{Z},y=y'+p^m\mathbb{Z}{{< /katex >}} なる {{< katex >}}x',y'\in\mathbb{Z}{{< /katex >}} が存在します．
すると，
{{< katex display=true >}}
\begin{aligned}
  f_{nm}(x+y)&=f_{nm}((x'+p^m\mathbb{Z})+(y'+p^m\mathbb{Z}))\\
  &=f_{nm}((x'+y')+p^m\mathbb{Z})\\
  &=(x'+y')+p^n\mathbb{Z}\\
  &=(x'+p^n\mathbb{Z})+(y'+p^n\mathbb{Z})\\
  &=f_{nm}(x'+p^m\mathbb{Z})+f_{nm}(y'+p^m\mathbb{Z})\\
  &=f_{nm}(x)+f_{nm}(y)
\end{aligned}
{{< /katex >}}
となります．

次に，{{< katex >}}a\in\mathbb{Z}{{< /katex >}}, {{< katex >}}x\in\mathbb{Z}/p^m\mathbb{Z}{{< /katex >}} とします．
{{< katex >}}f_{nm}(ax)=af_{nm}(x){{< /katex >}} であることを確認します．
{{< katex >}}x=x'+p^m\mathbb{Z}{{< /katex >}} なる {{< katex >}}x'\in\mathbb{Z}{{< /katex >}} が存在します．
すると，
{{< katex display=true >}}
\begin{aligned}
  f_{nm}(ax)&=f_{nm}(a(x'+p^m\mathbb{Z}))\\
  &=f_{nm}(ax'+p^m\mathbb{Z})\\
  &=ax'+p^n\mathbb{Z}\\
  &=a(x'+p^n\mathbb{Z})\\
  &=af_{nm}(x'+p^m\mathbb{Z})\\
  &=af_{nm}(x)
\end{aligned}
{{< /katex >}}
となります．

以上より，{{< katex >}}f_{nm}{{< /katex >}} は準同型写像です．

### 準同型写像 \\(f_{nm}\\) の性質

以降の議論のために {{< katex >}}f_{nm}{{< /katex >}} の性質をまとめておきます．
{{< katex >}}n\in\mathbb{N}=\{0,1,\dots\}{{< /katex >}} とします．
{{< katex >}}x+p^n\mathbb{Z}\in\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}}, {{< katex >}}x\in\mathbb{Z}{{< /katex >}} とします．
このとき，{{< katex >}}f_{nn}(x+p^n\mathbb{Z})=x+p^n\mathbb{Z}{{< /katex >}} となるので，{{< katex >}}f_{nn}=\mathrm{id}_{\mathbb{Z}/p^n\mathbb{Z}}{{< /katex >}} です．

次に {{< katex >}}n,n',n''\in\mathbb{N}{{< /katex >}} が {{< katex >}}n\le n'\le n''{{< /katex >}} であるとします．
{{< katex >}}x''+p^{n''}\mathbb{Z}\in\mathbb{Z}/p^{n''}\mathbb{Z}{{< /katex >}}, {{< katex >}}x''\in\mathbb{Z}{{< /katex >}} とします．
このとき，
{{< katex display=true >}}
\begin{aligned}
(f_{nn'}\circ f_{n'n''})(x''+p^{n''}\mathbb{Z})&=f_{nn'}(f_{n'n''}(x''+p^{n''}\mathbb{Z}))\\
&=f_{nn'}(x''+p^{n'}\mathbb{Z})\\
&=x''+p^n\mathbb{Z}\\
&=f_{nn''}(x''+p^{n''}\mathbb{Z})
\end{aligned}
{{< /katex >}}
なので，{{< katex >}}f_{nn'}\circ f_{n'n''}=f_{nn''}{{< /katex >}} が成り立ちます．

### \\(p\\) 進整数環

前節の結果から，{{< katex >}}n\in\mathbb{N}{{< /katex >}} について {{< katex >}}M_n=\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} として，{{< katex >}}n,m\in\mathbb{N}{{< /katex >}}, {{< katex >}}n\le m{{< /katex >}} に対して前節の準同型写像 {{< katex >}}f_{nm}:M_m\to M_n{{< /katex >}} を使うと
{{< katex display=true >}}
  ((M_n)_{n\in\mathbb{N}},(f_{nm})_{n,m\in\mathbb{N},n\le m})
{{< /katex >}}
は {{< katex >}}(\mathbb{N},\le)^{\mathrm{op}}{{< /katex >}} 上の {{< katex >}}\mathbb{Z}{{< /katex >}} 加群の図式になります．

すると，この図式の射影極限 {{< katex >}}\varprojlim_{n\in\mathbb{N}}M_n{{< /katex >}} が定義できて，これを {{< katex >}}\mathbb{Z}_p{{< /katex >}} と表すことにします．
つまり，
{{< katex display=true >}}
  \mathbb{Z}_p=\varprojlim_{n\in\mathbb{N}}M_n=\varprojlim_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}
{{< /katex >}}
です．

さて，[[1, 例1.55, p.41]](#cite:1) では特に言及はありませんが，射影極限の定義 (Def. 1) から，この {{< katex >}}\mathbb{Z}_p{{< /katex >}} の具体的な構造を考えてみます．
Def. 1において，
{{< katex display=true >}}
\begin{aligned}
  &X=\prod_{n\in\mathbb{N}}M_n=\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z},\\
  &Y=\prod_{\varphi\in\bigsqcup_{n,m}J(n,m)}M_{\mathrm{s}(\varphi)}=\prod_{\begin{subarray}{c}n\le m,\\n,m\in\mathbb{N}\end{subarray}}M_n=\prod_{\begin{subarray}{c}n\le m,\\n,m\in\mathbb{N}\end{subarray}}\mathbb{Z}/p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
となります．
よって，
{{< katex display=true >}}
\begin{aligned}
  &f_{\mathrm{s}}((x_n)_n)=(x_{\mathrm{s}(\varphi)})_{\varphi}=(x_n)_{\begin{subarray}{c}n\le m\\n,m\in\mathbb{N}\end{subarray}},\\
  &f_{\mathrm{t}}((x_n)_n)=(f_{\varphi}(x_{\mathrm{t}(\varphi)}))_{\varphi}=(f_{nm}(x_m))_{\begin{subarray}{c}n\le m\\n,m\in\mathbb{N}\end{subarray}}
\end{aligned}
{{< /katex >}}
となります．
以上より，
{{< katex display=true >}}
\begin{aligned}
&\varprojlim_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}\\
&=\mathrm{Ker}(f_{\mathrm{t}}-f_{\mathrm{s}})\\
&=\left\{(x_n)_n\in \prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}\,\bigg|\,\forall n,m\in\mathbb{N}\,(n\le m\implies x_n=f_{nm}(x_m))\right\}
\end{aligned}
{{< /katex >}}
となります．

さらに，{{< katex >}}n\in\mathbb{N}{{< /katex >}} について {{< katex >}}x_n=x'_n+p^n\mathbb{Z}, x'_n\in\mathbb{Z}{{< /katex >}} と表しておくと，{{< katex >}}x_n=f_{nm}(x_m){{< /katex >}} の関係は {{< katex >}}x'_n+p^n\mathbb{Z}=x'_m+p^n\mathbb{Z}{{< /katex >}} と表せるので，
{{< katex display=true >}}
\begin{aligned}
&\varprojlim_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}\\
&=\mathrm{Ker}(f_{\mathrm{t}}-f_{\mathrm{s}})\\
&=\left\{(x'_n+p^n\mathbb{Z})_n\in \prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}\,\bigg|\,\forall n,m\in\mathbb{N}\,(n\le m\implies x'_n+p^n\mathbb{Z}=x'_m+p^n\mathbb{Z})\right\}\\
&=\left\{(x'_n+p^n\mathbb{Z})_n\in \prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}\,\bigg|\,\forall n,m\in\mathbb{N}\,(n\le m\implies x'_m-x'_n\in p^n\mathbb{Z})\right\}
\end{aligned}
{{< /katex >}}
と書けることがわかります．

さて，[[1, 例1.55, p.41]](#cite:1) では，{{< katex >}}(a_n)_n,(b_n)_n\in\mathbb{Z}_p{{< /katex >}} の和と積を {{< katex >}}(a_n)_n+(b_n)_n=(a_n+b_n)_n{{< /katex >}}, {{< katex >}}(a_n)_n(b_n)_n=(a_nb_n)_n{{< /katex >}} と定めることで，{{< katex >}}\mathbb{Z}_p{{< /katex >}} は可換環となると説明されています ．
これを確認します．

{{< katex >}}(a_n)_n,(b_n)_n\in\mathbb{Z}_p{{< /katex >}} とします．
このとき，{{< katex >}}n\in\mathbb{N}{{< /katex >}} について {{< katex >}}a_n=a_n'+p^n\mathbb{Z},b_n=b'_n+p^n\mathbb{Z},a'_n,b'_n\in\mathbb{Z}{{< /katex >}} と表せます．
{{< katex >}}n,m\in\mathbb{N}{{< /katex >}} を {{< katex >}}n\le m{{< /katex >}} とします．
このとき，
{{< katex display=true >}}
\begin{aligned}
&a'_n+p^n\mathbb{Z}=a'_m+p^n\mathbb{Z},\\
&b'_n+p^n\mathbb{Z}=b'_m+p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
なので，各辺の和および積をとると，
{{< katex display=true >}}
\begin{aligned}
&(a'_n+b'_n)+p^n\mathbb{Z}=(a'_m+b'_m)+p^n\mathbb{Z},\\
&(a'_nb'_n)+p^n\mathbb{Z}=(a'_mb'_m)+p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
が成り立ちます．
これは，{{< katex >}}a_n+b_n=f_{nm}(a_m+b_m),a_nb_n=f_{nm}(a_mb_m){{< /katex >}} を意味するため，{{< katex >}}(a_n)_n,(b_n)_n\in\mathbb{Z}_p{{< /katex >}} ならば {{< katex >}}(a_n+b_n)_n\in\mathbb{Z}_p,(a_nb_n)_n\in\mathbb{Z}_p{{< /katex >}} です．
したがって，{{< katex >}}\mathbb{Z}_p{{< /katex >}} 上の和と積を {{< katex >}}(a_n)_n+(b_n)_n=(a_n+b_n)_n{{< /katex >}}, {{< katex >}}(a_n)_n(b_n)_n=(a_nb_n)_n{{< /katex >}} と定めることができます．

いま，{{< katex >}}x=(x_n)_n\in\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} が {{< katex >}}x'\in\mathbb{Z}{{< /katex >}} によって {{< katex >}}x=(x'+p^n\mathbb{Z})_n{{< /katex >}} と表されているものとします．
このとき，{{< katex >}}n\le m{{< /katex >}} ならば {{< katex >}}f_{nm}(x_m)=f_{nm}(x'+p^m\mathbb{Z})=x'+p^n\mathbb{Z}=x_n{{< /katex >}} なので {{< katex >}}x\in\mathbb{Z}_p{{< /katex >}} です．
特に，{{< katex >}}x'=0{{< /katex >}} や {{< katex >}}x'=1{{< /katex >}} とした {{< katex >}}(0+p^n\mathbb{Z})_n,(1+p^n\mathbb{Z})_n{{< /katex >}} も {{< katex >}}\mathbb{Z}_p{{< /katex >}} に属します．

{{< katex >}}\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} は左 {{< katex >}}\mathbb{Z}{{< /katex >}} 加群であることから特に {{< katex >}}\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} は可換群で，その零元は {{< katex >}}(0+p^n\mathbb{Z})_n{{< /katex >}} です．
{{< katex >}}\mathbb{Z}_p\subseteq\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} で，{{< katex >}}\mathbb{Z}_p{{< /katex >}} は加法によって閉じています．
{{< katex >}}x=(x'_n+p^n\mathbb{Z})_n\in\mathbb{Z}_p,x'_n\in\mathbb{Z}{{< /katex >}} に対し，{{< katex >}}-x'_n\in\mathbb{Z}{{< /katex >}} なので，{{< katex >}}y=((-x'_n)+p^n\mathbb{Z})_n{{< /katex >}} とおくと {{< katex >}}y\in\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} です．
そして，{{< katex >}}n\le m{{< /katex >}} において {{< katex >}}x'_n+p^n\mathbb{Z}=x'_m+p^n\mathbb{Z}{{< /katex >}} より，両辺 {{< katex >}}(-1)){{< /katex >}} 倍して {{< katex >}}(-x'_n)+p^n\mathbb{Z}=(-x'_m)+p^n\mathbb{Z}{{< /katex >}} なので {{< katex >}}y\in\mathbb{Z}_p{{< /katex >}} です．
さらに，{{< katex >}}x+y=((x'_n+(-x'_n))+p^n\mathbb{Z})_n=(0+p^n\mathbb{Z})_n{{< /katex >}}, {{< katex >}}y+x=(((-x'_n)+x'_n)+p^n\mathbb{Z})_n=(0+p^n\mathbb{Z})_n{{< /katex >}} なので，{{< katex >}}-x=y\in\mathbb{Z}_p{{< /katex >}} となります．
よって，{{< katex >}}\mathbb{Z}_p{{< /katex >}} は可換群 {{< katex >}}\prod_{n\in\mathbb{N}}\mathbb{Z}/p^n\mathbb{Z}{{< /katex >}} の部分群となり，{{< katex >}}\mathbb{Z}_p{{< /katex >}} は可換群をなすことがわかります．

{{< katex >}}a=(a'_n+p^n\mathbb{Z})_n,b=(b'_n+p^n\mathbb{Z})_n,c=(c'_n+p^n\mathbb{Z})_n\in\mathbb{Z}_p,a'_n,b'_n,c'_n\in\mathbb{Z}{{< /katex >}} とすると，
{{< katex display=true >}}
\begin{aligned}
  &(ab)c\\
  &=((a'_n+p^n\mathbb{Z})(b'_n+p^n\mathbb{Z}))(c'_n+p^n\mathbb{Z})\\
  &=(a'_nb'_n+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z})\\
  &=a'_nb'_nc'_n+p^n\mathbb{Z}\\
  &=(a'_n+p^n\mathbb{Z})(b'_nc'_n+p^n\mathbb{Z})\\
  &=(a'_n+p^n\mathbb{Z})((b'_n+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z}))\\
  &=a(bc)
\end{aligned}
{{< /katex >}}
が成り立ちます．
また，
{{< katex display=true >}}
\begin{aligned}
  &a(b+c)\\
  &=(a'_n+p^n\mathbb{Z})((b'_n+p^n\mathbb{Z})+(c'_n+p^n\mathbb{Z}))\\
  &=(a'_n+p^n\mathbb{Z})((b'_n+c'_n)+p^n\mathbb{Z})\\
  &=(a'_n(b'_n+c'_n))+p^n\mathbb{Z}\\
  &=(a'_nb'_n+a'_nc'_n)+p^n\mathbb{Z}\\
  &=(a'_nb'_n+p^n\mathbb{Z})+(a'_nc'_n+p^n\mathbb{Z})\\
  &=(a'_n+p^n\mathbb{Z})(b'_n+p^n\mathbb{Z})+(a'_n+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z})\\
  &=ab+ac
\end{aligned}
{{< /katex >}}
や，
{{< katex display=true >}}
\begin{aligned}
  &(a+b)c\\
  &=((a'_n+p^n\mathbb{Z})+(b'_n+p^n\mathbb{Z}))(c'_n+p^n\mathbb{Z})\\
  &=((a'_n+b'_n)+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z})\\
  &=((a'_n+b'_n)c'_n)+p^n\mathbb{Z}\\
  &=(a'_nc'_n+b'_nc'_n)+p^n\mathbb{Z}\\
  &=(a'_nc'_n+p^n\mathbb{Z})+(b'_nc'_n+p^n\mathbb{Z})\\
  &=(a'_n+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z})+(b'_n+p^n\mathbb{Z})(c'_n+p^n\mathbb{Z})\\
  &=ac+bc
\end{aligned}
{{< /katex >}}
も成り立ちます．

さらに，{{< katex >}}e=(1+p^n\mathbb{Z})_n{{< /katex >}} とおくと，
{{< katex display=true >}}
\begin{aligned}
  ae&=(a'_n+p^n\mathbb{Z})(1+p^n\mathbb{Z})\\
  &=(a'_n\cdot 1+p^n\mathbb{Z})\\
  &=(a'_n+p^n\mathbb{Z})\\
  &=a,\\
  ea&=(1+p^n\mathbb{Z})(a'_n+p^n\mathbb{Z})\\
  &=(1\cdot a'_n+p^n\mathbb{Z})\\
  &=(a'_n+p^n\mathbb{Z})\\
  &=a
\end{aligned}
{{< /katex >}}
なので {{< katex >}}e{{< /katex >}}は乗法の単位元となり {{< katex >}}\mathbb{Z}_p{{< /katex >}} は環をなします．
以下，{{< katex >}}0_{\mathbb{Z}_p}=(0+p^n\mathbb{Z})_n{{< /katex >}}, {{< katex >}}1_{\mathbb{Z}_p}=(1+p^n\mathbb{Z})_n{{< /katex >}} と書くことにします．

さらに，
{{< katex display=true >}}
\begin{aligned}
  &ab\\
  &=(a'_n+p^n\mathbb{Z})(b'_n+p^n\mathbb{Z})\\
  &=(a'_nb'_n+p^n\mathbb{Z})\\
  &=(b'_na'_n+p^n\mathbb{Z})\\
  &=(b'_n+p^n\mathbb{Z})(a'_n+p^n\mathbb{Z})\\
  &=ba
\end{aligned}
{{< /katex >}}
なので，{{< katex >}}\mathbb{Z}_p{{< /katex >}} は可換環をなすことがわかります．
この {{< katex >}}\mathbb{Z}_p{{< /katex >}} を **{{< katex >}}p{{< /katex >}}進整数環** といいます．

これも冒頭で述べたとおり，[[1, 例1.55, p.41]](#cite:1) では，{{< katex >}}\mathbb{Z}_p{{< /katex >}} が整域であり，{{< katex >}}\mathbb{Z}_p{{< /katex >}} において {{< katex >}}p1_{\mathbb{Z}_p}=\underbrace{1_{\mathbb{Z}_p}+\cdots+1_{\mathbb{Z}_p}}_{p\text{\ times}}\neq0_{\mathbb{Z}_p}{{< /katex >}} であることが説明されています．
その準備として，さらに {{< katex >}}\mathbb{Z}_p{{< /katex >}} の元の性質を観察してみます．

{{< katex >}}x=(x_n)_n\in\mathbb{Z}_p{{< /katex >}} とします．
{{< katex >}}m\in\mathbb{N}{{< /katex >}} とし，{{< katex >}}x_m=0+p^m\mathbb{Z}{{< /katex >}} とします．
すると，{{< katex >}}n\le m{{< /katex >}} ならば {{< katex >}}x_n=f_{nm}(x_m)=f_{nm}(0+p^m\mathbb{Z})=0+p^n\mathbb{Z}{{< /katex >}} となります．
したがって，ある {{< katex >}}m{{< /katex >}} において {{< katex >}}x_m=0+p^m\mathbb{Z}{{< /katex >}} のとき，{{< katex >}}n\le m{{< /katex >}} ならば {{< katex >}}x_n=0+p^n\mathbb{Z}{{< /katex >}} となります．

この観察から，{{< katex >}}x\neq0_{\mathbb{Z}_p}{{< /katex >}} ならば，ある {{< katex >}}N\in\mathbb{N}{{< /katex >}} が存在し，{{< katex >}}n\ge N{{< /katex >}} ならば {{< katex >}}x_n\neq0+p^n\mathbb{Z}{{< /katex >}} となることがわかります．
なぜならば，そのような {{< katex >}}N\in\mathbb{N}{{< /katex >}} が存在しなければ，任意の {{< katex >}}n\in\mathbb{N}{{< /katex >}} について {{< katex >}}n'\ge n{{< /katex >}} が存在し {{< katex >}}x_{n'}=0+p^{n'}\mathbb{Z}{{< /katex >}} となりますが，{{< katex >}}n'\ge n{{< /katex >}} より {{< katex >}}x_n=0+p^n\mathbb{Z}{{< /katex >}} となり，これが任意の {{< katex >}}n\in\mathbb{N}{{< /katex >}} について成り立つので {{< katex >}}x=0_{\mathbb{Z}_p}{{< /katex >}} となり矛盾するためです．

さて，[[1, 例1.55, p.41]](#cite:1) に戻り，まず {{< katex >}}\mathbb{Z}_p{{< /katex >}} が整域であることを確認します．
{{< katex >}}a=(a_n)_n,b=(b_n)_n\in\mathbb{Z}_p{{< /katex >}} とします．
{{< katex >}}\mathbb{Z}_p{{< /katex >}} が整域であることを示すために，{{< katex >}}a,b\neq0_{\mathbb{Z}_p}{{< /katex >}} ならば {{< katex >}}ab\neq0_{\mathbb{Z}_p}{{< /katex >}} であることを示します．
より具体的には，ある {{< katex >}}N\in\mathbb{Z}{{< /katex >}} が存在し，{{< katex >}}a_Nb_N\neq0+p^N\mathbb{Z}{{< /katex >}}  であることを示します．

{{< katex >}}a=(a_n)_n,b=(b_n)_n\in\mathbb{Z}_p{{< /katex >}} が {{< katex >}}a,b\neq0_{\mathbb{Z}_p}{{< /katex >}} であるとします．
このとき，ある {{< katex >}}N_1{{< /katex >}} が存在し {{< katex >}}n\ge N_1{{< /katex >}} ならば {{< katex >}}a_n\neq 0+p^n\mathbb{Z}{{< /katex >}} で，ある {{< katex >}}N_2{{< /katex >}} が存在し {{< katex >}}n\ge N_2{{< /katex >}} ならば {{< katex >}}b_n\neq 0+p^n\mathbb{Z}{{< /katex >}} です．
したがって， {{< katex >}}N_3=\max\{N_1,N_2\}{{< /katex >}} とすると，{{< katex >}}n\ge N_3{{< /katex >}} ならば {{< katex >}}a_n,b_n\neq0+p^n\mathbb{Z}{{< /katex >}} です．
よって，{{< katex >}}n\in\mathbb{N}{{< /katex >}} を {{< katex >}}n\ge N_3{{< /katex >}} ととれば，[[1, 例1.55, p.41]](#cite:1) のように {{< katex >}}a_n,b_n\neq0+p^n\mathbb{Z}{{< /katex >}} なる {{< katex >}}n\in\mathbb{N}{{< /katex >}} がとれます．

[[1, 例1.55, p.41]](#cite:1) に従い，{{< katex >}}a_{2n-1}=a'_{2n-1}+p^{2n-1}\mathbb{Z},b_{2n-1}=b'_{2n-1}+p^{2n-1}\mathbb{Z},a'_{2n-1},b'_{2n-1}\in\mathbb{Z}{{< /katex >}} とします．
{{< katex display=true >}}
\begin{aligned}
a'_{2n-1}+p^n\mathbb{Z}&=f_{n,2n-1}(a'_{2n-1}+p^{2n-1}\mathbb{Z})\\
&=f_{n,2n-1}(a_{2n-1})\\
&=a_n\\
&\neq0+p^n\mathbb{Z}
\end{aligned}
{{< /katex >}}
であることから，{{< katex >}}a'_{2n-1}\notin p^n\mathbb{Z}{{< /katex >}} であり，{{< katex >}}a'_{2n-1}{{< /katex >}} は高々 {{< katex >}}n-1{{< /katex >}} 回しか {{< katex >}}p{{< /katex >}} で割り切れません．
{{< katex >}}b'_{2n-1}{{< /katex >}} も同様に高々 {{< katex >}}n-1{{< /katex >}} 回しか {{< katex >}}p{{< /katex >}} で割り切れません．
したがって，{{< katex >}}a'_{2n-1}b'_{2n-1}{{< /katex >}} は高々 {{< katex >}}2(n-1){{< /katex >}} 回しか {{< katex >}}p{{< /katex >}} で割り切れません．
よって，{{< katex >}}a'_{2n-1}b'_{2n-1}\notin p^{2n-1}\mathbb{Z}{{< /katex >}} となり，
{{< katex display=true >}}
a_{2n-1}b_{2n-1}\neq 0+p^{2n-1}\mathbb{Z}
{{< /katex >}}
となります．
つまり，{{< katex >}}N=2n-1{{< /katex >}} とすれば，{{< katex >}}a_Nb_N\neq0+p^N\mathbb{Z}{{< /katex >}} となります．

以上より，{{< katex >}}a,b\in\mathbb{Z}_p{{< /katex >}} が {{< katex >}}a,b\neq0_{\mathbb{Z}_p}{{< /katex >}} ならば {{< katex >}}ab\neq0_{\mathbb{Z}_p}{{< /katex >}} であることが示せました．

また，{{< katex >}}p1_{\mathbb{Z}_p}=(p+p^n\mathbb{Z})_n{{< /katex >}} については，{{< katex >}}p\notin p^2\mathbb{Z}{{< /katex >}} より，{{< katex >}}p+p^2\mathbb{Z}\neq0+p^2\mathbb{Z}{{< /katex >}} となるので，{{< katex >}}p1_{\mathbb{Z}_p}\neq0_{\mathbb{Z}_p}{{< /katex >}} であることもわかります．

以上より，[[1, 例1.55, p.41]](#cite:1) の主張がすべて確認できました．

## まとめ

本ページでは [[1, 例1.55, p.41]](#cite:1) の主張をひとつひとつ確認しました．
特に，**{{< katex >}}p{{< /katex >}}進整数環** について，細かく述べられていなかった主張を確認しました．
もちろんこれだけでは {{< katex >}}p{{< /katex >}}進整数環についてほとんど何もわかりませんでしたが，具体例について考えたことで，帰納極限やそれに関連する議論の練習に少しだけでもなったように思います．

## 参考文献

{{< anchor "cite:1" >}}[1] 志甫 淳，“層とホモロジー代数”， 共立出版，東京，2016.
