---
title: "ジョーンズ マクロ経済学Ⅰ"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# ジョーンズ マクロ経済学Ⅰ

## 概要

昨今，手取りを増やすことを公約に掲げた政党が台頭し，日本経済再生への期待が高まっています．
本ページは，国の経済全体に関する経済学に関するものです．

経済を構成する個々の主体に着目するミクロ経済学に対し，それらを合わせて一国の経済全体に着目する経済学の領域は **マクロ経済学** と呼ばれます．
本ページでは，作成者が『ジョーンズ マクロ経済学Ⅰ 長期成長編』[1] を初読した際のメモをまとめます．
本ページの作成者は，[1] を読むまで，経済学に関する知識を一切有していませんでした．

本教科書 [1] は，簡単な数式を使って説明がなされており，数式に抵抗がない初心者にとってはわかりやすく感じました．
本ページでは，数式で表現された箇所を中心に，初読時のメモを整理して記載します．

本ページは解説文ではなく，あくまでメモの整理として数式で表されたモデルを中心にまとめますが，本教科書 [1] は数式ばかりがでてくるものではありません．
また，本文中にもあるように，マクロ経済学は数式のみから議論・検討を行う学問でないこともお断りしておきます．

## 第1章 マクロ経済学への招待

マクロ経済学の方法は以下のとおりです．

1. 事実を記述する．
2. **モデル** を開発する．
3. モデルから導き出される予見と元の事実とを比較する．
4. モデルを使って他のケースの予見を行う．

本ページでは，特に項番2にあるように，どのようなモデルが知られているかに着目してまとめます．

モデルの入力は **パラメータ** と **外生変数** で，出力は **内生変数** であると整理されます．

```
パラメータ -----> モデル ----> 内生変数
外生変数
```

* パラメータ：モデルの外から与える定数
* 外生変数：モデルの外から与える変数（時間的変化を許す）
* 内生変数：未知数に相当する変数

## 第2章 マクロ経済学の計測

**GDP** とは国内生産とのことです．
**生産＝支出＝所得** の関係が基本的原則で，それぞれの観点からGDPを計算しても同じ値となるはずのものです．

GDP の支出アプローチでは，GDP は以下の式で表されます．

{{< katex display=true >}}
Y=C+I+G+\mathit{NX}
{{< /katex >}}

記号の意味は以下のとおりです．

* {{< katex >}}Y{{< /katex >}}: GDP
* {{< katex >}}C{{< /katex >}}: 消費
* {{< katex >}}I{{< /katex >}}: 投資
* {{< katex >}}G{{< /katex >}}: 政府支出
* {{< katex >}}\mathit{NX}{{< /katex >}}: 純輸出

純輸出は **貿易・サービス収支** のことで，{{< katex >}}<0{{< /katex >}} のとき **貿易赤字** と呼ばれるものです．

GDP は **名目GDP** という考え方と **実質GDP** という考え方があり，以下の関係があります．

{{< katex display=true >}}
\text{名目GDP}=\text{価格水準}\times\text{実質GDP}
{{< /katex >}}

名目GDPは価格レベルの表現で，実質GDPは数量レベルの表現といえます．
ただし，実質GDPも特定の年の価格で表すことがふつうです．
年をまたぐときに，どの年で統一するかにはいくつかの流儀があります．

* **ラスパイレス指数**：基準時点（当初）で表す．
* **パーシェ指数**：比較時点（終わり）で表す．
* **連鎖指数**：これらの相乗平均で表す．

**価格水準** はGDPデフレータと呼ばれることもあります．
また，価格水準の変化率は **インフレ率** と呼ばれます．

## 第3章 経済成長の概観

人類がこの世に登場してからの13万年を1日に圧縮すると，近代経済成長の時代はわずか最後の3分で，急激な成長といえます．
また，この近代経済成長の開始のタイミングの違いが経済発展水準の格差拡大を生んでいます．

この **経済成長** をどう定義するかですが，これは1人あたりのGDPの変化率と捉えることができます．

成長率については一般に次のことが成り立ちます．
{{< katex >}}\bar{g}{{< /katex >}} を成長率とし，{{< katex >}}y_t{{< /katex >}} を時刻 {{< katex >}}t{{< /katex >}} における変数 {{< katex >}}y{{< /katex >}} の値とします．
このとき，

{{< katex display=true >}}
\begin{aligned}
  &y_t=y_0(1+\bar{g})^t,\\
  &\bar{g}=\left(\frac{y_t}{y_0}\right)^{1/t}-1
