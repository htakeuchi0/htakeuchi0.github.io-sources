---
title: "関数への参照"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 関数への参照

## 概要

前ページまでで，関数ポインタとその周辺事項について説明しました．
本ページでは，関数への参照型について説明します．

## 関数への参照型

戻り値の型が `T`, 第 {{< katex >}}k{{< /katex >}} 番目の引数の型が `Sk` である関数への関数ポインタ型は，

```cpp
using fp_t = T (*)(S1, S2,..., Sn);
```

または，

```cpp
using f_t = T(S1, S2,..., Sn);
using fp_t = f_t*;
```

として定義できるのでした．

ここで，

```cpp
using fref_t = T (&)(S1, S2,..., Sn);
```

または，

```cpp
using f_t = T(S1, S2,..., Sn);
using fref_t = f_t&;
```

とすると，**関数への参照型** をつくることができます．

つまり，下記のコードをコンパイルして実行することができます．

```cpp
#include <cmath>
#include <exception>
#include <iostream>

using fref_t = double (&)(double);

double Newton(fref_t f, fref_t df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f(x) / df(x);
    if (std::abs(f(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Not convergence.");
}

double f(double x) {
  return x*x - 2;
}

double df(double x) {
  return 2*x;
}

int main() {
  double x0 = 1.0;
  double x = Newton(f, df, x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

関数ポインタ版に対するメリットとして，関数が `nullptr` で渡されるおそれがないことが挙げられます．
ただし，`std::function` を使えばその問題は発生しないため，あえて利用することはないと思います．

## まとめ

本ページでは，関数への参照型が定義できることを説明しました．
しかし，`std::function` を用いれば，あえて関数への参照型を利用することはないと思われます．
