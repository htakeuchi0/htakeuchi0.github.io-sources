---
title: "独自ショートコードの定義"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 独自ショートコードの定義

## 概要

Hugo には，ショートコードと呼ばれるスニペットを定義・利用できる機能があります [[1]](#cite:1)．本ページでは，ショートコードの一例として，`theorem-label` という，{{< katex >}}\LaTeX{{< /katex >}}でいう定理環境のラベル部分を生成する独自ショートコードを定義する方法について説明します．なお一般に，スニペットとは，再利用可能なソースコード断片を指す言葉です．

## `theorem-label` ショートコード

Hugo は markdown で記事を作成できますが，markdown の簡潔に記述できる利点を損なわないよう，ショートコードと呼ばれるスニペットを定義し，利用できる機能があります．

ここでは，定理環境のラベルを生成する簡単なショートコードを作成します．ここで，定理環境とは，{{< katex >}}\LaTeX{{< /katex >}}でいう定理環境のような，定理や定義を示すための文章ブロックを指すものとし，そのラベルとは "Theorem 2.3" のような文章ブロックの冒頭に書かれるラベルを指すものとします．

`theorem-label` ショートコードは以下の要件を満たすものとします．

* "**Theorem 1**." のように，定理種類名称と定理番号を太字で表示できて，ピリオドで終わること
* 定理種類名称はユーザが指定できること
* 定理番号はページごとに，定理種類名称によらず，1からはじまる連番で自動生成されること
* 定理番号の前に節番号などの接頭辞を任意でつけられること
* 定理番号の後に括弧付きコメントを任意でつけられること

そこで，`theorem-label` ショートコードは以下のように呼び出せるものとします．


|項番|呼び出し方|結果|
|----|----|----|
|1|`{{</* theorem-label name="Theorem" */>}}`|**Theorem 1**.|
|2|`{{</* theorem-label name="Theorem" section="5.2" */>}}`|**Theorem 5.2.2**.|
|3|`{{</* theorem-label name="Proposition" section="3" comment="補足" */>}}`|**Theorem 3.3** (補足).|

実装例は以下のとおりです．下記ファイルを `layout/shortcodes/theorem-label.html` として保存します．

```html
<!-- カウンタの初期化-->
{{- if not (.Page.Scratch.Get "theorem_num") }}
  {{- .Page.Scratch.Set "theorem_num" 1 -}}
{{- end -}}
<!-- 定理種類 (name), 節番号 (section) の表示 -->
<b>{{- .Get "name" }} {{ with .Get "section" -}}
  {{- . -}}.
{{- end -}}
<!-- 定理番号 (theorem_num), コメント (comment) の表示 -->
{{- .Page.Scratch.Get "theorem_num" }}</b>{{- with .Get "comment" }} ({{- . -}}){{- end -}}.
<!-- 定理番号 (theorem_num) のカウントアップ -->
{{- .Page.Scratch.Add "theorem_num" 1 -}}
```

そのようにしておくと，本文内では以下のように呼び出せます．

```md
{{</* hint info */>}}
{{</* theorem-label name="Theorem" */>}} 定理の例．
{{</* /hint */>}}

{{</* hint info */>}}
{{</* theorem-label name="Proposition" */>}} 命題の例．
{{</* /hint */>}}
```

結果は以下のとおりです．定理番号が自動で連番で発行されることがわかります．

{{< hint info >}}
{{< theorem-label name="Theorem" >}} 定理の例．
{{< /hint >}}

{{< hint info >}}
{{< theorem-label name="Proposition" >}} 命題の例．
{{< /hint >}}

## まとめ

本ページでは，ショートコードの利用例として，定理環境のラベルを生成するための `theorem-label` ショートコードを定義する方法を説明しました．

上記呼び出し例を，

```md
{{</* theorem name="Theorem" */>}}
  定理の例．
{{</* /theorem */>}}

{{</* theorem name="Proposition" */>}}
  命題の例．
{{</* /theorem */>}}
```

のように簡潔に書ける `theorem` 環境の定義は今後の課題とします．

## 参考資料

{{< anchor "cite:1" >}}[1] Hugo "Shortcodes | Hugo", https://gohugo.io/content-management/shortcodes/, 2022/8/18 最終アクセス．