\end{aligned}
{{< /katex >}}

が成り立ちます．
後者を **成長率の計算公式** と呼びます．

いま，{{< katex >}}y_t=2y_0{{< /katex >}} となる {{< katex >}}t{{< /katex >}} を求めることを考えます．
{{< katex >}}(1+\bar{g})^t=2{{< /katex >}} なので，{{< katex >}}t=\ln 2/\ln(1+\bar{g}){{< /katex >}} ですが，{{< katex >}}\bar{g}\ll1{{< /katex >}} ならば {{< katex >}}\ln(1+\bar{g})\approx\bar{g}{{< /katex >}} なので，{{< katex >}}t\approx\ln 2/\bar{g}\approx0.7/\bar{g}{{< /katex >}} となります．

つまり，1年に2%ずつ成長するなら {{< katex >}}70\%/2\%=35{{< /katex >}} なので，およそ35年で2倍になることがわかります．

この法則を **成長に関する70の法則** といいます．

成長率の公式については次のことも言えます．

{{< katex >}}x,y,z{{< /katex >}} を変数とし，その成長率を {{< katex >}}g_x,g_y,g_z{{< /katex >}} とします．
つまり，{{< katex >}}x=(x_t),y=(y_t),z=(z_t){{< /katex >}} とし，

{{< katex display=true >}}
\begin{aligned}
  &x_{t+1}=(1+g_x)x_t,\\
  &y_{t+1}=(1+g_y)y_t,\\
  &z_{t+1}=(1+g_z)z_t
\end{aligned}
{{< /katex >}}

とします．

いま，{{< katex >}}xy=(x_ty_t){{< /katex >}} で定義し，{{< katex >}}x=y{{< /katex >}} を任意の {{< katex >}}t{{< /katex >}} について {{< katex >}}x_t=y_t{{< /katex >}} であると定義します．
ほかの演算（{{< katex >}}x/y{{< /katex >}} など）も同様とします．

{{< katex >}}x_0,y_0,z_0>0{{< /katex >}} としたとき，{{< katex >}}z=xy{{< /katex >}} ならば，

{{< katex display=true >}}
\frac{z_{t+1}}{z_t}=\frac{x_{t+1}}{x_t}\frac{y_{t+1}}{y_t}
{{< /katex >}}

なので，

{{< katex display=true >}}
1+g_z=(1+g_x)(1+g_y)=1+(g_x+g_y)+g_xg_y
{{< /katex >}}

となります．
ここで，{{< katex >}}g_x,g_y\ll1{{< /katex >}} なら {{< katex >}}g_xg_y\approx0{{< /katex >}} なので，

{{< katex display=true >}}
g_z=(g_x+g_y)+g_xg_y\approx g_x+g_y
{{< /katex >}}

が成り立ちます．
つまり，{{< katex >}}g_x,g_y\ll1{{< /katex >}} ならば，

{{< katex display=true >}}
z=xy\implies g_z\approx g_x+g_y
{{< /katex >}}

同様の仮定のもとで，

{{< katex display=true >}}
\begin{aligned}
  &z=x/y\implies g_z\approx g_x-g_y,\\
  &z=x^a\implies g_z\approx ag_x
\end{aligned}
{{< /katex >}}

がいえます．

## 第4章 生産のモデル

以下のモデルを **コブ=ダグラス型生産関数** と呼びます．

{{< katex display=true >}}
Y=F(K,L)=\bar{A}K^{1/3}L^{2/3}
{{< /katex >}}

ただし，

* {{< katex >}}Y{{< /katex >}}: 生産量
* {{< katex >}}K{{< /katex >}}: 資本
* {{< katex >}}L{{< /katex >}}: 労働力
* {{< katex >}}\bar{A}{{< /katex >}}: 生産性パラメータ

です．

**資本の限界生産物** {{< katex >}}\mathit{MPK}{{< /katex >}} は
{{< katex display=true >}}
  \mathit{MPK}=\frac{\partial Y}{\partial K}=\frac{1}{3}\bar{A}K^{-2/3}L^{2/3}=\frac{1}{3}\frac{Y}{K}
{{< /katex >}}
と表されます．

