---
title: "指数関数の定積分：正規分布の累積分布関数の計算への応用"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 指数関数の定積分：正規分布の累積分布関数の計算への応用

## 概要

[指数関数の定積分]({{< ref "/docs/math/exp.md" >}}) のページでは，指数関数に関するいくつかの定積分の表示について説明しました．本ページでは，その応用として，正規分布の累積分布関数の計算への応用について説明します．

例えば，C++17 では，標準ライブラリに `std::erfc` 関数（相補誤差関数）がありますが，正規分布の累積分布関数を直接計算する関数は提供されていません．

しかし，相補誤差関数と正規分布の累積分布関数はスケールが異なるだけなので，`std::erfc` 関数があれば，正規分布の累積分布関数は計算できます．

そこで，本ページでは，[指数関数の定積分]({{< ref "/docs/math/exp.md" >}}) の結果を用いて，相補誤差関数と正規分布の累積分布関数の具体的な関係式を導出します．

## 正規分布

**正規分布** とは，連続型確率変数のしたがう確率分布のひとつで，様々な場面で用いられます．

平均 {{< katex >}}\mu{{< /katex >}}, 分散 {{< katex >}}\sigma^2{{< /katex >}} の正規分布の **確率密度関数** は，
{{< katex display=true >}}
f_X(x)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
{{< /katex >}}
と表されます．
ここで，
{{< katex display=true >}}
F_X(x)=\int_{-\infty}^xf_X(x)dx
{{< /katex >}}
とおくと，{{< katex >}}F_X(x){{< /katex >}} は，正規分布に従う確率変数 {{< katex >}}X{{< /katex >}} が {{< katex >}}x{{< /katex >}} 以下である確率を表します．
一般に，確率密度関数 {{< katex >}}f_X{{< /katex >}}を用いて上記の {{< katex >}}F_X{{< /katex >}} のように定義される関数を **累積分布関数** と呼びます．

## 正規分布の累積分布関数と誤差関数

いま，
{{< katex display=true >}}
-\frac{(x-\mu)^2}{2\sigma^2}=-\frac{1}{2\sigma^2}x^2+\frac{\mu}{\sigma^2}x-\frac{\mu^2}{2\sigma^2}
{{< /katex >}}
なので，
{{< katex display=true >}}
\begin{aligned}
  &a=-\frac{1}{2\sigma^2},\\
  &b=\frac{\mu}{\sigma^2},\\
  &c=-\frac{\mu^2}{2\sigma^2}
\end{aligned}
{{< /katex >}}
として，[指数関数の定積分の定積分3]({{< ref "/docs/math/exp.md#定積分3" >}})を適用すると，
{{< katex display=true >}}
\begin{aligned}
&\frac{\sqrt{\pi}}{2\sqrt{-a}}=\frac{\sqrt{\pi}}{2\sqrt{1/(2\sigma^2)}}
=\frac{\sqrt{\pi}\sqrt{\sigma^2}}{\sqrt{2}},\\
&\frac{b^2-4ac}{4a}=\frac{b^2}{4a}-c=\frac{\mu^2/\sigma^4}{-2/\sigma^2}-\left(-\frac{\mu^2}{2\sigma^2}\right)=0\\
&\frac{b}{2a}
=\frac{\mu/\sigma^2}{-1/\sigma^2}
=-\mu
\end{aligned}
{{< /katex >}}
より，
{{< katex display=true >}}
\begin{aligned}
&\int_{\alpha}^{\beta}\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)dx\\
&=\frac{\sqrt{\pi}\sqrt{\sigma^2}}{\sqrt{2}}\\
&\quad\times\left(\mathrm{erfc}\left(\frac{1}{\sqrt{2\sigma^2}}(\alpha-\mu)\right)-\mathrm{erfc}\left(\frac{1}{\sqrt{2\sigma^2}}(\beta-\mu)\right)\right)
\end{aligned}
{{< /katex >}}
となります．特に，{{< katex >}}\beta=x{{< /katex >}}, {{< katex >}}\alpha\to-\infty{{< /katex >}} のとき，
{{< katex display=true >}}
\begin{aligned}
&\int_{-\infty}^x\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)dx\\
&=\frac{\sqrt{\pi}\sqrt{\sigma^2}}{\sqrt{2}}\left(2-\mathrm{erfc}\left(\frac{1}{\sqrt{2\sigma^2}}(x-\mu)\right)\right)
\end{aligned}
{{< /katex >}}
です．

ところで，
{{< katex display=true >}}
\begin{aligned}
&2-\mathrm{erfc}(z)\\
&=\frac{2}{\sqrt{\pi}}\left(\int_{-\infty}^{\infty}-\int_z^{\infty}\right)\exp(-t^2)dt\\
&=\frac{2}{\sqrt{\pi}}\int_{-\infty}^{z}\exp(-t^2)dt\\
&=\frac{2}{\sqrt{\pi}}\int_{-z}^{\infty}\exp(-t^2)dt\\
&=\mathrm{erfc}(-z)
\end{aligned}
{{< /katex >}}
なので，
{{< katex display=true >}}
\begin{aligned}
&\int_{-\infty}^x\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)dx\\
&=\frac{\sqrt{\pi}\sqrt{\sigma^2}}{\sqrt{2}}\mathrm{erfc}\left(-\frac{1}{\sqrt{2\sigma^2}}(x-\mu)\right)
\end{aligned}
{{< /katex >}}
より，
{{< katex display=true >}}
\begin{aligned}
&F_X(x)\\
&=\frac{1}{\sqrt{2\pi\sigma^2}}\int_{-\infty}^x\exp\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)dx\\
&=\frac{1}{2}\mathrm{erfc}\left(-\frac{1}{\sqrt{2\sigma^2}}(x-\mu)\right)
\end{aligned}
{{< /katex >}}
と表せます．

## まとめ

本ページでは，正規分布の累積分布関数と相補誤差関数の関係式を求めました．結果は，以下のとおりです．

{{% hint info %}} {{< theorem-label name="Proposition" >}} \\(X\\) を平均 \\(\mu\\), 分散 \\(\sigma^2\\) の正規分布に従う確率変数とする．\\(F_X\\) を \\(X\\) の累積分布関数，\\(\mathrm{erfc}(x)=(2/\sqrt{\pi})\int_x^{\infty}\exp(-t^2)dt\\) とする．このとき，以下の式が成り立つ．

{{< katex display=true >}}
F_X(x)=\frac{1}{2}\mathrm{erfc}\left(-\frac{1}{\sqrt{2\sigma^2}}(x-\mu)\right).
{{< /katex >}}

{{% /hint %}}
