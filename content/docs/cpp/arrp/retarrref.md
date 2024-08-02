---
title: "配列への参照を返却する関数"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 配列への参照を返却する関数

## 概要

[関数ポインタを返却する関数]({{< ref retfp.md >}}) のページでは，C++の関数ポインタを返却する関数の宣言が特徴的であることを述べました．

このページでは，配列への参照を返却する関数の宣言も同様となることをまとめます．

結論からいうと，要素が5個の配列の const 参照を返す，const 修飾されたメンバ関数は，以下のような宣言になります．

```cpp
const double (&A() const)[5];
```

## 配列への参照を返却する関数

いま，クラス `Array` が生の配列 `a_` をもっていて，その配列への const 参照を返す関数を定義したいとします．

もちろん，生の配列の代わりに `std::array` を使ったり，インデックスに対応する要素を返すアクセサを用意したりすれば，その状況にはならないので，実用上は出会うことのないケースと思います．

クラス `Array` を以下のようにします．
要素はデフォルトコンストラクタで指定しておきます．

```cpp
class Array {
public:
  Array() : a_{0, 1, 2, 3, 4} {}

private:
  double a_[5];
};
```

このとき，`a_` の const 参照を返す関数 `A` を定義します．

関数ポインタを返却する関数と同様に，

```cpp
  const double[5]& A() const { return a_; } // NG
```

という書き方はできず，以下のような書き方になります．

```cpp
  const double (&A() const)[5] { return a_; } // OK
```

これは以下のように分解されます．

```
const double (& A () const )[5];
~~~~~~~~~~~~~~~ ==^^ +++++ ~~~~
  |             | |  |_ メンバ関数 A の const 修飾
  |             | |          | 
  |             | |          |
  |             | |_ メンバ関数 A の引数リスト
  |             |        ()  |
  |             |            |
  |             |__ メンバ関数名
  |                   A      |
  |                          |
  |_______ 戻り値の型 _________|
       const double (&)[5]
```

ちなみに，`noexcept` にしたい場合は以下です．

```cpp
  const double (&A() const noexcept)[5] { return a_; } // OK
```

関数ポインタを返却する関数と似ていますが，やはりわかりづらい構文と思います．

## 補足：配列への参照を返却する利点

配列の参照を直接返すので，以下のような処理が可能となります．

```cpp
#include <iostream>

class Array {
public:
  Array() : a_{0, 1, 2, 3, 4} {}
  const double (&A() const noexcept)[5] { return a_; }

private:
  double a_[5];
};

int main() {
  const Array array;
  for (auto&& e : array.A()) {
    std::cout << e << " ";
  }
  std::cout << "\n";

  return 0;
}
```

これは，配列要素の先頭ポインタを返す場合は実現できません．

```cpp
#include <iostream>

class Array {
public:
  Array() : a_{0, 1, 2, 3, 4} {}
  const double *A() const noexcept { return a_; }

private:
  double a_[5];
};

int main() {
  const Array array;
  for (auto&& e : array.A()) {  // Compilation error!
    std::cout << e << " ";
  }
  std::cout << "\n";

  return 0;
}
```

`const double*` を返すと，`array.A()` の `begin`, `end` がわからないので，範囲for文が使えず，以下のようなコンパイルエラーが出ます．

```
main.cc: In function ‘int main()’:
main.cc:15:27: error: ‘begin’ was not declared in this scope; did you mean ‘std::begin’?
   15 |   for (auto&& e : array.A()) {
      |                           ^
      |                           std::begin
```

一方で，配列の参照を直接返せば，`std::begin`, `std::end` が使えるので，先述の通り範囲for文が使えます．

## まとめ

本ページでは，配列への参照を返却する関数について述べました．

例として，要素が5個の配列の const 参照を返す，const修飾されたメンバ関数は，以下のような宣言になることがわかりました．

```cpp
const double (&A() const)[5];
```

わかりやすい構文とは言えないため，標準ライブラリ `std::array` を使うか，要素を直接返すようなアクセサとするのがよいと思われます．
