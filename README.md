# Github Pages 公開ページのソースセット

## 概要

本リポジトリは，Github Pages で公開しているページ（以下，本ページ）のソースセットである．    
当該ページは [Hugo](https://gohugo.io) を利用して作成されている．

## 環境作成

### Hugo のインストール

[Hugo の Quick Start](https://gohugo.io/getting-started/quick-start/) に従う．    
作成環境は Linux OS 64bit (Ubuntu 18.04.6 LTS) なので，[Hugo のインストールページ](https://gohugo.io/getting-started/installing) を参考に，以下のコマンドを実行する．

```shell
$ snap install hugo --channel=extended
```

作成環境はデスクトップ環境なので，認証のためのダイアログが表示される．    
パスワードを入力して認証をクリックする．    

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

### 動作確認

Webサーバモードで hugo を実行し，ブラウザで画面が表示できることを確認する．    
今回の場合は，表示されているとおり `http://localhost:1313/` にアクセスする．

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

### ホームページの追加

以下のコマンドを実行する．

```shell
$ hugo new _index.md
```

`content/_index.md` が生成されているので，以下のように書き換える．

```
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

設定ファイル `confing.toml` を以下のようにする．

```
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

### ページの追加

以下のコマンドを実行する．

```shell
$ hugo new docs/cpp/_index.md
```

`content/docs/cpp/_index.md` が追加されている．    
他のページも同様． 

### クリエイティブ・コモンズ・ライセンスの表示

本ページは CC BY-ND 4.0 で公開する．     
そこで `layouts/partials/docs/inject/content-after.html` に以下を追加する．

```html
<hr>

<p>
<small>
<a rel="license" href="https://creativecommons.org/licenses/by-nd/4.0/deed.ja?_fsi=E6fL9iEx"><img src="https://i.creativecommons.org/l/by-nd/4.0/88x31.png" alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" /></a><br />本ページは <a rel="license" href="https://creativecommons.org/licenses/by-nd/4.0/deed.ja?_fsi=E6fL9iEx">クリエイティブ・コモンズ 表示 - 改変禁止 4.0 国際ライセンス (CC BY-ND 4.0)</a> の下に提供されています。
</small>
</p>
```

`layouts/partials/docs/inject/footer.html` もあるが，ここに上記を記載すると，画像がつぶれてしまうので，コンテンツの最後につけるようにした．

### ページ内リンク

参考：https://maku77.github.io/hugo/advanced/internal-link.html

任意の場所にページ内リンクができるよう，空の `a` タグがおけるようなショートコードを追加する．

以下の内容の `layouts/shortcodes/anchor.html` というファイルを作成する．

```html
<a id="{{ .Get 0 }}"></a>
```

使いかたは以下の通り．

* リンク先：`{{< anchor "anchor-id" >}}`
* リンク元：`[リンク](#anchor-id)`
