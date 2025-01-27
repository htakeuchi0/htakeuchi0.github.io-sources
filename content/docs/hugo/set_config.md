---
title: "ページの追加とサイトの設定"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# ページの追加とサイトの設定

## 概要

本ページでは，Hugo による Web サイト作成における，ページの追加とサイトの設定に関する部分を説明します．    

## ホームページの作成

まずは，サイト全体のホームページ（トップページ）を作成します．    
以下のコマンドを実行すると，ホームページが作成されます．

```shell
$ hugo new _index.md
```

`content/_index.md` が生成されているので，それを以下のように書き換えます．    
タイトルと適当な小見出しを作成しており，メニューからリンクを張るため，免責事項とプライバシーポリシーは，別名でアンカーを作成しています．

```md
---
title: "ホームページ"
date: 2022-08-11T12:18:39+09:00
draft: true
---

# htakeuchi0 のノート

## 概要

## 免責事項 {#disclaimer}

## プライバシーポリシー {#privacy_policy}

## 作者について

## お問い合わせ
```

次に，設定ファイル `confing.toml` を以下のようにします．    

```toml
baseURL = 'https://htakeuchi0.github.io/'
languageCode = 'ja-jp'
title = 'htakeuchi0 のノート'
theme = 'hugo-book'
enableGitInfo = true

[params]
  BookTheme = 'auto'
  BookRepo = 'https://github.com/htakeuchi0/htakeuchi0.github.io-sources'
  BookSearch = false

[menu]
  [[menu.after]]
    identifier = "disclaimer"
    name = "免責事項"
    title = "免責事項"
    url = "/#disclaimer"
    weight = 1

  [[menu.after]]
    identifier = "privacy_policy"
    name = "プライバシーポリシー"
    title = "プライバシーポリシー"
    url = "/#privacy_policy"
    weight = 2
```

主に以下のような設定をしています．    
なお，これら設定は Book テーマの場合になります．
* 背景の light/dark を自動で切り替えるよう `[parmas] BookTheme = 'auto'` を設定．
* 最終更新日と Github へのリンク先の設定のため，`[parmas] BookRepo` を設定．
* 検索窓が日本語を受け付けていなさそうなので，`[parmas] BookSearch = false` を設定．
* メニューの末尾に，免責事項とプライバシーポリシーへのリンクを設定．

## クリエイティブ・コモンズ・ライセンスの表示

本サイトの各ページは，断らない限り CC BY 4.0 で公開します．     
そこで [[1]](#cite:1) を参考に，以下の内容のファイルを `layouts/partials/docs/inject/content-after.html` として作成しています．    
テーマ側のファイルを書き換えないようにしています．

```html
<hr>

<p xmlns:cc="http://creativecommons.org/ns#" >This work is licensed under <a href="https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""></a></p>
```

Book テーマでは，`layouts/partials/docs/inject/footer.html` に上記を記載すると，画像がつぶれてしまう[^1]ので，コンテンツの最後につけるようにしています．

[^1]:正方形になってしまいました．

## ページ内リンク

任意の場所にページ内リンクができるよう，[[2]](#cite:2) を参考に，空の `a` タグがおけるようなショートコードを追加します．

以下の内容の `layouts/shortcodes/anchor.html` というファイルを作成します．

```html
<a id="{{ .Get 0 }}"></a>
```

## Google アナリティクスのトラッキングIDの追加

Google アナリティクスが有効になるよう，トラッキングIDを追加します．    
[[3]](#cite:3) の通り，`config.toml` に以下のように追加するだけです[^2]．    
[^2]:追加する場所は，`[params]` の外側（例えば，それより前）です．

```toml
googleAnalytics = 'G-MEASUREMENT_ID'
```

Google Analytics v4 を使用していますが，公式ページ [[3]](#cite:3) にもあるように，Hugo は対応済みなので，計測用IDをここに設定するだけで動作しているようです．    
少なくともBookテーマでは問題なさそうです．

なお，[[4]](#cite:4) にあるとおり，Google アナリティクスを使用する場合は，プライバシーポリシーを公開し，適切な記述をおくなど，利用規約に従った対応が必要です．

## ページの追加

その他ページの追加は，ホームページ作成と同様，以下のようなコマンドを実行すればできます．

```shell
$ hugo new docs/cpp/_index.md
$ hugo new docs/cpp/fp.md
```

それぞれ，`content/docs/cpp/_index.md`, `content/docs/cpp/fp.md` が生成されます．    
Bookテーマの方針に従い，`docs` ディレクトリ以下に記事をおいていきます．    

ここで，`docs/<section>/_index.md` を作成すると，`<section>` 節が作成され，`docs/<section>/<page>.md` を作成すると，`<section>` 節に `<page>` ページが作成できます．    

上記コマンド例では，**"cpp" 節をつくり，そこに "fp.md" というページを追加したことになります．**    

本サイトではこの仕組みを，いくつかのページをグループ化したいときに利用しています．

## まとめ

本ページでは，ページの追加とサイトの設定に関する部分を説明しました．

## 参考文献

{{< anchor "cite:1" >}}[1] Creative Commons, "Choose a Lincense", https://creativecommons.org/choose/results-one?license_code=by-nd&amp;jurisdiction=&amp;version=4.0&amp;lang=j://creativecommons.org/choose/results-one?license_code=by-nd&amp;jurisdiction=&amp;version=4.0&amp;lang=ja, 2022/8/12 最終アクセス．    
{{< anchor "cite:2" >}}[2] まくまくHugoノート，"ページ内リンク（アンカー）を張る - まくまくHugoノート", https://maku77.github.io/hugo/advanced/internal-link.html, 2022/8/12 最終アクセス．    
{{< anchor "cite:3" >}}[3] Hugo, "Internal Templates | Hugo", https://gohugo.io/templates/internal/#configure-google-analytics, 2022/8/12 最終アクセス．    
{{< anchor "cite:4" >}}[4] Google, "Terms of Service | Google Analytics – Google", https://marketingplatform.google.com/about/analytics/terms/jp/, 2022/8/12 最終アクセス．    
