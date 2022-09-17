---
title: "std::function とその周辺"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# std::function とその周辺

## 概要

前ページまでは，関数ポインタやメンバ関数ポインタについて説明しました．本ページでは，標準ライブラリ `std::function` を利用する方法について説明します．

実用上は `std::function` を使う方法で十分と思います．

## std::function について

`functional` ヘッダを include すると，`std::function` が利用できます．
`std::function` の定義は以下のとおりです [[1]](#cite:1)．
テンプレートクラスですが，テンプレートの特殊化によって，関数型のみが受け付けられるようになっています．

```cpp
template <class>
class function;     /* undefined */

template <class R, class... Args>
class function<R(Args...)>;
```

まず，`Args...` は可変テンプレート引数の型を表します．
よって，`R(Args...)` は 戻り値の型が `R` で，引数の型が `Args...` である関数の型です．
したがって，`Newton` 関数を以下のように定義しておけば，`f`, `df` は関数を渡せます．

```cpp
#include <cmath>
#include <functional>

using func_t = std::function<double(double)>;

double Newton(func_t f, func_t df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f(x) / df(x);
    if (std::abs(f(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}
```

たとえば，

```cpp
#include <cmath>
#include <functional>
#include <iostream>

using func_t = std::function<double(double)>;

double Newton(func_t f, func_t df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f(x) / df(x);
    if (std::abs(f(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
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

という形で呼べます．

## ラムダ式

C++ は **ラムダ式** という機能をもっています．
ラムダ式というのは，簡易的な関数オブジェクトをその場で定義するための機能です．
これまで定義していた関数 `f` に同等のラムダ式は `[](double x) { return x*x - 2.0; }` となります．

`std::function` で定義した `Newton` 関数ではラムダ式を引数に渡すことができます．
実行例は以下のようになります．

```cpp
// 同上のため略

int main() {
  double x0 = 1.0;
  double x = Newton([](double x) { return x*x - 2.0; }, [](double x){ return 2.0*x; }, x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

ただし，ラムダ式は関数ポインタ型変数に代入できるため，`Newton` 関数の引数を関数ポインタとした場合でも，ラムダ式で指定することができます．

## メンバ関数の場合

メンバ関数の場合は，`std::bind` を利用すると，`Newton` 関数を変更せずに呼べます．
`std::bind(&Polynomial::Eval, f, _1)` は `f.Eval(_1)` に相当する関数オブジェクトを返します．
`_1` はプレースホルダであり，あとから値を指定できます．

```cpp
// 同上のため略

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  using std::placeholders::_1;
  double x = Newton(std::bind(&Polynomial::Eval, f, _1),
    std::bind(&Polynomial::Eval, df, _1), x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

メンバ関数を直接 `std::function` 型に代入するには，

```cpp
std::function<double(const Polynomial&, double)> func = &Polynomial::Eval;
```

とすれば可能です．
つまり，第1引数にオブジェクトを指定できるようにするということです．
今回の場合は，オブジェクト自体を更新しないので，`const Polynomial&` としておきます．

呼び出すときは，

```cpp
Polynomial f = { -2.0, 0.0, 1.0 };
func(f, 1.0); // f.Eval(1.0) = -1.0
```

または，コンストラクタに渡す値を指定して，

```cpp
func({ -2.0, 0.0, 1.0 }, 1.0); // f.Eval(1.0) = -1.0
```

で呼べます．

これを利用して `Newton` 関数に直接メンバ関数ポインタを渡せるようにするには，メンバ関数ポインタを使ったときと同様，以下のように書けばよいです．

```cpp
#include <cmath>
#include <functional>

template <class T>
using mfunc_t = std::function<double(const T&, double)>;

template <class T>
double Newton(const T& f, const T& df, mfunc_t<T> eval, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= eval(f, x) / eval(df, x);
    if (std::abs(eval(f, x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}
```

呼び出すときは以下のようになりますが，関数テンプレートとした関係で，明示的に `mfunc_t<Polynomial>` クラスのコンストラクタでオブジェクトを作って渡す必要があります．

```cpp
#include <cmath>
#include <functional>
#include <initializer_list>
#include <iostream>
#include <vector>

/**
 * @brief 多項式関数を表すクラス．
 *
 * 例えば f(x) = x^2 - 2 の表現と f(1.0) の計算は以下のようにできる．
 *
 * Polynomial f = { -2, 0, 1 };      // x^2 - 2 = -2 + 0x + 1x^2
 * std::cout << f.Eval(1.0) << "\n"; // -1.0 (=f(1.0))
 */
class Polynomial {
public:
  Polynomial(std::initializer_list<double> init) : coeffs_(init.begin(), init.end()) {}

  double Eval(double x) const {
    auto iter = coeffs_.crbegin();
    double y = 0.0;
    while (iter != coeffs_.crend()) {
      y = y*x + (*iter++);
    }
    return y;
  };

private:
  std::vector<double> coeffs_;
};

template <class T>
using mfunc_t = std::function<double(const T&, double)>;

template <class T>
double Newton(const T& f, const T& df, mfunc_t<T> eval, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= eval(f, x) / eval(df, x);
    if (std::abs(eval(f, x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  double x = Newton(f, df, mfunc_t<Polynomial>(&Polynomial::Eval), x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

`std::mem_fn` を使って，メンバ関数を明示的に関数オブジェクトに変換しても可能です．
`mfunc_t<Polynomial>` クラスのコンストラクタを呼ぶ必要があるのは同様です．
この場合は，あえて `std::mem_fn` を使うメリットがないかもしれません．

```cpp
// 同上のため略

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  double x = Newton(f, df, mfunc_t<Polynomial>(std::mem_fn(&Polynomial::Eval)), x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

以上をまとめると，以下のようになります．

```cpp
#include <cmath>
#include <functional>
#include <initializer_list>
#include <iostream>
#include <vector>

using func_t = std::function<double(double)>;

double Newton(func_t f, func_t df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f(x) / df(x);
    if (std::abs(f(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}


/**
 * @brief 多項式関数を表すクラス．
 *
 * 例えば f(x) = x^2 - 2 の表現と f(1.0) の計算は以下のようにできる．
 *
 * Polynomial f = { -2, 0, 1 };      // x^2 - 2 = -2 + 0x + 1x^2
 * std::cout << f.Eval(1.0) << "\n"; // -1.0 (=f(1.0))
 */
class Polynomial {
public:
  Polynomial(std::initializer_list<double> init) : coeffs_(init.begin(), init.end()) {}

  double Eval(double x) const {
    auto iter = coeffs_.crbegin();
    double y = 0.0;
    while (iter != coeffs_.crend()) {
      y = y*x + (*iter++);
    }
    return y;
  };

private:
  std::vector<double> coeffs_;
};

template <class T>
using mfunc_t = std::function<double(const T&, double)>;

template <class T>
double Newton(const T& f, const T& df, mfunc_t<T> eval, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= eval(f, x) / eval(df, x);
    if (std::abs(eval(f, x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}

double f(double x) {
  return x*x - 2;
}

double df(double x) {
  return 2*x;
}

int main() {
  {
    // 関数
    double x0 = 1.0;
    double x = Newton(f, df, x0);
    std::cout << x << std::endl;  // 1.41421
  }

  {
    // ラムダ式
    double x0 = 1.0;
    double x = Newton([](double x) { return x*x - 2.0; }, [](double x){ return 2.0*x; }, x0);
    std::cout << x << std::endl;  // 1.41421
  }

  {
    // メンバ関数 (1)
    Polynomial f = { -2.0, 0, 1.0 };
    Polynomial df = { 0.0, 2.0 };

    double x0 = 1.0;
    double x = Newton(f, df, mfunc_t<Polynomial>(&Polynomial::Eval), x0);
    std::cout << x << std::endl;  // 1.41421
  }

  {
    // メンバ関数 (2)
    Polynomial f = { -2.0, 0, 1.0 };
    Polynomial df = { 0.0, 2.0 };

    double x0 = 1.0;
    double x = Newton(f, df, mfunc_t<Polynomial>(std::mem_fn(&Polynomial::Eval)), x0);
    std::cout << x << std::endl;  // 1.41421
  }

  return 0;
}
```


## まとめ

本ページでは，`std::function` およびその周辺の標準機能について説明しました．
関数ポインタやメンバ関数ポインタを利用する方法は，すべて標準ライブラリの機能で実現できます．

## 参考文献

{{< anchor "cite:1" >}}[1] cppreference.com, "std::function - cppreference.com", https://en.cppreference.com/w/cpp/utility/functional/function, 2022/8/9 最終アクセス.
