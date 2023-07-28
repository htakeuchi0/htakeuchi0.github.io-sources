---
title: "CMake プロジェクト (2)"
weight: 7
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# CMake プロジェクト (2)

## 概要

前ページでは，CMake プロジェクトの基本的な作り方を説明しました．

本ページでは，`make docs` で Doxygen ドキュメントが生成できたり，`make lcov` でカバレッジ計測のレポートが生成できたりするように拡張します．

これらは，`ADD_CUSTOM_TARGET`. `ADD_CUSTOM_COMMAND` を使うと実現できます．

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

以下のような CMakeLists.txt を作成します．

* `./CMakeLists.txt`
  * サブディレクトリを指定し，Doxygen ドキュメント生成コマンドを追加します．

```CMake
cmake_minimum_required(VERSION 3.0)
project(cmake_sample CXX)

add_subdirectory(src)
add_subdirectory(test)
add_subdirectory(main)

find_program(DOXYGEN doxygen)
if (NOT DOXYGEN)
  message(WARNING "program doxygen not found")
endif()

ADD_CUSTOM_TARGET(docs)
ADD_CUSTOM_COMMAND(
  TARGET docs
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  COMMAND doxygen
  COMMAND mv doxygen/ build/)
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
  * GoogleTest を使うための設定事項を記載し，カバレッジ計測実行についてのコマンドを追加します．

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

find_program(GCOV gcov)
if (NOT GCOV)
  message(WARNING "program gcov not found")
endif()

find_program(LCOV lcov)
if (NOT LCOV)
  message(WARNING "program lcov not found")
endif()

if (GCOV AND LCOV)
  set(COVERAGE coverage.info)
  set(LCOVDIR lcov)
  ADD_CUSTOM_TARGET(lcov DEPENDS gtest-${PROJECT_NAME})
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
  ADD_CUSTOM_COMMAND(
    TARGET lcov
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/build/test/CMakeFiles/gtest-${PROJECT_NAME}.dir/
    COMMAND ${PROJECT_SOURCE_DIR}/build/test/gtest-${PROJECT_NAME}
    COMMAND lcov --capture --directory . --output-file ${COVERAGE}
    COMMAND lcov --remove ${COVERAGE} **include/c++/** --output-file ${COVERAGE}
    COMMAND lcov --remove ${COVERAGE} **bits** --output-file ${COVERAGE}
    COMMAND lcov --remove ${COVERAGE} **gtest*.h --output-file ${COVERAGE}
    COMMAND lcov --remove ${COVERAGE} **gtest*.cc --output-file ${COVERAGE}
    COMMAND genhtml ${COVERAGE} --output-directory ${PROJECT_SOURCE_DIR}/build/${LCOVDIR}
    COMMAND rm -f *.gcno
    COMMAND rm -f *.gcda
    COMMAND rm -f ${COVERAGE}
    COMMAND echo -n -e ""
    COMMAND echo ${LCOVDIR}/index.html)
endif()
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

### make docs

以下のコマンドを実行します．

```bash
$ cmake -S . -B build
$ cd build
$ make docs
```

Doxygen ドキュメントが `build/doxygen` 以下に生成され，例えば以下のコマンドで内容が確認できます．

```bash
$ firefox build/doxygen/html/index.html
```

### make lcov

以下のコマンドを実行します．

```bash
$ cmake -S . -B build
$ cd build
$ make lcov
```

カバレッジ計測結果が `build/lcov` 以下に生成され，例えば以下のコマンドで内容が確認できます．

```bash
$ firefox build/lcov/index.html
```

### インストール・アンインストール

CMake では， `make uninstall` が提供されません．    
ここでは，`make install` の説明を省略します．

## まとめ

本ページでは，`ADD_CUSTOM_TARGET`. `ADD_CUSTOM_COMMAND` を使って，CMake プロジェクトで独自コマンドを追加する方法について説明しました．
