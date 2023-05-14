---
title: "レール"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# レール

## 概要

タカラトミーのプラレールという鉄道玩具が広く知られています [[1]](#takaratomy:1)．本ページでは，プラレールにおける，レールの数学的表現を考えます．

## レールの数学的表現

レールは直線や曲線のものが基本的ですが，ほかに，並走するもの，分岐するもの，高さが変わるものなどがあります．また，レール同士の接続部は，凹凸の形状になっています．さらに，一部を除き，裏返しても使えるようになっています．

以上をふまえ，レールの形式的定義を以下のようにまとめます．

{{< hint info >}}
{{< theorem-label name="Definition" >}} 
1. \\(\Phi\\) を，以下を満たす写像 \\(\phi\\) 全体の集合とする．
    * \\(\phi:\\{\theta\in\mathbb{R}\mid 0<\theta<1\\}\to\mathbb{R}^3\\) である．
    * \\(\phi\\) は単射である．
    * \\(\lim_{\theta\to0}\phi(\theta)=0\\) であり，\\(\lim_{\theta\to1}\phi(\theta)\\) が存在する．
    * \\(\phi\\) は連続で，\\(\lim\_{\theta\to0}\phi\'(\theta)/\\|\phi\'(\theta)\\|_2\\), \\(\lim\_{\theta\to1}\phi\'(\theta)/\\|\phi\'(\theta)\\|_2\\) が存在する．
2. \\(\mathcal{T}=\\{+,-,\bot\\}\\) とする．
3. \\(1\\) 以上の整数 \\(n, m\\) に対し，\\(\Psi_{n,m}\\) を，以下を満たす写像 \\(\psi\\) 全体の集合とする．
    * \\(\psi:\\{1,2,\dots,n\\}\times\\{0,1\\}\to\\{1,2,\dots,m\\}\\) である．
    * \\(\psi\\) は全射である．
    * \\(i=1,2,\dots,n\\) について \\(\psi(i,0)\not=\psi(i,1)\\) である．

4. 以下の集合 \\(\mathcal{R}\\) の元 \\(r\\) を **レール** という．
{{< katex display >}}
\begin{aligned}
&\mathcal{R}=\bigg\{(\phi_1,\dots,\phi_n,t_1,\dots,t_m,\psi,u_1,\dots,u_{n-1})\\
&\quad\in\left(\bigcup_{m=1,2,\dots}(\Phi\times\mathcal{T}^m\times\Psi_{1,m})\right)\cup\left(\bigcup_{\begin{subarray}{c}n=2,3,\dots,\\m=1,2,\dots\end{subarray}}(\Phi^n\times\mathcal{T}^m\times\Psi_{n,m}\times(\mathbb{R}^3)^{n-1})\right)\,\bigg|\\
&\qquad\qquad\qquad\forall i,j\,(t_{\psi(i,j)}\not=\bot\implies\forall i',j'\,(i\not=i'\implies \psi(i,j)\not=\psi(i',j')))\bigg\}
\end{aligned}
{{< /katex >}}

{{< /hint >}}

{{< katex >}}\phi_i\,(1\le i\le n){{< /katex >}} は単純な曲線（自己交差のない曲線）です．つまり上の定義では，レールは，1個以上の単純な曲線で構成されるものであることを要請しています．次に，{{< katex >}}t_i\,(1\le i\le m){{< /katex >}} は接続部の形状を表します．単純曲線同士の内部結合点は {{< katex >}}\bot{{< /katex >}} で表します．{{< katex >}}\psi{{< /katex >}} は曲線 {{< katex >}}\phi_i\,(1\le i\le n){{< /katex >}} の端点と，接続形状 {{< katex >}}t_i\,(1\le i\le m){{< /katex >}} との対応を表します．{{< katex >}}u_i\,(1\le i\le n-1){{< /katex >}} は {{< katex >}}\phi_i\,(2\le i\le n){{< /katex >}} の {{< katex >}}\theta=0{{< /katex >}} 側の点の，{{< katex >}}\lim_{\theta\to0}\phi_1(\theta){{< /katex >}} からの変位を表します．

## レールの例

レールの例について述べます．本ページでは，鉛直上向きの方向を {{< katex >}}z{{< /katex >}}軸の正の方向とします．

### 直線レール

長さが {{< katex >}}l{{< /katex >}} で，端点の形状が異なるレール {{< katex >}}r^{[01]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[01]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}l/2{{< /katex >}} で，端点の形状が異なるレール {{< katex >}}r^{[07]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[07]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta/2,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}2l{{< /katex >}} で，端点の形状が異なるレール {{< katex >}}r^{[20]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[07]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(2l\theta,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}l/4{{< /katex >}} で，端点の形状が異なるレール {{< katex >}}r^{[08,1]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[08,1]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta/4,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}l/4{{< /katex >}} で，端点がともに凹形状であるレール {{< katex >}}r^{[08,2]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[08,2]}=(\phi_1,-,-,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta/4,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}l/4{{< /katex >}} で，端点がともに凸形状であるレール {{< katex >}}r^{[08,3]}{{< /katex >}}は，以下のように表されます．
* {{< katex >}}r^{[08,3]}=(\phi_1,+,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta/4,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

長さが {{< katex >}}l{{< /katex >}} で，端点の形状が異なる直線2本からなるレール {{< katex >}}r^{[04]}{{< /katex >}}は，以下のように表されます．ここで，レール同士の幅は {{< katex >}}\Delta{{< /katex >}} であるとします．
* {{< katex >}}r^{[04]}=(\phi_1,\phi_2,-,+,-,+,\psi,u_1),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\theta,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\phi_2(\theta)=(l\theta,0,0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\psi(1,1)=2,\psi(2,0)=3,\psi(2,1)=4{{< /katex >}}
* {{< katex >}}u_1=(0,\Delta,0){{< /katex >}}

### 曲線レール

半径が {{< katex >}}l{{< /katex >}}, 中心角が {{< katex >}}\pi/4{{< /katex >}} の扇形の孤の形状で，端点の形状が異なるレール {{< katex >}}r^{[03]}{{< /katex >}} は，以下のように表されます．
* {{< katex >}}r^{[03]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\sin\theta\pi/4,l(1-\cos\theta\pi/4),0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

半径が {{< katex >}}l{{< /katex >}}, 中心角が {{< katex >}}\pi/2{{< /katex >}} の扇形の孤の形状で，端点の形状が異なるレール {{< katex >}}r^{[09]}{{< /katex >}} は，以下のように表されます．
* {{< katex >}}r^{[09]}=(\phi_1,-,+,\psi),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\sin\theta\pi/2,l(1-\cos\theta\pi/2),0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\quad \psi(1,1)=2{{< /katex >}}

半径が {{< katex >}}l{{< /katex >}}, {{< katex >}}l'{{< /katex >}} 中心角が {{< katex >}}\pi/4{{< /katex >}} の扇形の孤の形状で，端点の形状が異なる2本の曲線からなるレール {{< katex >}}r^{[04]}{{< /katex >}} は，以下のように表されます．ここで，レール同士の幅は {{< katex >}}\Delta{{< /katex >}} であるとします．
* {{< katex >}}r^{[04]}=(\phi_1,\phi_2,-,+,-,+,\psi,u_1),{{< /katex >}}
* {{< katex >}}\phi_1(\theta)=(l\sin\theta\pi/4,l(1-\cos\theta\pi/4),0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\phi_2(\theta)=(l'\sin\theta\pi/4,l'(1-\cos\theta\pi/4),0),\quad 0<\theta<1,{{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\psi(1,1)=2,\psi(2,0)=3,\psi(2,1)=4{{< /katex >}}
* {{< katex >}}u_1=(0,\Delta,0){{< /katex >}}

### 分岐を含むレール

Y字型に分岐するレール {{< katex >}}r^{[22,A]}{{< /katex >}} は，以下のように表されます．Y字の下部端点が凸形状であるとします．{{< katex >}}\phi_1,\phi_2,\phi_3{{< /katex >}} の具体的な表示は省略します．
* {{< katex >}}r^{[22,A]}=(\phi_1,\phi_2,\phi_3,+,\bot,-,+,\psi,u_1,u_2){{< /katex >}}
* {{< katex >}}\psi(1,0)=1,\psi(1,1)=2,\psi(2,0)=2,\psi(2,1)=3,\psi(3,0)=2,\psi(3,1)=4{{< /katex >}}
* {{< katex >}}u_1=u_2=\lim_{\theta\to1}\phi_1(\theta){{< /katex >}}

## まとめ

本ページでは，プラレールのレールに関する形式的定義についてまとめました．

## 参考文献

{{< anchor "takaratomy:1" >}}[1] タカラトミー，“トップページ｜プラレール｜タカラトミー”, https://www.takaratomy.co.jp/products/plarail/ , 2023/5/14 最終アクセス．
