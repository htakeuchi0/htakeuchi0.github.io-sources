---
title: "指数関数の定積分"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 指数関数の定積分

## 概要

本ページでは，指数関数に関するいくつかの定積分の求め方と結果を説明します．
指数関数 {{< katex >}}\exp:\mathbb{R}\to\mathbb{R}{{< /katex >}}とは，
{{< katex display >}}
\exp(x)=\sum_{k=0}^n\frac{x^k}{k!}
{{< /katex >}}
で定められる関数であり，{{< katex >}}\exp'(x)=\exp(x){{< /katex >}}が成り立つことが知られています．

本ページでは，以下の定積分の求め方と結果をまとめます．
1. {{< katex >}}\int_{\alpha}^{\beta}\exp(x)dx{{< /katex >}}
2. {{< katex >}}\int_{\alpha}^{\beta}\exp(ax+b)dx{{< /katex >}}
3. {{< katex >}}\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\quad(a<0){{< /katex >}}

ただし，以下の関数を既知とします．この関数は，**相補誤差関数**と呼ばれ，たとえば C++ の標準ライブラリで `std::erfc` として定義されています．
{{< katex display >}}
\mathrm{erfc}(x)=\frac{2}{\sqrt{\pi}}\int_x^{\infty}e^{-t^2}dt
{{< /katex >}}

## 定積分1

まず，{{< katex >}}\int_{\alpha}^{\beta}\exp(x)dx{{< /katex >}} を計算します．
これは，{{< katex >}}\exp'(x)=\exp(x){{< /katex >}}なので，
{{< katex display >}}
\int_{\alpha}^{\beta}\exp(x)dx=\exp(\beta)-\exp(\alpha)
{{< /katex >}}
です．

## 定積分2

次に，{{< katex >}}\int_{\alpha}^{\beta}\exp(ax+b)dx{{< /katex >}} を計算します．
いま，{{< katex >}}y=ax+b{{< /katex >}}とすると，
* {{< katex >}}x=(y-b)/a{{< /katex >}},
* {{< katex >}}y=a\alpha+b{{< /katex >}} ならば {{< katex >}}x=\alpha{{< /katex >}},
* {{< katex >}}y=a\beta+b{{< /katex >}} ならば {{< katex >}}x=\beta{{< /katex >}}

です．
{{< katex >}}dx/dy=1/a{{< /katex >}}なので，

{{< katex display >}}
\begin{aligned}
&\int_{\alpha}^{\beta}\exp(ax+b)dx\\
&=\int_{a\alpha+b}^{a\beta+b}\exp(y)\frac{dx}{dy}dy\\
&=\frac{1}{a}\int_{a\alpha+b}^{a\beta+b}\exp(y)dy\\
&=\frac{1}{a}(\exp(a\beta+b)-\exp(a\alpha+b))
\end{aligned}
{{< /katex >}}
となります．
ただし，最後の等号は定積分1を使いました．

## 定積分3

最後に{{< katex >}}\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\ (a<0){{< /katex >}} を計算します．
{{< katex >}}a\not=0{{< /katex >}} より，
{{< katex display >}}
ax^2+bx+c=a\left(x+\frac{b}{2a}\right)^2-\frac{b^2-4ac}{4a}
{{< /katex >}}
です．
よって，
{{< katex display >}}
\begin{aligned}
&\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\\
&=\int_{\alpha}^\beta\exp\left(a\left(x+\frac{b}{2a}\right)^2-\frac{b^2-4ac}{4a}\right)dx\\
&=\exp\left(-\frac{b^2-4ac}{4a}\right)\int_{\alpha}^\beta\exp\left(a\left(x+\frac{b}{2a}\right)^2\right)dx
\end{aligned}
{{< /katex >}}

いま，{{< katex >}}y=x+b/(2a){{< /katex >}}とすると，
* {{< katex >}}x=y-b/(2a){{< /katex >}},
* {{< katex >}}y=\alpha+b/(2a){{< /katex >}} ならば {{< katex >}}x=\alpha{{< /katex >}},
* {{< katex >}}y=\beta+b/(2a){{< /katex >}} ならば {{< katex >}}x=\beta{{< /katex >}}