**労働の限界生産物** {{< katex >}}\mathit{MPL}{{< /katex >}} は
{{< katex display=true >}}
  \mathit{MPL}=\frac{\partial Y}{\partial L}=\frac{2}{3}\bar{A}K^{1/3}L^{-1/3}=\frac{2}{3}\frac{Y}{L}
{{< /katex >}}
と表されます．

賃金率 {{< katex >}}w{{< /katex >}}, 資本のレンタル価格 {{< katex >}}r{{< /katex >}} に対し，以下の最適化問題を考えます．

{{< katex display=true >}}
  \text{maximize\ }\Pi=F(K,L)-rK-wL.
{{< /katex >}}

ここで，

* {{< katex >}}\mathit{MPK}\ge r{{< /katex >}} なら資本投入
* {{< katex >}}\mathit{MPL}\ge w{{< /katex >}} なら労働投入

なる戦略をとるとき，{{< katex >}}\bar{K},\bar{L}{{< /katex >}} を所与とすると，以下の生産のモデルが立てられます．

{{< katex display=true >}}
\begin{cases}
  Y=\bar{A}K^{1/3}L^{2/3},\\
  \dfrac{1}{3}\dfrac{Y}{K}=r,\\[8pt]
  \dfrac{2}{3}\dfrac{Y}{L}=w,\\
  K=\bar{K},\\
  L=\bar{L}.
\end{cases}
{{< /katex >}}

この方程式系の解は以下のとおりで，これを **均衡** と呼びます．

{{< katex display=true >}}
\begin{cases}
  K^*=\bar{K},\\
  L^*=\bar{L},\\
  r^*=\dfrac{1}{3}\bar{A}\left(\dfrac{\bar{L}}{\bar{K}}\right)^{2/3},\\[8pt]
  w^*=\dfrac{2}{3}\bar{A}\left(\dfrac{\bar{K}}{\bar{L}}\right)^{1/3},\\
  Y^*=\bar{A}\bar{K}^{1/3}{L}^{2/3}.
\end{cases}
{{< /katex >}}

{{< katex >}}y=Y/L{{< /katex >}}, {{< katex >}}k=K/L{{< /katex >}} とおくと，

* {{< katex >}}y{{< /katex >}}: 1人あたりの産出量
* {{< katex >}}k{{< /katex >}}: 1人あたりの資本

となりますが，

{{< katex display=true >}}
y^*=\frac{Y^*}{L^*}=\frac{\bar{A}\bar{K}^{1/3}\bar{L}^{2/3}}{\bar{L}}=\bar{A}\left(\frac{\bar{K}}{\bar{L}}\right)^{1/3}=\bar{A}\bar{k}^{1/3}
{{< /katex >}}

が成り立ちます．
{{< katex >}}\bar{A}{{< /katex >}}は **全要素生産性 (TFP)** といい，逆に以下から求めることもできます．
{{< katex display=true >}}
\bar{A}=\frac{y^*}{\bar{k}^{1/3}}.
{{< /katex >}}

A国，B国の比較では以下のように計算することができます．
{{< katex display=true >}}
\frac{y^*_{\mathrm{A}}}{y^*_{\mathrm{B}}}=\frac{\bar{A}_{\mathrm{A}}}{\bar{A}_{\mathrm{B}}}\left(\frac{\bar{k}_{\mathrm{A}}}{\bar{k}_{\mathrm{B}}}\right)^{1/3}.
{{< /katex >}}

## 第5章 ソロー・モデル

コブ=ダグラス型生産関数から **ソロー・モデル** を構築します．

コブ=ダグラス型関数とは次のようなものでした．

{{< katex display=true >}}
Y=F(K,L)=\bar{A}K^{1/3}Y^{2/3}
{{< /katex >}}

ただし，

* {{< katex >}}Y{{< /katex >}}: 生産量
* {{< katex >}}K{{< /katex >}}: 資本
* {{< katex >}}L{{< /katex >}}: 労働力
* {{< katex >}}\bar{A}{{< /katex >}}: 生産性パラメータ

です．

これを時刻 {{< katex >}}t{{< /katex >}}ごとの方程式に置き換えると以下のようになります．

{{< katex display=true >}}
Y_t=F(K_t,L_t)=\bar{A}K_t^{1/3}L_t^{2/3}
{{< /katex >}}

次に，生産物と消費，投資との関係を以下のように表します．

{{< katex display=true >}}
C_t+I_t=Y_t
{{< /katex >}}

ただし，

* {{< katex >}}C_t{{< /katex >}}: 消費
* {{< katex >}}I_t{{< /katex >}}: 投資

