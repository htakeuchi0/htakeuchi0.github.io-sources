---
title: "Book テーマの hint ショートコードブロック内に数式を表示する際の注意"
weight: 5
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# Book テーマの hint ショートコードブロック内に数式を表示する際の注意

## 概要

Book テーマ [[1]](#cite:1) では，{{< katex >}}\KaTeX{{< /katex >}}を使うための `katex` ショートコードが用意されています [[2]](#cite:2)．
また，目立たせたい情報を文書ブロックとして表示できる，`hint` ショートコードが用意されています [[3]](#cite:3)．

しかし，`hint` ショートコードブロックの中で `katex` ショートコードを使う場合，うまく数式が表示できないことがあります．
本ページでは，`hint` ショートコードブロック内で数式を表示する場合の注意について説明します．

## `hint` ショートコードの使いかた

公式の説明 [[3]](#cite:3) をもとに，markdown での記述例と，出力結果を説明します．`hint` ショートコードは第1引数によって，背景色を変えることができます．

### 第1引数：なし

markdown の記述例は以下のとおりです．

```md
{{%/* hint */%}}
ヒント．
{{%/* /hint */%}}
```

出力結果は以下のとおりです．

{{% hint %}}
ヒント．
{{% /hint %}}

### 第1引数：info

markdown の記述例は以下のとおりです．

```md
{{%/* hint info */%}}
ヒント．
{{%/* /hint */%}}
```

出力結果は以下のとおりです．

{{% hint info %}}
ヒント．
{{% /hint %}}

### 第1引数：warning

markdown の記述例は以下のとおりです．

```md
{{%/* hint warning */%}}
ヒント．
{{%/* /hint */%}}
```

出力結果は以下のとおりです．

{{% hint warning %}}
ヒント．
{{% /hint %}}

### 第1引数：danger

markdown の記述例は以下のとおりです．

```md
{{%/* hint danger */%}}
ヒント．
{{%/* /hint */%}}
```

出力結果は以下のとおりです．

{{% hint danger %}}
ヒント．
{{% /hint %}}

## `katex` ショートコード

公式の説明 [[2]](#cite:2) をもとに，markdown での記述例と，出力結果を説明します．`katex` ショートコードは第1引数によって，インライン数式か別行立て数式かを指定できます．

### 第1引数：なし

markdown の記述例は以下のとおりです．

```md
{{</* katex */>}}\int_{-\infty}^{\infty}e^{-t^2}dt=\pi.{{</* /katex */>}}
```

出力例は以下のとおりです：{{< katex >}}\int_{-\infty}^{\infty}e^{-t^2}dt=\pi.{{< /katex >}}

### 第1引数：display

markdown の記述例は以下のとおりです．

```md
{{</* katex display=true */>}}
  \int_{-\infty}^{\infty}e^{-t^2}dt=\pi.
{{</* /katex */>}}
```

出力例は以下のとおりです．

{{< katex display=true >}}
  \int_{-\infty}^{\infty}e^{-t^2}dt=\pi.
{{< /katex >}}

## `hint` ショートコードブロック内の数式表示

### 設定の変更

[独自ショートコードの定義]({{< ref shortcode.md >}}) でも述べたとおり，Hugo で現在利用されている markdown パーサは HTML 形式の直接記述をデフォルトでは認めていません．この仕様により，デフォルトのままでは，`hint` ショートコードブロック内に数式がうまく表示されません．

そこで，[独自ショートコードの定義 の 設定の変更]({{< ref shortcode.md >}}#change_config) でも述べたとおり，`config.toml` に以下を追加する必要があります．

```toml
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```

### 別行立て数式

別行立て数式は表示できます．例えば，以下のように書くと：

```md
{{%/* hint info */%}}
以下の式が成り立つ．
{{</* katex display=true */>}}
  \int_{-\infty}^{\infty}e^{-t^2}dt=\pi.
{{</* /katex */>}}
{{%/* /hint */%}}
```

以下のように出力されます：

{{% hint info %}}
以下の式が成り立つ．
{{< katex display=true >}}
  \int_{-\infty}^{\infty}e^{-t^2}dt=\pi.
{{< /katex >}}
{{% /hint %}}

### インライン数式

インライン数式は表示できないようです．例えば，以下のように書くと：

```md
{{%/* hint danger */%}}
次の式が成り立つ．{{</* katex */>}}\int_{-\infty}^{\infty}e^{-t^2}dt=\pi.{{</* /katex */>}}
{{%/* /hint */%}}
```

以下のように出力されます：

{{% hint danger %}}
次の式が成り立つ．{{< katex >}}\int_{-\infty}^{\infty}e^{-t^2}dt=\pi.{{< /katex >}}
{{% /hint %}}

行内に表示したい場合は，`{{</* katex */>}}...{{</* /katex */>}}` の代わりに `\\(...\\)` で数式をくくればうまくいきます．例えば，以下のように書くと：


```md
{{%/* hint info */%}}
次の式が成り立つ．\\(\int_{-\infty}^{\infty}e^{-t^2}dt=\pi\\).
{{%/* /hint */%}}
```

以下のように出力されます：

{{% hint info %}}
次の式が成り立つ．\\(\int_{-\infty}^{\infty}e^{-t^2}dt=\pi\\).
{{% /hint %}}

したがって，**`hint` ショートコード内にインライン数式を書く場合は，`\\(...\\)` を用いて数式をくくればよいです**．

## うまく表示されない場合

いくつかうまく表示されない場合があるので，その例と対処法について説明します．

### ブレース (`{`, `}`) を使う場合

例えば，以下のように書くと：

```md
{{%/* hint info */%}}
\\(\mathbb{R}_{\ge0}=\{x\in\mathbb{R}\mid x\ge0\}\\) とする．
{{%/* /hint */%}}
```

以下のように出力されます：

{{% hint danger %}}
\\(\mathbb{R}_{\ge0}=\{x\in\mathbb{R}\mid x\ge0\}\\) とする．
{{% /hint %}}

つまり，**ブレース (`{`, `}`) が表示されません**．

この場合は，`\{` でなく `\\{` とすれば表示されます．

```md
{{%/* hint info */%}}
\\(\mathbb{R}_{\ge0}=\\{x\in\mathbb{R}\mid x\ge0\\}\\) とする．
{{%/* /hint */%}}
```

{{% hint info %}}
\\(\mathbb{R}_{\ge0}=\\{x\in\mathbb{R}\mid x\ge0\\}\\) とする．
{{% /hint %}}

### 下付き文字を使う場合

常にではありませんが，下付き文字を使う場合で，以下のように正しく表示されない場合があります．

```md
{{%/* hint info */%}}
\\(\bm{X}_{11}\\) および \\(\bm{X}_{12}\\) を以下のように定める．
{{%/* /hint */%}}
```

{{% hint danger %}}
\\(\bm{X}_{11}\\) および \\(\bm{X}_{12}\\) を以下のように定める．
{{% /hint %}}

この場合は，`_` を `\_` に置き換えると表示されるようになります．すべて変更しなくてもよいようです．

```md
{{%/* hint info */%}}
\\(\bm{X}_{11}\\) および \\(\bm{X}\_{12}\\) を以下のように定める．
{{%/* /hint */%}}
```

{{% hint info %}}
\\(\bm{X}_{11}\\) および \\(\bm{X}\_{12}\\) を以下のように定める．

{{% /hint %}}

## まとめ

本ページでは，`hint` ショートコードブロック内で数式を表示する場合の注意について説明しました．

まとめると，以下のとおりです．

{{% hint info %}}
**`hint` ショートコードブロック内に数式を表示する際の注意**
1. 別行立て数式の場合: `display=true` 引数付き `katex` ショートコードをおけばよいです．
2. インライン数式の場合: **`\\(...\\)` を用いて** 数式をくくればよいです．
{{% /hint %}}

## 参考文献
{{< anchor "cite:1" >}}[1] `@alex-shpak`, "GitHub - alex-shpak/hugo-book: Hugo documentation theme as simple as plain book", https://github.com/alex-shpak/hugo-book, 2022/8/7 最終アクセス．   
{{< anchor "cite:2" >}}[2] Hugo, "Katex | Hugo Book", https://hugo-pagedjs-book.netlify.app/docs/shortcodes/katex/, 2022/8/20 最終アクセス．    
{{< anchor "cite:3" >}}[3] Hugo, "Hints | Hugo Book", https://hugo-book-demo.netlify.app/docs/shortcodes/hints/, 2022/8/20 最終アクセス． 
