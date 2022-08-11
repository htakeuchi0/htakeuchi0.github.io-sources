# Github Pages 公開ページのソースセット

## 概要

本リポジトリは，Github Pages で公開しているページのソースセットである．    
当該ページは [Hugo](https://gohugo.io) を利用して作成されている．

## 環境作成

### Hugo のインストール

[Hugo の Quick Start](https://gohugo.io/getting-started/quick-start/) に従う．    
作成環境は Linux OS 64bit (Ubuntu 18.04.6 LTS) なので，[Hugo のインストールページ](https://gohugo.io/getting-started/installing) を参考に，以下のコマンドを実行する．

```shell
$ snap install hugo --channel=extended
```

デスクトップ環境なので，認証のためのダイアログが表示されるので，パスワードを入力して認証をクリックする．    

以下のコマンドでインストールが成功したかを確認できる．

```shell
$ hugo version
hugo v0.101.0-9f74196ce611cdf6d355bfb99fd8eba5c68ef7f8+extended linux/amd64 BuildDate=2022-06-28T10:02:18Z VendorInfo=snap
```

### サイトの生成

以下のコマンドを実行する．

```shell
$ hugo new site htakeuchi0-notebook
```

### テーマの追加

[Book](https://themes.gohugo.io/themes/hugo-book/) テーマを利用する．    
当該テーマの README にしたがって，以下のコマンドを実行する．

```shell
$ cd htakeuchi0-notebook
$ git init
$ git branch -M main
$ git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book
```

設定ファイルにテーマを追加する．

```shell
$ echo theme = \"hugo-book\" >> config.toml
```

### ソース管理用 Github リポジトリへ追加

空の本リポジトリを作成済みとして，以下のコマンドを実行する．

```shell
$ mv ../README.md .
$ git add README.md
$ touch content/.gitkeep data/.gitkeep layouts/.gitkeep public/.gitkeep static/.gitkeep
$ git add *
$ git commit -a -m "first commit"
$ git remote add origin git@github.com:htakeuchi0/htakeuchi0.github.io-sources.git
$ git push -u origin main
```
