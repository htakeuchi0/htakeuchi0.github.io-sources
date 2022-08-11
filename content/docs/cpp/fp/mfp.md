---
title: "メンバ関数ポインタとその周辺"
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# メンバ関数ポインタとその周辺

## 概要

ポインタ (pointer) とは，メモリアドレスを格納するためのオブジェクトのことで，関数のエントリーポイントとなるメモリアドレスを格納できます（関数ポインタ）．

前節は，関数ポインタを利用して，関数を引数にとる関数が実現できることを確認しました．
本ページでは，関数がクラスのメンバ関数の場合にどうなるかについて説明します．

## クラス定義とオブジェクト指向に基づく通常の対応

前節の関数を多項式関数に限定します．
そのため，多項式関数を表すクラス `Polynomial` を以下のように用意したとします．

```cpp
#include <initializer_list>
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
```

このクラスを使う場合，Newton メソッドの呼び出し部分はどうしたらよいでしょうか．
適当に書いてみると以下のようになります．

```cpp
int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  // double x = Newton(f.Eval, df.Eval, x0); ???
  // std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

試しに `f.Eval`. `df.Eval` と書いてみましたが，これらはどちらも `Polynomial::Eval` なので，
関数のエントリーポイントだけで区別できそうにありません．
したがってまず， **関数ポインタで定義した前節の関数は流用できません．**
この場合は，以下のような関数を追加で定義する（オーバロードする）のが正攻法だと思います．

```cpp
double Newton(const Polynomial& f, const Polynomial& df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f.Eval(x) / df.Eval(x);
    if (std::abs(f.Eval(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Not convergence.");
}

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  double x = Newton(f, df, x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

または，値の評価ができる `Evaluate` インタフェースクラスを定義して，以下のようにします．
以下のようにすると，`Polynomial` クラスだけでなく，`double Eval(double)` というメンバ関数をもっているどんなクラスのインスタンスでも受け付けることができます．

```cpp
class Evaluate {
public:
  virtual double Eval(double) const = 0;
};

class Polynomial : public Evaluate {
public:
  Polynomial(std::initializer_list init) : coeffs_(init.begin(), init.end()) {}

  double Eval(double x) const override {
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

double Newton(const Evaluate& f, const Evaluate& df, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f.Eval(x) / df.Eval(x);
    if (std::abs(f.Eval(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Not convergence.");
}
```

## メンバ関数ポインタを用いる方法

ここで，前節に近い方法での実現方法について考えてみます．
関数ポインタでは実現できませんが，メンバ関数のエントリーポイントのアドレスを格納するための言語仕様は存在します．
それは，**メンバ関数ポインタ** と呼ばれるもので，`T C::f(S1, S2,..., Sn)` のメンバ関数ポインタの型は `T (C::*)(S1, S2,..., Sn)` となります．
ここで，`T` は戻り値の型，`Sk`は第{{< katex >}}k{{< /katex >}} 引数の型，`C` はメンバ関数をもつクラスです．
例えば，`double Polynomial::Eval(double x)` のポインタの型は `double (Polynomial::*)(double)` です．

関数ポインタと同様に，メンバ関数ポインタ変数 `mfp` の宣言は，
```cpp
T (C::*mfp)(S1, S2,...,Sn);
```
となります．

これも，using キーワードによるエイリアス宣言を使うと，少しだけすっきりさせることができます．
例えば，上記 `mfp` の宣言は，

```cpp
using mfp_t = T (C::*)(S1, S2,...,Sn);
mfp_t mfp;
```

と書けます．
たとえば，`double Polynomial::Eval(double x) const` の関数ポインタ型の変数宣言は，
```cpp
using mfp_t = double (Polynomial::*)(double) const;
mfp_t mfp;
```
となります．

`double Polynomial::Eval(double x) const` の場合の関数ポインタへの代入と，関数の実行は，

```cpp
Polynomial f = { -2.0, 0.0, 1.0 };
mfp_t mfp = &Polynomial::Eval;
double x = (f.*mfp)(1.0);  // -1.0
```

となります．
どのインスタンスのメンバ関数を呼べばよいかを区別するため，`(f.*mfp)(1.0)` のような書き方になっています．

なお，関数ポインタではいくつかの略記や，別の記法を紹介しましたが，メンバ関数ポインタでは類似の略記や別の記法は認められていないようです．

あえてメンバ関数を用いて `Newton` 関数を書いてみると，以下のようになります．

```cpp
using mfp_t = double (Polynomial::*)(double) const;

double Newton(const Polynomial& f, const Polynomial& df, mfp_t mfp,
    double x0, double eps=1.0e-10, std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= (f.*mfp)(x) / (df.*mfp)(x);
    if (std::abs((f.*mfp)(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Not convergence.");
}

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  double x = Newton(f, df, &Polynomial::Eval, x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

ここで，**double 型の値を受け付けて double 型の値を返す機能をもったクラスのオブジェクトなら何でも受け付けられるように**，`Polynomial` としたところをテンプレートにしたいと思います．

まず，using キーワードによるエイリアス宣言ですが，**テンプレート化可能です**．

```cpp
template <class T>
using tmfp_t = double (T::*)(double) const;
```

これをもとに，`Newton` 関数を関数テンプレートにすると，以下のようになります．

```cpp
#include <cmath>
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
using tmfp_t = double (T::*)(double) const;

template <class T>
double Newton(const T& f, const T& df, tmfp_t<T> tmfp,
    double x0, double eps=1.0e-10, std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= (f.*tmfp)(x) / (df.*tmfp)(x);
    if (std::abs((f.*tmfp)(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Not convergence.");
}

int main() {
  Polynomial f = { -2.0, 0, 1.0 };
  Polynomial df = { 0.0, 2.0 };

  double x0 = 1.0;
  double x = Newton(f, df, &Polynomial::Eval, x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

これで，仮に `double C::Call(double) const` メンバ関数をもつ別のクラス `C` が追加されても，`Newton(f, df, &C::Call, x0)` のように呼び出せるようになりました．

## まとめ

本ページでは，Newton法の実装を例に，メンバ関数ポインタについて説明しました．
前節では，静的な関数のみを対象にしましたが，メンバ関数ポインタを使うことで，メンバ関数を指定させることができます．
