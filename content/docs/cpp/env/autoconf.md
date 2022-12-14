---
title: "autoconf プロジェクト (1)"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# autoconf プロジェクト (1)

## 概要

前ページでは，Makefile プロジェクトの例について説明しました．    
本ページでは，autoconf を使った Makefile の自動生成について説明します．

本ページでは，やや不自然な箇所がありますが，できるだけ最小構成で autoconf による Makefile 生成と，make の実行を試みます．

## 準備

[Makefile プロジェクト]({{< ref "make.md" >}}) のリポジトリからスタートします．    
初期状態のディレクトリ構成は以下のとおりです．

```
|- cpp_env_sample/
   |- Doxyfile               - doxygen設定ファイル
   |- LICENSE                - ライセンスファイル
   |- Makefile               - makeファイル
   |- README.md              - READMEファイル
   |- include/               - ヘッダファイル
   |  |- cpp_env_sample/
   |     |- example.h
   |
   |- main/                  - メインファイル
   |  |- main.cc
   |
   |- scripts/               - 環境構築用スクリプト
   |  |- install_doxygen.sh
   |  |- install_gtest.sh
   |  |- install_lcov.sh
   |
   |- src/                   - ソースファイル
   |  |- example.cc
   |
   |- test/                  - テストファイル
      |- gtest_example.cc
```

まず，これから自動生成する Makefile を削除しておきます．

```
|- cpp_env_sample/
   |- Doxyfile               - doxygen設定ファイル
   |- LICENSE                - ライセンスファイル
   |- README.md              - READMEファイル
   |- include/               - ヘッダファイル
   |  |- cpp_env_sample/
   |     |- example.h
   |
   |- main/                  - メインファイル
   |  |- main.cc
   |
   |- scripts/               - 環境構築用スクリプト
   |  |- install_doxygen.sh
   |  |- install_gtest.sh
   |  |- install_lcov.sh
   |
   |- src/                   - ソースファイル
   |  |- example.cc
   |
   |- test/                  - テストファイル
      |- gtest_example.cc
```

## autoconf の実行と種々の設定

autoconf コマンドで，Makefile を生成する configure スクリプトを生成します．   
ただし，そのためにいくつかファイルの準備やコマンド実行が必要です．    
本節では，それら作業を順を追って説明します．

Makefileの雛形の雛形に相当する `Makefile.am` の空ファイルを配置しておきます．

```bash
$ touch Makefile.am main/Makefile.am test/Makefile.am
```

`autoscan` コマンドでファイルの雛形を生成します．

```bash
$ autoscan
```

このとき，以下のファイルが追加されます．

```
|- configure.scan        configure.in の雛形ファイル
|- autoscan.log          autoscan コマンドの実行ログ
```

`autoscan.log` は空で，`configure.scan` の内容は以下のとおりです．

```bash
$ cat configure.scan 
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([FULL-PACKAGE-NAME], [VERSION], [BUG-REPORT-ADDRESS])
AC_CONFIG_SRCDIR([test/gtest_example.cc])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 main/Makefile
                 src/Makefile
                 test/Makefile])

AC_OUTPUT

```

`configure.scan` を `configure.ac` に変更します．

```bash
$ mv configure.scan configure.ac
```

`configure.ac` を以下のように変更します．    

`AM_INIT_AUTOMAKE([foreign subdir-objects])` は，GNU 準拠でないため (foreign), オブジェクトがソースファイルがあるサブディレクトリに配置されるようにするため (subdir-objects) の設定です．

ただし，subdir-objects を指定するのではなく，各サブディレクトリごとにビルドするようにする方がよいと思われるので，その場合の方法は，次ページ以降で取り扱います．

`AC_CONFIG_SRCDIR`, `AC_CONFIG_HEADERS` は下記の通りである必要はないのですが，確実に存在するファイルとしてこれにしています．

`AC_CONFIG_FILES` には，今回生成する予定の Makefile を指定しています．

```
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([autoconf_sample], [0.0.1], [htakeuchi0gh@gmail.com])
AM_INIT_AUTOMAKE([foreign subdir-objects])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 main/Makefile
                 test/Makefile])
AC_OUTPUT
```

各 `Makefile.am` を作成します．

* `./Makefile.am`
  * サブディレクトリを指定するだけです

```
SUBDIRS = main test
```

* `main/Makefile.am`
  * ソースコードとコンパイラへのフラグを指定します

```
bin_PROGRAMS = acsample
srcs = ../src/example.cc
acsample_SOURCES = main.cc $(srcs)
acsample_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
acsample_LDADD = 
```

* `test/Makefile.am`
  * テスト実行ファイルの指定 (TESTS), テスト用ソースコードとコンパイラへのフラグを指定します

```
TESTS = test_acsample
check_PROGRAMS = test_acsample
srcs = ../src/example.cc
test_acsample_SOURCES = gtest_example.cc $(srcs)
test_acsample_CXXFLAGS = -std=c++17 -s -Wall -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline -I$(top_builddir)/include -I/usr/local/include
test_acsample_LDADD = -lgtest -lgtest_main -lpthread
```

