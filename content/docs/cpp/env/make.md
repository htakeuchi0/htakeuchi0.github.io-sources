---
title: "Makefile プロジェクト"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# Makefile プロジェクト

## 概要

本ページでは，Makefile を使ったプロジェクトのディレクトリ構成の例を説明します．

`cpp_env_sample` ディレクトリ以下にソースコードなどを配置することとします．

## Github リポジトリ

本ページで説明するディレクトリ構成のプロジェクトは，以下の Github リポジトリ [[1]](#cite:1) として公開しています．

https://github.com/htakeuchi0/cpp_env_sample

## 動作環境

本ページで説明するものは，以下の環境で動作するものです．
* OS: Linux (Ubuntu 18.04.5 LTS)
  * コンパイラ: g++ (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0

* OS: Linux (Ubuntu 20.04.1 LTS)
  * コンパイラ: g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0

単体試験，カバレッジ計測，ドキュメント生成に，それぞれ以下を利用するものとします．
* Google Test [[2]](#cite:2)
* LCOV [[3]](#cite:3)
* Doxygen [[4]](#cite:4)

## ディレクトリ構成

ディレクトリ構成の例は以下の通りです．

```
|- cpp_env_sample/
   |- Doxyfile               - doxygen設定ファイル
   |- LICENSE                - ライセンスファイル
   |- Makefile               - makeファイル
   |- README.md              - 本ファイル
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

## ソースコード関連のディレクトリ

ソースコード関連のディレクトリを抜き出すと以下のとおりです．

```
|- cpp_env_sample/
   |- include/               - ヘッダファイル
   |  |- cpp_env_sample/
   |
   |- main/                  - メインファイル
   |- src/                   - ソースファイル
   |- test/                  - テストファイル
```

### include ディレクトリ

ヘッダファイルを格納するディレクトリです．
ただし，`include` ディレクトリには直接置かず，その中にプロジェクト名と同じ名前のディレクトリを作り，その中にヘッダファイルを配置します．

```
|- cpp_env_sample/
   |- include/               - ヘッダファイル
      |- cpp_env_sample/
         |- example.h
```

ヘッダファイルの拡張子は `.h` とします．

ビルド時は `./include` にパスを通し，他のファイルからは，

```cpp
#include "cpp_env_sample/example.h"
```

のように参照します．

これは，プログラムを共有ライブラリとしてビルドし，ヘッダファイルを `/usr/local/include/cpp_env_sample` に置き，その共有ライブラリを使うプログラムが `/usr/local/include` にパスを通す場合，

```cpp
#include <cpp_env_sample/example.h>
```

となるので，これと整合します．

好みだと思いますが[^1]，特に，**あるヘッダファイルが別のヘッダファイルを include する場合に，このようになっていると分かりやすいと思います．**
[^1]: たとえば，`include` ディレクトリ以下に直接配置し，`/usr/local/include/cpp_env_sample` にコピーする場合は，ユーザに `/usr/local/include/cpp_env_sample` にパスを通してもらえば，`#include <example.h>` と書けます．この場合，ほかのライブラリとの名前の衝突が気になるので，初めから本文のようにしておいた方が，余計なことを考えなくてすむと思います．

### main ディレクトリ

main メソッドを含むメインファイルを格納するディレクトリです．    
あえてそれ以外のソースファイルと分けています．

```
|- cpp_env_sample/
   |- main/                  - メインファイル
      |- main.cc
```

これは，プログラムを共有ライブラリとしてビルドするとき，    
メインファイルは含めなくてよいと思いますので，初めからディレクトリをわけておきます．

メインファイルの名称は `main.cc` とします．

### src ディレクトリ

メインファイル以外のソースファイルを格納するディレクトリです．

```
|- cpp_env_sample/
   |- src/                   - ソースファイル
      |- example.cc
```

ソースファイルの拡張子は `.cc` とします．

### test ディレクトリ

単体試験用のテストファイルを格納するディレクトリです．    
単体試験フレームワークには Google Test [[2]](#cite:2) を利用します．    

```
|- cpp_env_sample/
   |- test/                  - テストファイル
      |- gtest_example.cc
```

テストファイルの拡張子は `.cc` とし，`gtest_*.cc` という名前をつけます．

## その他のファイル

その他のファイルを抜き出すと以下の通りです．

```
|- cpp_env_sample/
   |- Doxyfile               - doxygen設定ファイル
   |- LICENSE                - ライセンスファイル
   |- Makefile               - makeファイル
   |- README.md              - 本ファイル
```

### Doxyfile

Doxygen [[4]](#cite:4) でドキュメントを生成するための設定ファイルです．    
`doxygen -g` コマンドで生成されたファイルを変更して使っています．    
設定例は以下のとおりです．

|項目                    |設定値                 |
|------------------------|-----------------------|
|`PROJECT_NAME`          |C++サンプルプロジェクト|
|`PROJECT_NUMBER`        |0.0.1                  |
|`PROJECT_BRIEF`         |C++サンプルプロジェクト|
|`OUTPUT_DIRECTORY`      |doxygen                |
|`EXTRACT_ALL`           |YES                    |
|`INPUT`                 |./                     |
|`RECURSIVE`             |YES                    |
|`EXCLUDE`               |build                  |
|`USE_MDFILE_AS_MAINPAGE`|README.md              |
|`GENERATE_LATEX`        |NO                     |

`PROJECT_NAME`, `PROJECT_NUMBER`, `PROJECT_BRIEF` はプロエジェクト名やバージョンを表示するために指定します．

`OUTPUT_DIRECTORY` は `doxygen` ディレクトリにドキュメントを生成させるために指定します．

`EXTRACT_ALL` は private なメソッドやデータメンバも出力するなどのフラグを一括で立てるために指定します．

`INPUT`, `RECURSIVE` はカレントディレクトリ以下の関連するファイルを自動的にすべてドキュメント化対象として認識させるために指定します．

`EXLUDE` はビルド生成物が出力されるディレクトリを排除するために指定します．

`USE_MDFILE_AS_MAINPAGE` は README.md の内容をトップに表示するために指定します．

`GENERATE_LATEX` は {{< katex >}}\LaTeX{{< /katex >}} ファイルを出力しないために指定します．

### LICENSE

ライセンスファイルです．必要に応じて作成します．    
Github リポジトリで管理する場合は，Github でリポジトリ作成時にテンプレートを選択するか，    
Add file > Create new file > Name you file... に `LICENSE` と入力することでテンプレートを利用できます．

ライセンスファイルを配置する場合は，必ずライセンスの内容を理解すべきです．

### Makefile

ビルドのためのファイルです．以下のコマンドが実行ができるようなファイルを作成して配置しています．

|コマンド                  |説明                                            |
|--------------------------|------------------------------------------------|
|`make` または `make build`|実行可能ファイルのビルド                        |
|`make lib`                |共有ライブラリのビルド                          |
|`make install`            |共有ライブラリとヘッダファイルのインストール    |
|`make uninstall`          |共有ライブラリとヘッダファイルのアンインストール|
|`make test`               |テストファイルのビルド                          |
|`make lcov`               |単体試験のカバレッジ情報の生成                  |
|`make docs`               |ドキュメントの生成                              |

コンパイルは原則分割コンパイルとして，一部のソースコードが変更されたら，そのソースコードに関するオブジェクトファイルのみを再生成することで，毎回全体をビルドしなくてすむようにしています．

また，ヘッダファイルだけを変更しても，必要なコンパイルができるように，依存ファイルも生成しています．

インストール先が固定であるなど，簡易的なつくりとしている箇所はあります．


Makefile 全体は以下の通りです．依存ファイルのビルドルールがないことを明示するために，空の生成ルールを定義しています．

それ以外は特筆する点はありませんが，`CXXFLAGS` はほぼリリース向けの設定となっており，開発中は適切なフラグを設定することと思います．

`-include` で依存ファイルを読み込みますが，この定義は最終行に記載します．

```makefile
SHELL=/bin/bash

# compiler and linker flags
CXX = g++
LD = g++
OPTIM = -O3
CXXFLAGS = -std=c++17 -s -Wall
DEPFLAGS = -MT $@ -MMD -MP -MF
GCOVFLAGS = -fprofile-arcs -ftest-coverage -fno-inline -fno-inline-small-functions -fno-default-inline
LDFLAGS = 
TEST_LDFLAGS = -lgtest -lgtest_main -lpthread

# library settings
LIB_TARGET_BASE = libcppenvsample.so
LIB_VER = 0.0.1
INCLUDE_DIR = cpp_env_sample

# targets
MAIN_TARGET = cpp_env_sample
LIB_TARGET = $(LIB_TARGET_BASE).$(LIB_VER)
TEST_TARGET = test_cpp_env_sample
GCOV_TARGET = gcov
LCOV_TARGET = lcov

# sources
SRCDIR = src
OBJDIR = build
DEPDIR = $(OBJDIR)
SRCS = $(wildcard $(SRCDIR)/*.cc)
OBJS = $(subst $(SRCDIR)/,$(OBJDIR)/,$(SRCS:.cc=.o))

# includes
INCLUDES = -I./include
TEST_INCLUDES = -I/usr/local/include

# main
MAINDIR = main
MAIN_SRCS = $(MAINDIR)/main.cc
MAIN_OBJS = $(subst $(MAINDIR)/,$(OBJDIR)/,$(MAIN_SRCS:.cc=.o))
DEPS = $(OBJS:.o=.d) $(MAIN_OBJS:.o=.d)

# lib
LIB_OBJDIR = build/lib
LIB_DEPDIR = $(LIB_OBJDIR)
LIB_OBJS = $(subst $(SRCDIR)/,$(LIB_OBJDIR)/,$(SRCS:.cc=.o))
LIB_DEPS = $(LIB_OBJS:.o=.d)

# test
TEST_SRCDIR = test
TEST_OBJDIR = build/test
TEST_DEPDIR = $(TEST_OBJDIR)
TEST_SRCS = $(wildcard $(TEST_SRCDIR)/*.cc)
TEST_TARGET_OBJS = $(subst $(SRCDIR)/,$(TEST_OBJDIR)/,$(SRCS:.cc=.o))
TEST_TEST_OBJS = $(subst $(TEST_SRCDIR)/,$(TEST_OBJDIR)/,$(TEST_SRCS:.cc=.o))
TEST_DEPS = $(TEST_TARGET_OBJS:.o=.d) $(TEST_TEST_OBJS:.o=.d)

# gcov
GCOV_OBJDIR = build/gcov
GCOV_DEPDIR = $(GCOV_OBJDIR)
GCOV_TARGET_OBJS = $(subst $(SRCDIR)/,$(GCOV_OBJDIR)/,$(SRCS:.cc=.o))
GCOV_TEST_OBJS = $(subst $(TEST_SRCDIR)/,$(GCOV_OBJDIR)/,$(TEST_SRCS:.cc=.o))
GCOV_DEPS = $(GCOV_TARGET_OBJS:.o=.d) $(GCOV_TEST_OBJS:.o=.d)

# lcov
LCOVDIR = lcov
COVERAGE = coverage.info

# doxygen
DOXYGEN = doxygen
DOCDIR = doxygen
INDEXPATH = $(DOXYGEN)/html/index.html

.PHONY: all build install uninstall lib test gcov lcov docs clean 

build: $(MAIN_TARGET)

lib: $(LIB_TARGET)

install:
	@install -d /usr/local/include/$(INCLUDE_DIR) > /dev/null 2>&1
	@install include/$(INCLUDE_DIR)/* /usr/local/include/$(INCLUDE_DIR)/
	@install $(LIB_OBJDIR)/$(LIB_TARGET) /usr/local/lib/
	@ln -sf /usr/local/lib/$(LIB_TARGET) /usr/local/lib/$(LIB_TARGET_BASE)

uninstall:
	@rm -rf /usr/local/include/$(INCLUDE_DIR)
	@rm -f /usr/local/lib/$(LIB_TARGET)
	@rm -f /usr/local/lib/$(LIB_TARGET_BASE)

test: $(TEST_TARGET)

$(LCOV_TARGET): $(GCOV_TARGET)
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

docs:
	$(DOXYGEN)
	@echo $(INDEXPATH)

all: build lib test lcov docs

$(TEST_TARGET): LDFLAGS += $(TEST_LDFLAGS)
$(GCOV_TARGET): LDFLAGS += $(TEST_LDFLAGS)

$(MAIN_TARGET): $(MAIN_OBJS) $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

$(TEST_TARGET): $(TEST_TEST_OBJS) $(TEST_TARGET_OBJS)
	$(LD) -o $@ $^ $(LDFLAGS) 

$(GCOV_TARGET): $(GCOV_TEST_OBJS) $(GCOV_TARGET_OBJS)
	$(LD) $(GCOVFLAGS) -o $(TEST_TARGET) $^ $(LDFLAGS) 
	./$(TEST_TARGET)

$(LIB_TARGET): $(LIB_OBJS)
	$(LD) -shared -o $(LIB_OBJDIR)/$@ $^ $(LDFLAGS)

$(MAIN_TARGET): DEPFLAGS += $(DEPDIR)/$*.d
$(TEST_TARGET): DEPFLAGS += $(TEST_DEPDIR)/$*.d
$(LIB_TARGET): DEPFLAGS += $(LIB_DEPDIR)/$*.d
$(GCOV_TARGET): DEPFLAGS += $(GCOV_DEPDIR)/$*.d

CXXFLAGS += $(DEPFLAGS)

$(GCOV_TARGET): CXXFLAGS += $(GCOVFLAGS)

$(TEST_TARGET): INCLUDES += $(TEST_INCLUDES)
$(GCOV_TARGET): INCLUDES += $(TEST_INCLUDES)

$(OBJS): $(OBJDIR)/%.o: $(SRCDIR)/%.cc $(OBJDIR)/%.d
	@mkdir -p $(dir $(OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(MAIN_OBJS): $(OBJDIR)/%.o: $(MAINDIR)/%.cc $(OBJDIR)/%.d
	@mkdir -p $(dir $(OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(DEPS):

$(LIB_OBJS): $(LIB_OBJDIR)/%.o: $(SRCDIR)/%.cc $(LIB_OBJDIR)/%.d
	@mkdir -p $(dir $(LIB_OBJS))
	$(CXX) $(CXXFLAGS) -fPIC $(OPTIM) $(INCLUDES) -c $< -o $@

$(LIB_DEPS):

$(TEST_TEST_OBJS): $(TEST_OBJDIR)/%.o: $(TEST_SRCDIR)/%.cc $(TEST_OBJDIR)/%.d
	@mkdir -p $(dir $(TEST_TARGET_OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(TEST_TARGET_OBJS): $(TEST_OBJDIR)/%.o: $(SRCDIR)/%.cc $(TEST_OBJDIR)/%.d
	@mkdir -p $(dir $(TEST_TARGET_OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(TEST_DEPS):

$(GCOV_TEST_OBJS): $(GCOV_OBJDIR)/%.o: $(TEST_SRCDIR)/%.cc $(GCOV_OBJDIR)/%.d
	@mkdir -p $(dir $(GCOV_TARGET_OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(GCOV_TARGET_OBJS): $(GCOV_OBJDIR)/%.o: $(SRCDIR)/%.cc $(GCOV_OBJDIR)/%.d
	@mkdir -p $(dir $(GCOV_TARGET_OBJS))
	$(CXX) $(CXXFLAGS) $(OPTIM) $(INCLUDES) -c $< -o $@

$(GCOV_DEPS):

clean:
	@rm -f $(MAIN_TARGET)
	@rm -f $(TEST_TARGET)
	@rm -rf $(OBJDIR)
	@rm -rf $(LCOVDIR)
	@rm -rf $(DOCDIR)

-include $(DEPS) $(TEST_DEPS) $(GCOV_DEPS)
```

### README.md

プロジェクトの説明を記載したファイルです．

## その他のディレクトリ

その他のディレクトリを抜き出すと以下の通りです．

```
|- cpp_env_sample/
   |- scripts/               - 環境構築用スクリプト
```

### scripts ディレクトリ

環境構築用スクリプトとして，Doxygen, Google Test, LCOV のインストールスクリプトを配置しています．    

```
|- cpp_env_sample/
   |- scripts/               - 環境構築用スクリプト
      |- install_doxygen.sh
      |- install_gtest.sh
      |- install_lcov.sh
```
それ以外に，スクリプトを配置する場合は，このディレクトリに配置します．

## まとめ

本ページでは，Makefile を使ったプロジェクトのディレクトリ構成の例を説明しました．

## 参考文献

{{< anchor "cite:1" >}}[1] htakeuchi0, "htakeuchi0/cpp_env_sample: A C++ sample project", https://github.com/htakeuchi0/cpp_env_sample, 2022/10/5 最終アクセス．    
{{< anchor "cite:2" >}}[2] Google, "google/googletest: GoogleTest - Google Testing and Mocking Framework", https://github.com/google/googletest, 2022/10/5 最終アクセス．    
{{< anchor "cite:3" >}}[3] linux-test-project, "linux-test-project/lcov: LCOV", https://github.com/linux-test-project/lcov, 2022/10/5 最終アクセス．    
{{< anchor "cite:4" >}}[4] Doxygen, "Doxygen: Doxygen", https://doxygen.nl/index.html, 2022/10/5 最終アクセス．
