---
title: "autoconf プロジェクト (3)"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# autoconf プロジェクト (3)

## 概要

前ページでは，Libtool を利用して，より自然な autoconf を使った Makefile の自動生成について説明しました．

しかし，[Makefile プロジェクト]({{< ref "make.md" >}}) と比べると以下の点が不十分です．

1. `make clean` をしても `*.gcno`, `*.gcda` のファイルが残る
1. `make check` で Google Test の結果が表示されない
1. `make docs`, `make lcov` が実行できない
1. `make lib` で共有ライブラリのビルドができない 

本ページでは，これらを組み込む方法を説明します．その後，"その他" として，さらに不足している設定も説明します．

## `make clean` をしたとき `*.gcno`, `*.gcda` のファイルを消すようにする

本節では，`make clean` をしたときに削除されないファイルがあることへの対処法を説明します．

本プロジェクトの場合，削除されないファイルは `src/*.gcno`, `test/*.gcno`, `test/*.gcda` ですが，これらファイルは `make check` で使っている `gcov` のカバレッジ計測用ファイルです．

このように "ローカルルール" で生成されたファイルを消すには，**clean のローカルルールのようなものを定義してあげる必要があります**．

[前ページ]({{< ref "autoconf2.md" >}}/#makefileam-の作成) で，プロジェクトのルートディレクトリに以下のような `Makefile.am` を用意しました．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4
```

ここに以下のルールを追加します．

```Makefile
clean-local:
	@rm -f src/*.gcno
	@rm -f test/*.gcno
	@rm -f test/*.gcda
```

この "clean のローカルルール" に相当する `clean-local` は `clean` のあとに実行されます．

これで，`make clean` で `*.gcno`, `*.gcda` が削除されるようになります．

いま，プロジェクトのルートディレクトリの `Makefile.am` は以下のようになっています．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4

clean-local:
	@rm -f src/*.gcno
	@rm -f test/*.gcno
	@rm -f test/*.gcda
```

## `make check` で Google Test の結果が表示されるようにする

`make check` を実行すると以下のような表示は出ますが，Google Test の結果は表示されません．Google Test の結果を見たければ，`test_acsample` を直接実行する必要があります．

```bash
$ make check

...(省略)...

PASS: test_acsample
============================================================================
Testsuite summary for autoconf_sample 0.0.2
============================================================================
# TOTAL: 1
# PASS:  1
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================
```

そこで， `make check` で Googlet Test の結果まで確認できるようにしたいと思います．

これは前節と同様， **check のローカルルールを定義することで対処できます．** 具体的には，`Makefile.am` に以下に追記します．

```Makefile
check-local:
	test/test_acsample
```

こうすると， `make check` を実行すると以下の出力になります．

```bash
$ make check

...(省略)...

PASS: test_acsample
============================================================================
Testsuite summary for autoconf_sample 0.0.2
============================================================================
# TOTAL: 1
# PASS:  1
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================

...(省略)...

make  check-local

...(省略)...

test/test_acsample
Running main() from ... (省略) ... /gtest_main.cc
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

これで，`make check` で Google Test の結果まで確認できるようになりました．

いま，プロジェクトのルートディレクトリの `Makefile.am` は以下のようになっています．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4

clean-local:
	@rm -f src/*.gcno
	@rm -f test/*.gcno
	@rm -f test/*.gcda

check-local:
	test/test_acsample
```

## `make docs`, `make lcov` が実行できるようにする

[Makefile プロジェクト]({{< ref "make.md" >}}) では `make docs` で Doxygen によるドキュメント生成， `make lcov` でカバレッジ計測結果生成ができるようになっていました．

autoconf プロジェクトでもおなじことができるようにします．

これは，`Makefile.am` に直接定義を記述することで対応できます．`make check` は gcov をつかってビルドしているので， `Makefile.am` に以下を追記すればよいです．

```Makefile
DOCDIR = doxygen
INDEXPATH = $(DOCDIR)/html/index.html
docs:
	doxygen
	@echo $(INDEXPATH)

LCOVDIR = lcov
COVERAGE = coverage.info
lcov: check
	lcov --capture --directory . --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **include/c++/** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **bits** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.h --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.cc --output-file $(COVERAGE)
	genhtml $(COVERAGE) --output-directory $(LCOVDIR)
	@rm -f *.gcno
	@rm -f *.gcda
	@rm -f $(COVERAGE)
	@echo -n -e ""
	@echo $(LCOVDIR)/index.html
```

単に Makefile プロジェクトの Makefile から該当箇所をコピーしただけです．

ついでに，`clean-local` に以下を追加しておきましょう．そのため，`LCOVDIR`, `DOCDIR` は冒頭で定義しておきましょう．

```Makefile
DOCDIR = doxygen
LCOVDIR = lcov

clean-local:

  ... (省略) ...

	@rm -rf $(DOCDIR)
	@rm -rf $(LCOVDIR)
```

これで，`make docs` でドキュメント生成, `make lcov` でカバレッジ計測結果生成ができるようになりました．

いま，プロジェクトのルートディレクトリの `Makefile.am` は以下のようになっています．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4

DOCDIR = doxygen
LCOVDIR = lcov

clean-local:
	@rm -f src/*.gcno
	@rm -f test/*.gcno
	@rm -f test/*.gcda
	@rm -rf $(DOCDIR)
	@rm -rf $(LCOVDIR)

check-local:
	test/test_acsample

.PHONY: docs lcov
INDEXPATH = $(DOCDIR)/html/index.html
docs:
	doxygen
	@echo $(INDEXPATH)

COVERAGE = coverage.info
lcov: check
	lcov --capture --directory . --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **include/c++/** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **bits** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.h --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.cc --output-file $(COVERAGE)
	genhtml $(COVERAGE) --output-directory $(LCOVDIR)
	@rm -f *.gcno
	@rm -f *.gcda
	@rm -f $(COVERAGE)
	@echo -n -e ""
	@echo $(LCOVDIR)/index.html
```

## 共有ライブラリがビルド・インストールできるようにする

共有ライブラリをビルドできるようにするというより，インストールできるように修正が必要です．具体的には，**noinstにしたライブラリやヘッダファイルをインストール対象にすればよいです．**

まず，`src/Makefile.am` は以下の状態でした．

```Makefile
noinst_LTLIBRARIES = libacsample.la libacsampled.la
libacsample_la_SOURCES = example.cc
libacsample_la_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
libacsampled_la_SOURCES = example.cc
libacsampled_la_CXXFLAGS = -std=c++17 -s -Wall -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline -I$(top_builddir)/include -I/usr/local/include
```

テスト用ライブラリはそのままで，そうでない方をインストール対象にします (接頭辞を noinst でなく lib にします)．ただし，バージョンを 0.0.3 としました．

```Makefile
lib_LTLIBRARIES = libacsample.la
noinst_LTLIBRARIES = libacsampled.la
libacsample_la_SOURCES = example.cc
libacsample_la_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
libacsample_la_LDFLAGS = -version-info 0:3:0
libacsampled_la_SOURCES = example.cc
libacsampled_la_CXXFLAGS = -std=c++17 -s -Wall -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline -I$(top_builddir)/include -I/usr/local/include
```

テスト用ライブラリは libtool convenience libraries なので `-version-info` は不要です．

次にヘッダファイルもインストール対象とします．

いま，`include/Makefile.am` は以下の状態です．

```Makefile
noinst_HEADERS = cpp_env_sample/example.h
```

インストール対象とするため，以下のように変更します．**noinst を include にするだけではなく，`cpp_env_smaple` ディレクトリを潰さないように，nobase の接頭辞をつけておきます．**

```Makefile
nobase_include_HEADERS = cpp_env_sample/example.h
```

これで，`make install` で共有ライブラリとヘッダファイルがインストールされるようになります．ちなみに，共有ライブラリは `.libs` という隠しディレクトリ内に生成されます．

```
$ find . -name *.so
./src/.libs/libacsample.so
```

最後に，バイナリファイルにフラグを追加しておきます．

いま，`main/Makefile.am` は以下の状態です．

```Makefile
bin_PROGRAMS = acsample
acsample_SOURCES = main.cc
acsample_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
acsample_LDADD = ../src/libacsample.la
```

以下のように `LDFLAGS` を追加します．

```Makefile
bin_PROGRAMS = acsample
acsample_SOURCES = main.cc
acsample_CXXFLAGS = -std=c++17 -s -Wall -I$(top_builddir)/include -I/usr/local/include
acsample_LDADD = ../src/libacsample.la
acsample_LDFLAGS = -Wl,-rpath=/usr/local/lib
```

なお，バイナリファイルがインストール不要である場合は `bin_PROGRAMS` を `noinst_PROGRAMS` とすればよいです．

## その他

### アーカイブファイルに含めるファイルを設定する

現在の設定では `make dist` でアーカイブを作成すると，以下のファイルが含まれません．
* `Doxyfile`
* `LICENSE`
* `scripts` 以下のスクリプト

そこで，ルートディレクトリの `Makefile.am` に以下を追加します．

```
EXTRA_DIST = Doxyfile LICENSE scripts/*
```

いま，プロジェクトのルートディレクトリの `Makefile.am` は以下のようになっています．

```Makefile
SUBDIRS = include src main test
ACLOCAL_AMFLAGS = -I m4

DOCDIR = doxygen
LCOVDIR = lcov

clean-local:
	@rm -f src/*.gcno
	@rm -f test/*.gcno
	@rm -f test/*.gcda
	@rm -rf $(DOCDIR)
	@rm -rf $(LCOVDIR)

check-local:
	test/test_acsample

.PHONY: docs lcov
INDEXPATH = $(DOCDIR)/html/index.html
docs:
	doxygen
	@echo $(INDEXPATH)

COVERAGE = coverage.info
lcov: check
	lcov --capture --directory . --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **include/c++/** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **bits** --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.h --output-file $(COVERAGE)
	lcov --remove $(COVERAGE) **gtest*.cc --output-file $(COVERAGE)
	genhtml $(COVERAGE) --output-directory $(LCOVDIR)
	@rm -f *.gcno
	@rm -f *.gcda
	@rm -f $(COVERAGE)
	@echo -n -e ""
	@echo $(LCOVDIR)/index.html

EXTRA_DIST = Doxyfile LICENSE scripts/*
```

## まとめ

本ページでは，[autoconf プロジェクト(1)]({{< ref "autoconf.md" >}}), [autoconf プロジェクト (2)]({{< ref "autoconf2.md" >}}) で作成した autoconf プロジェクトで，[Makefile プロジェクト]({{< ref "make.md" >}}) に対して欠けている設定を追加する方法を，個別に説明しました．

次ページで，これまでの説明の総括として，[autoconf プロジェクト(1)]({{< ref "autoconf.md" >}}) や [autoconf プロジェクト (2)]({{< ref "autoconf2.md" >}}) と同じ節構成で，[Makefile プロジェクト]({{< ref "make.md" >}}) をもとにした autoconf プロジェクトの作成手順を説明します．