です．
{{< katex >}}dx/dy=1{{< /katex >}} なので，
{{< katex display >}}
\begin{aligned}
&\int_{\alpha}^\beta\exp\left(a\left(x+\frac{b}{2a}\right)^2\right)dx\\
&=\int_{\alpha+b/(2a)}^{\beta+b/(2a)}\exp(ay^2)\frac{dx}{dy}dy\\
&=\int_{\alpha+b/(2a)}^{\beta+b/(2a)}\exp(ay^2)dy\\
\end{aligned}
{{< /katex >}}
ですが，{{< katex >}}a<0{{< /katex >}}より，{{< katex >}}a=-(\sqrt{-a})^2{{< /katex >}}なので，
{{< katex display >}}
\begin{aligned}
&\int_{\alpha+b/(2a)}^{\beta+b/(2a)}\exp(ay^2)dy\\
&=\int_{\alpha+b/(2a)}^{\beta+b/(2a)}\exp(-(\sqrt{-a}\,y)^2)dy
\end{aligned}
{{< /katex >}}
となります．

ここで，{{< katex >}}s=\sqrt{-a}\,y{{< /katex >}}とすると，
* {{< katex >}}y=s/\sqrt{-a}{{< /katex >}},
* {{< katex >}}s=\sqrt{-a}(\alpha+b/(2a)){{< /katex >}} ならば {{< katex >}}y=\alpha+b/(2a){{< /katex >}},
* {{< katex >}}s=\sqrt{-a}(\beta+b/(2a)){{< /katex >}} ならば {{< katex >}}y=\beta+b/(2a){{< /katex >}}

です．{{< katex >}}dy/ds=1/\sqrt{-a}{{< /katex >}} なので，
{{< katex display >}}
\begin{aligned}
&\int_{\alpha+b/(2a)}^{\beta+b/(2a)}\exp(-(\sqrt{-a}\,y)^2)dy\\
&=\int_{\sqrt{-a}(\alpha+b/(2a))}^{\sqrt{-a}(\beta+b/(2a))}\exp(-s^2)\frac{dy}{ds}ds\\
&=\frac{1}{\sqrt{-a}}\left(\int_{\sqrt{-a}(\alpha+b/(2a))}^{\infty}-\int_{\sqrt{-a}(\beta+b/(2a))}^{\infty}\right)\exp(-s^2)ds\\
&=\frac{\sqrt{\pi}}{2\sqrt{-a}}\left(\mathrm{erfc}\left(\sqrt{-a}\left(\alpha+\frac{b}{2a}\right)\right)-\mathrm{erfc}\left(\sqrt{-a}\left(\beta+\frac{b}{2a}\right)\right)\right)
\end{aligned}
{{< /katex >}}
となります．

したがって，
{{< katex display >}}
\begin{aligned}
&\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\\
&=\frac{\sqrt{\pi}}{2\sqrt{-a}}\exp\left(-\frac{b^2-4ac}{4a}\right)\\
&\quad\times\left(\mathrm{erfc}\left(\sqrt{-a}\left(\alpha+\frac{b}{2a}\right)\right)-\mathrm{erfc}\left(\sqrt{-a}\left(\beta+\frac{b}{2a}\right)\right)\right)
\end{aligned}
{{< /katex >}}
となります．

## まとめ

本ページでは，指数関数に関する以下の定積分を計算しました．
1. {{< katex >}}\int_{\alpha}^{\beta}\exp(x)dx{{< /katex >}}
2. {{< katex >}}\int_{\alpha}^{\beta}\exp(ax+b)dx{{< /katex >}}
3. {{< katex >}}\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\quad(a<0){{< /katex >}}

結果はそれぞれ以下のとおりです．

{{< katex display >}}
\begin{aligned}
&\int_{\alpha}^{\beta}\exp(x)dx=\exp(\beta)-\exp(\alpha),\\
&\int_{\alpha}^{\beta}\exp(ax+b)dx\\
&=\frac{1}{a}(\exp(a\beta+b)-\exp(a\alpha+b)),\\
&\int_{\alpha}^{\beta}\exp(ax^2+bx+c)dx\\
&=\frac{\sqrt{\pi}}{2\sqrt{-a}}\exp\left(-\frac{b^2-4ac}{4a}\right)\\
&\quad\times\left(\mathrm{erfc}\left(\sqrt{-a}\left(\alpha+\frac{b}{2a}\right)\right)-\mathrm{erfc}\left(\sqrt{-a}\left(\beta+\frac{b}{2a}\right)\right)\right).
\end{aligned}
{{< /katex >}}
