---
title: "CMake プロジェクト (1)"
weight: 6
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# CMake プロジェクト (1)

## 概要

前ページまでで，autoconf プロジェクトの作成方法を説明しました．

本ページでは，CMake プロジェクトの作成方法を説明します．

まずは，実行可能ファイルと Google Test が可能なものを作成します．

## Github リポジトリ

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
また，`scripts/install_gtest.sh` は不要のため削除しておきます．

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
   |  |- install_lcov.sh
   |
   |- src/                   - ソースファイル
   |  |- example.cc
   |
   |- test/                  - テストファイル
      |- gtest_example.cc
```

## CMakeLists.txt の作成

autoconf では `Makefile.am` を作成しましたが，CMake では CMakeLists.txt を作成します．

* `./CMakeLists.txt`
  * サブディレクトリを指定するだけです．

```CMake
cmake_minimum_required(VERSION 3.0)
project(cmake_sample CXX)

add_subdirectory(src)
add_subdirectory(test)
add_subdirectory(main)
```

* `main/CMakeLists.txt`
  * ソースコードとリンクするライブラリを指定します．

```CMake
add_executable(cmsample main.cc)
target_link_libraries(cmsample cmsampleimpl)
```

* `src/CMakeLists.txt`
  * ソースコードを指定し，ライブラリを作成します．

```CMake
add_library(cmsampleimpl SHARED example.cc)
target_include_directories(cmsampleimpl
  PUBLIC ${PROJECT_SOURCE_DIR}/include
)
```

* `test/CMakeLists.txt`
  * GoogleTest を使うための設定事項を記載します．

```CMake
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/5376968f6948923e2411081fd9372e71a59d8e77.zip
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

add_executable(gtest-${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/src/example.cc ${PROJECT_SOURCE_DIR}/test/gtest_example.cc)
target_link_libraries(gtest-${PROJECT_NAME} gtest_main)
target_include_directories(gtest-${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)
add_test(COMMAND gtest-${PROJECT_NAME})
enable_testing()
```

ここまでで以下のファイル構成となっているはずです．    
autoconf プロジェクトと異なり，CMakeLists.txt がいくつか追加されているだけです．

```
|- cpp_env_sample/
   |- CMakeLists.txt
   |- Doxyfile               - doxygen設定ファイル
   |- LICENSE                - ライセンスファイル
   |- README.md              - READMEファイル
   |- include/               - ヘッダファイル
   |  |- cpp_env_sample/
   |     |- example.h
   |
   |- main/                  - メインファイル
   |  |- CMakeLists.txt
   |  |- main.cc
   |
   |- scripts/               - 環境構築用スクリプト
   |  |- install_doxygen.sh
   |  |- install_lcov.sh
   |
   |- src/                   - ソースファイル
   |  |- CMakeLists.txt
   |  |- example.cc
   |
   |- test/                  - テストファイル
   |  |- CMakeLists.txt
      |- gtest_example.cc
```

## 動作確認

この状態で以下のコマンドを実行します．

```bash
$ cmake -S . -B build
$ cmake --build build
```

1行目のコマンドで，`build` ディレクトリが生成されます．

生成されたバイナリファイルを実行します．

```bash
$ build/main/cmsample
Usage: build/main/cmsample <name> <value> <value2>
$ build/main/cmsample a 1 2
name : a
value: 3
```

実行できました．

### テストの実行

ここまでで，実行可能なテストファイルは生成されているので，実行できるかを確認します．

```bash
$ cd build
$ test/gtest-cmake_sample 
Running main() from /home/hiroshi/Documents/cpp/cmake_sample/build/_deps/googletest-src/googletest/src/gtest_main.cc
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

### インストール・アンインストール

CMake では， `make uninstall` が提供されません．    
ここでは，`make install` の説明を省略します．

## まとめ

本ページでは，CMake プロジェクトの作り方について説明しました．     
もとの Makefile プロジェクトにあって，本 CMake プロジェクトにないものは，次ページ以降で説明します．
