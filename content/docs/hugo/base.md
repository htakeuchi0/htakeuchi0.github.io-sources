---
title: "空のサイトの生成"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 空のサイトの生成

## 概要

本ページでは，Hugo による Web サイト作成の最初のステップについて説明します．    
具体的には，ローカルに空のサイトが生成できるところまで説明します．

## インストール

[Hugo の Quick Start](https://gohugo.io/getting-started/quick-start/) に従い，Hugo をインストールします．

作者の作成環境は Linux OS 64bit (Ubuntu 18.04.6 LTS) なので，[Hugo のインストールページ](https://gohugo.io/getting-started/installing) を参考に，以下のコマンドを実行します．

```shell
$ snap install hugo --channel=extended
```

デスクトップ環境なので，認証のためのダイアログが表示され，パスワードを入力して認証をクリックしました．

以下のコマンドでインストールが成功したかを確認できます．

```shell
$ hugo version
hugo v0.101.0-9f74196ce611cdf6d355bfb99fd8eba5c68ef7f8+extended linux/amd64 BuildDate=2022-06-28T10:02:18Z VendorInfo=snap
```

## サイトの生成

以下のコマンドを実行します．

```shell
$ hugo new site htakeuchi0-notebook
```

## テーマの追加

本サイトでは，[Book](https://themes.gohugo.io/themes/hugo-book/) テーマを利用しています．
当該テーマの README にしたがって，以下のコマンドを実行します．    

```shell
$ cd htakeuchi0-notebook
$ git init
$ git branch -M main
$ git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book
```

つまり，テーマはサブモジュールとして取り込むこととして，ついでにブランチ名を `main` に変更しておきます．

次に，設定ファイル (`config.toml`) にテーマ設定を追加します．

```shell
$ echo theme = \"hugo-book\" >> config.toml
```

## ソース管理用 Github リポジトリへ追加

本サイトでは，コンテンツファイルを `htakeuchi0.github.io-sources` リポジトリで管理します．
空の当該リポジトリを作成しておき，以下のコマンドを実行します．

```shell
$ mv ../README.md .
$ git add README.md
$ touch content/.gitkeep data/.gitkeep layouts/.gitkeep public/.gitkeep static/.gitkeep
$ git add *
$ git commit -a -m "first commit"
$ git remote add origin git@github.com:htakeuchi0/htakeuchi0.github.io-sources.git
$ git push -u origin main
```

## 動作確認

Webサーバモードで `hugo` コマンドを実行し，空のサイトが生成できることを確認します．
今回の場合は，表示されているとおり `http://localhost:1313/` にアクセスすれば確認できます．

```shell
$ hugo server --minify -D
Start building sites … 
hugo v0.101.0-9f74196ce611cdf6d355bfb99fd8eba5c68ef7f8+extended linux/amd64 BuildDate=2022-06-28T10:02:18Z VendorInfo=snap

                   | EN  
-------------------+-----
  Pages            |  7  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     | 79  
  Processed images |  0  
  Aliases          |  2  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 138 ms
Watching for changes in /home/hiroshi/Documents/hugo/htakeuchi0-notebook/{archetypes,content,data,layouts,static,themes}
Watching for config changes in /home/hiroshi/Documents/hugo/htakeuchi0-notebook/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

別端末からも確認できるようにするには，`--bind xxx.yyy.zzz.www` オプションをつける必要があります．

これで空のサイトが生成できることが確認できました．    
実際にページを公開する場合は，後述するように，html ファイルにビルドする必要があります．

## まとめ

本ページでは，Hugo を用いて，ローカルに空のサイトが生成できるところまで説明しました．
