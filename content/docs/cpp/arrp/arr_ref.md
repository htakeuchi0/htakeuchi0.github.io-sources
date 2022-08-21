---
title: "配列への参照"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 配列への参照

## 概要

前ページまでで，配列へのポインタ，特に配列型へのポインタ型について説明しました．ここで，配列型へのポインタ型とは，そのポインタ型の変数に対して `*` 演算子で値を得ると，要素ではなく，配列そのものが得られるようなポインタ型を指すものとします．本ページでは，配列型への参照型について説明します．

## 配列型への参照型

クラス `T` の要素数 `N` の配列型へのポインタ変数 `p_arr` の宣言は，

```cpp
using p_arr_t = T (*)[N];
```
または，

```cpp
using arr_t = T[N];
using p_arr_t = arr_t *;
```

として定義できるのでした．

ここで，

```cpp
using arr_ref_t = T (&)[N];
```

または，

```cpp
using arr_t = T[N];
using arr_ref_t = arr_t&;
```

とすると，**配列型への参照型** をつくることができます．

これを利用すると，前ページで説明した `ArraySize` 関数テンプレートを参照型で定義できるため，呼び出し側で `&` をつけずに利用できるようになります．

具体的には，以下のようにできます．

```cpp
#include <cstddef>
#include <iostream>

template <class T, std::size_t N>
std::size_t ArraySize(T (&)[N]) {
  return N;
}

int main() {
  int arr[100];
  std::cout << ArraySize(arr) << "\n"; // 100

  double arr2[1024];
  std::cout << ArraySize(arr2) << "\n"; // 1024

  return 0;
}
```

## まとめ

本ページでは，配列型への参照型が定義できることを説明しました．配列型へのポインタ型でなく，配列型への参照型を利用すると，前ページの `ArraySize` 関数テンプレートの呼び出し方を，少しだけ簡単にできます．
