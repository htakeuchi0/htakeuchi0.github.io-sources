---
title: "公開用ファイルの生成"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 公開用ファイルの生成

## 概要

本ページでは，Hugo で作成した markdown ファイルを公開用の html ファイルにビルドして，公開する方法について説明します．

## htmlファイルの生成

以下のコマンドを実行すると，`public` ディレクトリ以下に公開用ファイル一式が生成されます．

```shell
$ hugo --minify -D
```

## ページの公開

本サイトは，Github Pages [[1]](#cite:1) を利用してページを公開しています．    
作者は，作成用ファイルと公開ファイルを **別リポジトリで管理しています**．

* htakeuchi0.github.io リポジトリ：公開用
* htakeuchi0.github.io-sources リポジトリ：作成用

Hugo では [[2]](#cite:2) のように，同一リポジトリで別ブランチで管理する方法が説明されています．

本サイトの管理方法の場合，`htakeuchi0.github.io-sources` リポジトリ側で `public` 以下に生成されたファイルすべてを，`htakeuchi0.github.io` リポジトリに配置します．

あとは，[[1]](#cite:1) のとおりに設定すれば，数分でブラウザからアクセスできるようになります．

## Google Search Console の設定

Hugo では（少なくとも Book テーマでは），サイトマップ用の `sitemap.xml` とRSS用の `index.xml` が生成されているので，それぞれを Google Search Console [[3]](#cite:3) に登録するだけです．

## まとめ

本ページでは，公開ファイルを生成して，公開する方法について説明しました．

## 参考文献

{{< anchor "cite:1" >}}[1] Github, "About GitHub Pages - GitHub Docs", https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages, 2022/8/12 最終アクセス．    
{{< anchor "cite:2" >}}[2] Hugo, "Host on GitHub | Hugo", https://gohugo.io/hosting-and-deployment/hosting-on-github/, 2022/8/12 最終アクセス．    
{{< anchor "cite:3" >}}[3] Google, "Google Search Console へようこそ", https://search.google.com/search-console/welcome?hl=JA, 2022/8/12最終アクセス．