です．
{{< katex >}}Y_t-C_t{{< /katex >}} は **貯蓄** に対応し，{{< katex >}}Y_t-C_t=I_t{{< /katex >}} なので，貯蓄額が投資額に一致することを表しています．

次に **資本蓄積方程式** を以下のように与えます．

{{< katex display=true >}}
\Delta K_{t+1}=I_t-\bar{d}K_t.
{{< /katex >}}

ただし，

* {{< katex >}}\bar{d}{{< /katex >}}: 資本減耗率

です．
また，{{< katex >}}\Delta K_{t+1}=K_{t+1}-K_t {{< /katex >}} として，他の変数でも同様の意味とします．
ここで，{{< katex >}}K_t{{< /katex >}} は **資本ストック**，{{< katex >}}\Delta K_{t+1}{{< /katex >}} は **資本ストックの変化量** と捉えられます．
この式は，

{{< katex display=true >}}
K_{t+1}=K_t+I_t-\bar{d}K_t.
{{< /katex >}}

と捉えたほうがわかりやすいかもしれません．

次に，投資への割合を
{{< katex display=true >}}
I_t=\bar{s}Y_t
{{< /katex >}}
とします．ただし，

* {{< katex >}}\bar{s}{{< /katex >}}: 投資率

とします．

労働供給が一定とすると {{< katex >}}L_t=\bar{L}{{< /katex >}} とできるので，以上をまとめると次の方程式系が得られます．
{{< katex display=true >}}
\begin{cases}
  Y_t=F(K_t,L_t)=\bar{A}K_t^{1/3}L_t^{2/3},\\
  \Delta K_{t+1}=I_t-\bar{d}K_t,\\
  L_t=\bar{L},\\
  C_t+I_t=Y_t,\\
  I_t=\bar{s}Y_t.
\end{cases}
{{< /katex >}}
これを **ソロー・モデル** といいます．

{{< katex >}}\Delta K_{t+1}=0{{< /katex >}} のときを **定常状態** といい，{{< katex >}}K_t=K_{t+1}=\cdots{{< /katex >}} のとき {{< katex >}}K^*=K_t{{< /katex >}} とし，そのときの {{< katex >}}t{{< /katex >}} を用いて {{< katex >}}K^*=K_t,Y^*=Y_t{{< /katex >}} などとします．

{{< katex >}}0=\Delta K_{t+1}=I_t-\bar{d}K_t=\bar{s}Y_t-\bar{d}K_t=\bar{s}Y^*-\bar{d}K^*{{< /katex >}} なので {{< katex >}}\bar{s}Y^*=\bar{d}K^*{{< /katex >}} です．
これは，
{{< katex display=true >}}
\frac{K^*}{Y^*}=\frac{\bar{s}}{\bar{d}}
{{< /katex >}}
であることも表しています．

また，{{< katex >}}Y^*=\bar{A}{K^*}^{1/3}\bar{L}^{2/3}{{< /katex >}} なので，
{{< katex display=true >}}
  \frac{\bar{d}}{\bar{s}}K^*=\bar{A}{K^*}^{1/3}\bar{L}^{2/3}\\
{{< /katex >}}
から
{{< katex display=true >}}
  {K^*}^{2/3}=\frac{\bar{s}\bar{A}}{\bar{d}}\bar{L}^{2/3}\\
{{< /katex >}}
なので
{{< katex display=true >}}
  K^*=\left(\frac{\bar{s}\bar{A}}{\bar{d}}\right)^{3/2}\bar{L}
{{< /katex >}}
であることがわかった．

同様に，
{{< katex display=true >}}
\begin{aligned}
Y^*&=\bar{A}{K^*}^{1/3}\bar{L}^{2/3}\\
&=\bar{A}\left(\frac{\bar{s}\bar{A}}{\bar{d}}\right)^{1/2}\bar{L}^{1/3}\bar{L}^{2/3}\\
&=\left(\frac{\bar{s}}{\bar{d}}\right)^{1/2}\bar{A}^{3/2}\bar{L}
\end{aligned}
{{< /katex >}}
であることがわかります．

また，{{< katex >}}L^*=\bar{L}{{< /katex >}} なので，
{{< katex display=true >}}
y^*=\frac{Y^*}{L^*}=\bar{A}^{3/2}\left(\frac{\bar{s}}{\bar{d}}\right)^{1/2}
{{< /katex >}}
です．

