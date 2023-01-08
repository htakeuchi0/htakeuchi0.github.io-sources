---
title: "autoconf プロジェクト (2)"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# autoconf プロジェクト (2)

## 概要

前ページでは，autoconf を使った Makefile の自動生成について説明しましたが，Makefile.am は main と test ディレクトリだけに配置し，subdir-objects オプションを使いました．

autoconf では，各ディレクトリに Makefile.am を配置するのが通常と思いますので，その方針で設定をし直します．

ただし，ディレクトリをまたいだソースコードをまとめてビルドできないので， **srcディレクトリ以下はライブラリとしてビルドし，main, test ではそのライブラリをリンクしてビルドします．**

その場合は，Libtool を利用したライブラリ生成が必要になるので，順を追って説明するために，前ページではそのようにしませんでした．

本ページでは，Libtool を利用して，各ディレクトリに Makefile.am を配置して Makefile を生成する方法を説明します．


## 準備

今回も [Makefile プロジェクト]({{< ref "make.md" >}}) のリポジトリからスタートします．    
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

### configure.ac の作成

まず，準備として，Makefileの雛形の雛形に相当する `Makefile.am` の空ファイルを配置しておきます．    
**前ページの設定に対して，`include/Makefile.am`, `src/Makefile.am` を追加しました．**

```bash
$ touch Makefile.am include/Makefile.am main/Makefile.am src/Makefile.am test/Makefile.am
```

`autoscan` コマンドでファイルの雛形を生成します．

```bash
$ autoscan
```

`configure.scan` の内容は以下のとおりです．

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
                 include/Makefile
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

```
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([autoconf_sample], [0.0.2], [htakeuchi0gh@gmail.com])
AM_INIT_AUTOMAKE([foreign])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIRS([m4])
LT_INIT

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
                 include/Makefile
                 main/Makefile
                 src/Makefile
                 test/Makefile])
AC_OUTPUT
```

`AM_INIT_AUTOMAKE([foreign])` は，GNU 準拠でないため (foreign) 設定しています．今回の構成では， **subdir-objects は不要です．**

ライブラリを生成するため，`AC_CONFIG_MACRO_DIRS([m4])`, `LT_INIT` を追加しています．

`AC_CONFIG_SRCDIR`, `AC_CONFIG_HEADERS` は前ページの通り，下記の通りである必要はないのですが，確実に存在するファイルとしてこれにしています．

### Makefile.am の作成

各 `Makefile.am` を作成します．

* `./Makefile.am`
  * サブディレクトリと，ライブラリの作成のためのフラグを指定します．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4
```

* `include/Makefile.am`
  * インストールしないヘッダであることを明示します．

```Makefile
noinst_HEADERS = cpp_env_sample/example.h
```

* `main/Makefile.am`
  * ソースコードとコンパイラへのフラグを指定します

```Makefile
bin_PROGRAMS = acsample
acsample_SOURCES = main.cc
acsample_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
acsample_LDADD = ../src/libacsample.la
```

* `src/Makefile.am`
  * ライブラリ (`libacsample.la`) とテスト用ライブラリ (`libacsampled.la`) を生成します

```Makefile
noinst_LTLIBRARIES = libacsample.la libacsampled.la
libacsample_la_SOURCES = example.cc
libacsample_la_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
libacsampled_la_SOURCES = example.cc
libacsampled_la_CXXFLAGS = -std=c++17 -s -Wall -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline -I$(top_builddir)/include -I/usr/local/include
```

* `test/Makefile.am`
  * テスト実行ファイルの指定 (TESTS), テスト用ソースコードとコンパイラへのフラグを指定します

```Makefile
TESTS = test_acsample
check_PROGRAMS = test_acsample
test_acsample_SOURCES = gtest_example.cc
test_acsample_CXXFLAGS = -std=c++17 -s -Wall -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline -I$(top_builddir)/include -I/usr/local/include
test_acsample_LDADD = ../src/libacsampled.la -lgtest -lgtest_main -lpthread
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
|  |- Makefile.am
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
|  |- Makefile.am
|  |- example.cc
|
|- test/
   |- Makefile.am
   |- gtest_example.cc
```

### autoconf コマンドの実行

libtoolize を実行します．

```bash
$ libtoolize -c
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
```

以下のファイルが追加されます．

```
|- ltmain.sh
|- m4/
   |- libtool.m4
   |- ltoptions.m4
   |- ltsugar.m4
   |- ltversion.m4
   |- lt~obsolete.m4
```

aclocal, autoheader, automake を実行します．

```bash
$ aclocal
$ autoheader
$ automake --add-missing
configure.ac:10: installing './compile'
configure.ac:10: installing './config.guess'
configure.ac:10: installing './config.sub'
configure.ac:6: installing './install-sh'
configure.ac:6: installing './missing'
main/Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'

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
|- include/
|  |- Makefile
|
|- main/
|  |- Makefile
|
|- src/
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
ライブラリ libacsample.la, libacsamled.la と実行可能なバイナリファイル acsample がビルドされました．

```
|- main/
|  |- acsample
|  |- acsample-main.o
|
|- src/
   |- libacsample.la
   |- libacsample_la-example.lo
   |- libacsample_la-example.o
   |- libacsampled.la
   |- libacsampled_la-example.gcno
   |- libacsampled_la-example.lo
   |- libacsampled_la-example.o
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
|  |- libacsampled_la-example.gcno
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

```bash
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

make clean, make dist, make distclean などが使えますが省略します．

## まとめ

本ページでは，Libtool を利用して，各ディレクトリに Makefile.am を配置して Makefile を生成する方法を説明しました．

実行可能ファイルの生成という意味では問題ありませんが，いくつかの改善点があります．
次ページで細かいところも調整し，よりよい autoconf プロジェクトにします．