ここまでで以下のファイル構成となっているはずです．

```
|- Doxyfile
|- LICENSE
|- Makefile.am
|- README.md
|- autoscan.log
|- configure.ac
|- include/
|  |- cpp_env_sample/
|     |- example.h
|
|- main/
|  |- Makefile.am
|  |- main.cc
|
|- scripts/
|  |- install_doxygen.sh
|  |- install_gtest.sh
|  |- install_lcov.sh
|
|- src/
|  |- example.cc
|
|- test/
   |- Makefile.am
   |- gtest_example.cc
```

aclocal を実行します．

```bash
$ aclocal
```

以下のファイルが追加されます．

```
|- aclocal.m4
|- autom4te.cache/
```

autoheader を実行します．

```bash
$ autoheader
```

以下のファイルが追加されます (`autom4te.cache` 以下は省略)．

```
|- config.h.in
```

automake を実行します．

```bash
$ automake --add-missing
configure.ac:12: installing './compile'
configure.ac:6: installing './install-sh'
configure.ac:6: installing './missing'
main/Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'
```

以下のファイルが追加されます．

```
|- Makefile.in
|- compile
|- install-sh
|- missing
|- depcomp
|- test-driver
|- main/
|  |- Makefile.in
|
|- test/
   |- Makefile.in
```

autoconf を実行します．

```bash
$ autoconf
```

以下のファイルが追加されます．    
この configure というファイルは Makefile を生成するためのスクリプトです．

```
|- configure
```

## 動作確認

### make の実行

ようやく configure ファイルができたので，これで Makefile が生成できます．    
Makefile の生成と，make の実行を試してみます．

configure を実行します．

```bash
$ ./configure
```

以下のファイルが追加されます．    
特に Makefile が欲しいファイルでした．

```
|- Makefile
|- config.h
|- config.log
|- config.status
|- stamp-h1
|- main/
|  |- Makefile
|
|- test/
   |- Makefile
```

Makefile ができたので make を実行します．

```bash
$ make
```

以下のファイルが追加されます．    
実行可能なバイナリファイル acsample がビルドされました．

```
|- main/
|  |- acsample
|  |- acsample-main.o
|
|- src/
   |- acsample-example.o
```

生成されたバイナリファイルを実行します．

```bash
$ main/acsample
Usage: main/acsample <name> <value> <value2>
$ main/acsample a 1 2
name : a
value: 3
```

実行できました．

### make check の実行

make check によってテストが実行できます．    
make check では，test/Makefile.am に TESTS で指定した実行可能ファイルが実行されます．    
さらに，Google Test によるテストコードもビルドするようにしています．

そこで，make check でテストコードがビルドされ，実行できることを確認してみます．

make check を実行します．

```bash
$ make check
```

以下のファイルが生成されます．

```
|- src/
|   |- test_acsample-example.gcda
|   |- test_acsample-example.gcno
|   |- test_acsample-example.o
|
|- test/
   |- test-suite.log
   |- test_acsample
   |- test_acsample-gtest_example.gcda
   |- test_acsample-gtest_example.gcno
   |- test_acsample-gtest_example.o
   |- test_acsample.log
   |- test_acsample.trs
```

生成されたバイナリファイルを実行します．

```bash
$ test/test_acsample
Running main() from /home/hiroshi/Documents/cpp/cppbf/googletest/googletest/src/gtest_main.cc
[==========] Running 4 tests from 1 test suite.
[----------] Global test environment set-up.
[----------] 4 tests from ExampleTest
[ RUN      ] ExampleTest.SetValue
[       OK ] ExampleTest.SetValue (0 ms)
[ RUN      ] ExampleTest.AddValue
[       OK ] ExampleTest.AddValue (0 ms)
[ RUN      ] ExampleTest.SetName
[       OK ] ExampleTest.SetName (0 ms)
[ RUN      ] ExampleTest.Show
[       OK ] ExampleTest.Show (0 ms)
[----------] 4 tests from ExampleTest (0 ms total)

[----------] Global test environment tear-down
[==========] 4 tests from 1 test suite ran. (0 ms total)
[  PASSED  ] 4 tests.
```

実行できました．

### make install の実行

make install/uninstall によって，バイナリファイルのインストール，アンインストールができるので，試してみます．

make install を実行します．

```bash
$ sudo make install
```

パスを指定せずに acsample が実行できるようになります．

```
$ acsample
Usage: acsample <name> <value> <value2>
$ acsample a 1 2
name : a
value: 3
```

実行できました．

アンインストールしておきます．

```bash
$ sudo make uninstall
```

### その他

maek clean, make dist, make distclean などが使えますが省略します．

## まとめ

本ページでは，autoconf を使った Makefile の自動生成について説明しました．    
autoconf を使うことで，Makefile を生成するための configure スクリプトが生成できて，configure スクリプトで Makefile が生成されることを確認しました．

