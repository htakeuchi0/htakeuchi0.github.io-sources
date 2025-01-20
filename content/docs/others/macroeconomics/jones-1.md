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

手取りを増やすことを公約に掲げた政党の台頭が示すように，昨今，日本経済再生への期待が高まっています．
本ページは，国の経済全体に関する経済学についてのノートです．

経済を構成する個々の主体に着目するミクロ経済学に対し，それらを合わせて一国の経済全体に着目する経済学の領域は **マクロ経済学** と呼ばれます．
本ページでは，作成者が『ジョーンズ マクロ経済学Ⅰ 長期成長編』[[1]](#cite:1) を初読した際のメモをまとめます．
本ページの作成者は，[[1]](#cite:1) を読むまで，経済学に関する知識を一切有していませんでした．

本教科書 [[1]](#cite:1) は，簡単な数式を使って説明がなされており，数式に抵抗がない初心者にとってはわかりやすく感じました．
本ページでは，数式で表現された箇所を中心に，初読時のメモを整理して記載します．

本ページは解説文ではなく，あくまでメモの整理として数式で表されたモデルを中心にまとめますが，本教科書 [[1]](#cite:1) は数式ばかりがでてくるものではありません．
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

以下，外から与えられるものを {{< katex >}}\bar{\cdot}{{< /katex >}} と上線を付けた記号で表します．

## 第2章 マクロ経済学の計測

**GDP** とは国内生産とのことです．
**生産＝支出＝所得** の関係が基本的原則で，それぞれの観点からGDPを計算しても同じ値となります．

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
* **連鎖指数**：各指数の倍率の相乗平均で表す．

**価格水準** は **GDPデフレータ** と呼ばれることもあります．
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

この方程式系の解は以下のとおりで，解のことを **均衡** と呼びます．

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
{{< katex >}}\bar{d}K_t{{< /katex >}} は **資本減耗** の量を表します．

なお，**ストック** とは期を超えて存在し続けるものを指しますが，これに対してひと期間しか持続しない量は **フロー** と呼ばれます．


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

{{< katex >}}\Delta K_{t+1}=0{{< /katex >}} のときを **定常状態** といい，{{< katex >}}K_t=K_{t+1}=\cdots{{< /katex >}} となる {{< katex >}}t{{< /katex >}} を用いて {{< katex >}}K^*=K_t,Y^*=Y_t{{< /katex >}} などとします．

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
であることがわかりました．

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

ソロー・モデルからは **移行過程の動学原理** と呼ばれる原理が導かれます．
これは，定常状態より低い所得水準にあればあるほど成長率は大きいという原理です．
この原理は資本蓄積方程式から導かれます．

資本蓄積方程式から {{< katex >}}\Delta K_{t+1}=I_t-\bar{d}K_t{{< /katex >}} ですが，{{< katex >}}I_t=\bar{s}Y_t{{< /katex >}} なので，

{{< katex display=true >}}
\frac{\Delta K_{t+1}}{K_t}=\bar{s}\frac{Y_t}{K_t}-\bar{d}
{{< /katex >}}

となります（ただし {{< katex >}}K_t>0{{< /katex >}} とします）．

さらに，{{< katex >}}\bar{s}Y^*=\bar{d}K^*{{< /katex >}} なので，

{{< katex display=true >}}
\begin{aligned}
&\frac{\Delta K_{t+1}}{K_t}=\bar{s}\frac{Y_t}{K_t}-\bar{d}\\
&=\bar{S}\left(\frac{Y_t}{K_t}-\frac{Y^*}{K^*}\right)\\
&=\bar{s}\frac{Y^*}{K^*}\left(\frac{Y_t/K_t}{Y^*/K^*}-1\right)\\
&=\bar{s}\frac{Y^*}{K^*}\left(\frac{\bar{A}K_t^{1/3}\bar{L}^{2/3}/K_t}{\bar{A}{K^*}^{1/3}\bar{L}^{2/3}/K^*}-1\right)\\
&=\bar{s}\frac{Y^*}{K^*}\left(\frac{K_t^{-2/3}}{{K^*}^{-2/3}}-1\right)\\
&=\bar{s}\frac{Y^*}{K^*}\left(\frac{{K^*}^{2/3}}{K_t^{2/3}}-1\right)
\end{aligned}
{{< /katex >}}

となります．

よって {{< katex >}}K_t < K^*{{< /katex >}} ならば資本ストック {{< katex >}}K_{t+1}{{< /katex >}} は増加し，その成長率は {{< katex >}}K_t\ll K^*{{</katex >}} の方が大きくなります．
さらに，生産過程を通じて，資本ストック {{< katex >}}K_t{{< /katex >}} は {{< katex >}}K^*{{< /katex >}} に向かい，その後はそこに留まり続けることを示しています．

## 第6章 アイディアと経済成長

ソロー・モデルには，長期的な成長を説明する理論的な枠組みが欠けている欠点があります．
そこで，モノに加えて **アイディア** も考えることで，そのような理論が構築できることが知られています．
アイディアは競合性がないことが重要です．
そのモデルは **ローマー・モデル** と呼ばれています．

ローマー・モデルを次のように構築します．
まず，以下の方程式を考えます．

{{< katex display=true >}}
Y_t=A_tL_{yt}.
{{< /katex >}}

ただし，
* {{< katex >}}Y_t{{< /katex >}}: 生産量
* {{< katex >}}A_t{{< /katex >}}: **知識ストック**
* {{< katex >}}L_t{{< /katex >}}: 労働投入量

を表します．

労働ストックの変化を以下のように表します．

{{< katex display=true >}}
\Delta A_{t+1}=\bar{z}A_tL_{at}.
{{< /katex >}}

ただし，
* {{< katex >}}\bar{z}{{< /katex >}}: **生産性パラメータ**
* {{< katex >}}L_{at}{{< /katex >}}: アイディア開発のために投入される労働量

を表します．また，

{{< katex display=true >}}
\begin{aligned}
  &L_{yt}+L_{at}=\bar{L},\\
  &L_{at}=\bar{\ell}\bar{L}
\end{aligned}
{{< /katex >}}

とします．
ただし，
* {{< katex >}}\bar{\ell}{{< /katex >}}: アイディア開発に従事する労働量の割合

を表します．

以上をまとめると以下のようになります．
{{< katex display=true >}}
\begin{cases}
  Y_t=A_tL_{yt},\\
  \Delta A_{t+1}=\bar{z}A_tL_{at},\\
  L_{yt}+L_{at}=\bar{L},\\
  L_{at}=\bar{\ell}\bar{L}
\end{cases}
{{< /katex >}}

これを **ローマー・モデル** といいます．

ローマー・モデルの解を求めます．

{{< katex >}}y_t=Y_t/\bar{L}{{< /katex >}} とすると，

{{< katex display=true >}}
\begin{aligned}
y_t&=\frac{Y_t}{\bar{L}}\\
&=\frac{A_tL_{yt}}{\bar{L}}\\
&=\frac{A_t(1-\bar{\ell})\bar{L}}{\bar{L}}\\
&=A_t(1-\bar{\ell})
\end{aligned}
{{< /katex >}}

となるので，1人あたりの生産量は {{< katex >}}A_t{{< /katex >}} に比例することがわかります．
また，

{{< katex display=true >}}
\frac{\Delta A_{t+1}}{A_t}=\bar{z}L_{at}=\bar{z}\bar{\ell}\bar{L}
{{< /katex >}}

なので，{{< katex >}}\bar{g}=\bar{z}\bar{\ell}\bar{L}{{< /katex >}} とおくと

{{< katex display=true >}}
A_t=\bar{A}_0(1+\bar{g})^t
{{< /katex >}}

となり，

{{< katex display=true >}}
y_t=\bar{A}_0(1-\bar{\ell})(1+\bar{g})^t
{{< /katex >}}

と表せます．

さて，ソロー・モデルは以下のようなもので，アイディアが考慮されていないモデルでした．

{{< katex display=true >}}
\begin{cases}
  Y_t=F(K_t,L_t)=\bar{A}K_t^{1/3}L_t^{2/3},\\
  \Delta K_{t+1}=I_t-\bar{d}K_t,\\
  L_t=\bar{L},\\
  C_t+I_t=Y_t,\\
  I_t=\bar{s}Y_t.
\end{cases}
{{< /katex >}}

ローマー・モデルは以下のようなもので，アイディアは考慮しますが資産については省略したモデルでした．

{{< katex display=true >}}
\begin{cases}
  Y_t=A_tL_{yt},\\
  \Delta A_{t+1}=\bar{z}A_tL_{at},\\
  L_{yt}+L_{at}=\bar{L},\\
  L_{at}=\bar{\ell}\bar{L}
\end{cases}
{{< /katex >}}

そこで，これらを統合し，資産とアイディアを両方考慮するモデルが考えられます．
このモデルを **ソロー=ローマー統合モデル** と呼びます．

ソロー=ローマー統合モデルは以下のように表されます．

{{< katex display=true >}}
\begin{cases}
  Y_t=A_tK_t^{1/3}L_{yt}^{2/3},\\
  \Delta K_{t+1}=\bar{s}Y_t-\bar{d}K_t,\\
  \Delta A_{t+1}=\bar{z}A_tL_{at},\\
  L_{yt}+L_{at}=\bar{L},\\
  L_{at}=\bar{\ell}\bar{L}.
\end{cases}
{{< /katex >}}

ソロー=ローマー統合モデルの解を求めます．

変数 {{< katex >}}X=(X_t){{< /katex >}} について，{{< katex >}}t{{< /katex >}} における成長率 {{< katex >}}g_{X_t}{{< /katex >}} を

{{< katex display=true >}}
g_{X_t}=\frac{\Delta X_{t+1}}{X_t}
{{< /katex >}}

で定めます．
すると，
{{< katex display=true >}}
\begin{aligned}
  &g_{Y_t}=g_{A_t}+\frac{1}{3}g_{K_t}+\frac{2}{3}g_{L_{yt}},\\
  &g_{A_t}=\frac{\Delta A_{t+1}}{A_t}=\bar{z}\bar{\ell}\bar{L}=\bar{g},\\
  &g_{K_t}=\frac{\Delta K_{t+1}}{K_t}=\bar{s}\frac{Y_t}{K_t}-\bar{d}
\end{aligned}
{{< /katex >}}
が得られます．

よって，資本ストック {{< katex >}}K_t{{< /katex >}} の成長率 {{< katex >}}g_{K_t}{{< /katex >}} が一定になる場合を考えると，{{< katex >}}Y_t/K_t{{< /katex >}} が一定となる必要があることがわかります．
つまり，{{< katex >}}g_K^*=g_Y^*{{< /katex >}} です．
また，労働量が一定である仮定をおくと {{< katex >}}g_{L_{yt}}=0{{< /katex >}} となります．
このとき，
{{< katex display=true >}}
g_Y^*=\bar{g}+\frac{1}{3}g_K^*+\frac{2}{3}\cdot0=\bar{g}+\frac{1}{3}g_Y^*
{{< /katex >}}
なので，
{{< katex display=true >}}
g_Y^*=\frac{3}{2}\bar{g}
{{< /katex >}}
となります．

さて，{{< katex>}}g_K^*=g_Y^*{{< /katex >}} なので，
{{< katex display=true >}}
\frac{K_t^*}{Y_t^*}=\frac{\bar{s}}{g_K^*+\bar{d}}=\frac{\bar{s}}{g_Y^*+\bar{d}}
{{< /katex >}}
です．
そして，
{{< katex display=true >}}
Y_t^*=A_t^*\left(\frac{\bar{s}Y_t^*}{g_Y^*+\bar{d}}\right)^{1/3}L_{yt}^{2/3}
{{< /katex >}}
なので，
{{< katex display=true >}}
{Y_t^*}^{2/3}=A_t^*\left(\frac{\bar{s}}{g_Y^*+\bar{d}}\right)^{1/3}L_{yt}^{2/3}
{{< /katex >}}
より，
{{< katex display=true >}}
\begin{aligned}
Y_t^*&={A_t^*}^{3/2}\left(\frac{\bar{s}}{g_Y^*+\bar{d}}\right)^{1/2}L_{yt}\\
&={A_t^*}^{3/2}\left(\frac{\bar{s}}{g_Y^*+\bar{d}}\right)^{1/2}\bar{L}(1-\bar{\ell})
\end{aligned}
{{< /katex >}}
です．
よって，
{{< katex display=true >}}
\begin{aligned}
y_t^*&=\frac{Y_t^*}{\bar{L}}\\
&={A_t^*}^{3/2}\left(\frac{\bar{s}}{g_Y^*+\bar{d}}\right)^{1/2}(1-\bar{\ell})
\end{aligned}
{{< /katex >}}
と求まります．

## 第7章 労働市場，賃金，および失業

失業は以下のように分けられます．

{{< katex display=true >}}
\text{失業}=\text{自然的}+\text{循環的}=(\text{摩擦的}+\text{構造的})+\text{循環的}
{{< /katex >}}

* 摩擦的：経済環境の変化により労働者が食を変更するための失業
* 構造的：労働者と企業のマッチングによる失業
* 循環的：短期変動に関連した失業

以下を **バスタブ・モデル** と呼びます．

{{< katex display=true >}}
\begin{cases}
  E_t+U_t=\bar{L},\\
  \Delta U_{t+1}=\bar{s}E_t+\bar{f}U_t
\end{cases}
{{< /katex >}}

ただし，
* {{< katex >}}E_t{{< /katex >}}: 就業者
* {{< katex >}}U_t{{< /katex >}}: 失業者
* {{< katex >}}\bar{s}{{< /katex >}}: 離職率
* {{< katex >}}\bar{f}{{< /katex >}}: 新規就職率

という意味です．

定常状態は {{< katex >}}\Delta U_{t+1}=0{{< /katex >}} の状態です．
このとき，
{{< katex display=true >}}
\begin{aligned}
  0&=\bar{s}E_t-\bar{f}U_t\\
  &=\bar{s}(\bar{L}-U_t)-\bar{f}U_t\\
  &=\bar{s}\bar{L}-(\bar{f}+\bar{s})U_t
\end{aligned}
{{< /katex >}}
なので，
{{< katex display=true >}}
U^*=\frac{\bar{s}\bar{L}}{\bar{f}+\bar{s}}
{{< /katex >}}
となります．
または，
{{< katex display=true >}}
u^*=\frac{U^*}{\bar{L}}=\frac{\bar{s}}{\bar{f}+\bar{s}}
{{< /katex >}}
といえます．

このバスタブ・モデルという呼称は，蛇口と排水溝をもつ入れ物と水かさの関係で例えたもので，バスタブ曲線のようにグラフの形状を表すものではありません．

## 第8章 インフレーション

**貨幣数量説** は以下で表されます．

{{< katex display=true >}}
M_tV_t=P_tY_t
{{< /katex >}}

ただし，
* {{< katex >}}M_t{{< /katex >}}: 貨幣量
* {{< katex >}}V_t{{< /katex >}}: 貨幣の流通速度
* {{< katex >}}P_t{{< /katex >}}: 物価水準
* {{< katex >}}Y_t{{< /katex >}}: 実質GDP

を表します．

ここで，{{< katex >}}Y_t=\bar{Y}_t,V_t=\bar{V},M_t=\bar{M}_t{{< /katex >}} は所与としてよいと考えられるので，

{{< katex display=true >}}
  P_t^*=\frac{\bar{M}_t\bar{V}}{\bar{Y}_t}
{{< /katex >}}

と表せます．

{{< katex >}}\bar{g}_M+\bar{g}_V=\bar{g}_P+\bar{g}_Y{{< /katex >}} としたとき，流通速度一定とすると {{< katex >}}\bar{g}_V=0{{< /katex >}} となります．

インフレ率を {{< katex >}}\pi{{< /katex >}} で表すことが多いので，{{< katex >}}\bar{g}_P{{< /katex >}}（物価水準の変化率＝インフレ率）を {{< katex >}}\pi{{< /katex >}} で表すと，
{{< katex display=true >}}
  \pi=\bar{g}_M-\bar{g}_Y
{{< /katex >}}
と書けます．

また，{{< katex >}}\text{名目GDP}=\text{価格水準}\times\text{実質GDP}{{< /katex >}} より，
{{< katex display=true >}}
\text{名目利子率}=\text{実質利子率}+\text{インフレ率}
{{< /katex >}}
となり，次の記号で表されます．
{{< katex display=true >}}
i=R+\pi.
{{< /katex >}}

## まとめ

本ページでは，作成者が『ジョーンズ マクロ経済学Ⅰ 長期成長編』[[1]](#cite:1) を初読した際のメモをまとめました．

本文中にもあるように，マクロ経済学は数式のみから議論・検討を行う学問ではありませんので，本ページの内容だけでは，概観を掴むためにも不十分と思いますが，マクロ経済学がどのようなモデルで経済を解釈・分析しようとしているかはわかるかもしれません．

## 参考文献

{{< anchor "cite:1" >}}[1] チャールズ I.ジョーンズ（宮川努，荒井信幸，大久保正勝，釣雅雄，徳井丞次，細谷圭：訳），ジョーンズ マクロ経済学Ⅰ長期成長編，東洋経済新報社，2011.

