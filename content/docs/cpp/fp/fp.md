---
title: "関数ポインタとその周辺"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 関数ポインタとその周辺

## 概要

ポインタ (pointer) とは，メモリアドレスを格納するためのオブジェクトのことです．
C++ では，変数のメモリアドレスはもちろん，関数のエントリーポイントとなるメモリアドレスを格納することができます．

本ページでは，Newton 法という数値解法の実装を例とし，関数ポインタについて説明します．

## Newton 法とその素朴な実装

Newton 法とは，導関数が既知である実数値関数の零点を求める数値解法のひとつです．
近似解を中心に関数を一次近似（接線で近似）し，その一次関数の零点（その接線と 
{{< katex >}}x{{< /katex >}}
軸の交点）に近似解を更新する，という操作を繰り返すことで数値的解を求めます．

具体的にいえば，初期値を {{< katex >}}x_0{{< /katex >}} としたとき，近似解の更新式は，

{{< katex display=true >}}
x_{k+1}=x_k-\frac{f(x_k)}{f'(x_k)},\quad k=0,1,\dots
{{< /katex >}}

となります．

関数 `f`, 導関数 `df` に対して，初期点 `x0` に最も近い零点を求めるための関数 `Newton` の素朴な実装として，以下が考えられます．
ここでは，収束判定条件を {{< katex >}}|f(x_k)|<\epsilon{{< /katex >}} {{< katex >}}(\epsilon>0){{< /katex >}} とし，
最大反復回数 `loop_max` を超えたら収束しなかった旨のエラーを返すようにしています．

```cpp
#include <cmath>
#include <exception>
#include <iostream>

double f(double x) {
  return x*x - 2;
}

double df(double x) {
  return 2*x;
}

double Newton(double x0, double eps=1.0e-10, std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= f(x) / df(x);
    if (std::abs(f(x)) < eps) {
      return x;
    }
  }
  throw std::runtime_error("Convergence error: This method did not converge.");
}

int main() {
  double x0 = 1.0;
  double x = Newton(x0);
  std::cout << x << std::endl;  // 1.41421
  return 0;
}
```

しかし，この実装方法では，対象となる関数 `f` を変えるたびに，関数 `f` の中身を書き換えるか，`Newton` 内の `f` を別の関数に置き換えるかが必要となり，不便です．
特に，複数の関数の零点を求めたい場合，求めるたびにソースコードの書き換えが必要になります．

そこで，`f`, `df` は **引数として与えられないか** を考えます．

## 関数ポインタ

関数を引数として与える方法として，**関数ポインタ** があります．
ポインタとは，メモリアドレスを格納するためのオブジェクトのことです．
C++ では，変数のメモリアドレスはもちろん，関数のエントリーポイトとなるメモリアドレスを格納することもできます．
関数へのポインタを，特に **関数ポインタ** と呼びます．

### 変数へのポインタ

関数ポインタの前に，変数へのポインタについて説明します．
ポインタとは，メモリアドレスを格納するためのオブジェクトのことでした．
たとえば，ポインタを使えば，`int a = 5;` とした変数 `a` のメモリアドレスを格納できます．
`a` のメモリアドレスが `0x1234` と表される場合，

```cpp
int *p = &a;
```

とすると，ポインタ変数 `p` にはアドレス `0x1234` が格納されます．
`int *p` は，`p` は `int` 型へのポインタであることを表します．
`&` はアドレス参照演算子で，`&a` と書くと，変数 `a` のメモリアドレスを返します．
結果として，ポインタ変数 `p` には，`a` のメモリアドレス `0x1234` が格納されます．

`p` に格納されるのはアドレスそのものですが，`*p` とすることでアドレスに書き込まれた値にアクセスできます．
たとえば，

```cpp
*p = 7
```

とすると，`0x1234` に格納された値が7になります．
このとき，変数 `a` を直接変更していませんが，`a` の値は 5 から 7 に変更されます．

ところで，`p` に格納されているのは，メモリアドレスの先頭アドレスだけですが，実際の変数はそこから何バイトかの領域に値が格納されます．
先頭アドレスだけでは何バイト分とってくればよいかわからないですが，`p` が `int` への変数であるので， `int` 型の値を格納するのに必要なバイト数だけとってくればよいとわかります．


### 関数ポインタ

関数ポインタを考える場合，変数へのポインタと同様に，関数の型を考える必要があります．
一般に，`T f(S1, S2,..., Sn)` の関数の型は `T(S1, S2,..., Sn)` です．
ここで，`T` は戻り値の型，`Sk`は第{{< katex >}}k{{< /katex >}} 引数の型です．
例えば，`double f(double x)` の関数の型は `double(double)` です．

関数は変数と異なり，`T(S1, S2,...,Sn) f;` という形ではなく，`T f(S1, S2,...,Sn); `と宣言します．
これにあわせて，関数ポインタ変数 `fp` の宣言は，
```cpp
T (*fp)(S1, S2,...,Sn);
```
となります．
`T *fp(S1, S2,...,Sn)` とすると，`T*(S1, S2,...,Sn)` 型の関数宣言と区別がつかないため，`(*fp)` 部分に括弧をつける仕様となっています．

using キーワードによるエイリアス宣言を使うと，少しだけすっきりさせることができます．
例えば，上記 `fp` の宣言は，

```cpp
using fp_t = T (*)(S1, S2,...,Sn);
fp_t fp;
```

と書けます．
あるいは，

```cpp
using f_t = T(S1, S2,...,Sn);
using fp_t = f_t *;
fp_t fp;
```

や

```cpp
using f_t = T(S1, S2,...,Sn);
f_t *fp;
```

でも同じことです．
たとえば，`double f(double x)` の関数ポインタ型の変数宣言は，それぞれ，

```cpp
using fp_t = double (*)(double);
fp_t fp;
```
```cpp
using f_t = double(double);
using fp_t = f_t *;
fp_t fp;
```
```cpp
using f_t = double(double);
f_t *fp;
```

となります．

`double f(double x)` の場合の関数ポインタへの代入と，関数の実行は，

```cpp
fp_t fp = &f;
double x = (*fp)(1.0);  // -1.0
```

となりますが，

```cpp
fp_t fp = f;
double x = fp(1.0);  // -1.0
```

という略記も認められています．

ちなみに，エイリアス宣言をつかわなければ，それぞれ，

```cpp
double (*fp)(double) = &f;
double x = (*fp)(1.0);  // -1.0
```
```cpp
double (*fp)(double) = f;
double x = fp(1.0);  // -1.0
```
となります．

## 関数ポインタを用いた Newton 法の実装

以上をふまえると，以下のような実装が考えられます．
呼び出す側で，対象となる関数が指定できていることがわかります．

```cpp
#include <cmath>
#include <exception>
#include <iostream>

using fp_t = double (*)(double);

double Newton(fp_t fp, fp_t dfp, double x0, double eps=1.0e-10,
    std::size_t loop_max=1024) {
  double x = x0;
  for (std::size_t i = 0; i < loop_max; i++) {
    x -= fp(x) / dfp(x);
    if (std::abs(fp(x)) < eps) {
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

## まとめ

本ページでは，Newton法の実装を例に，関数ポインタについて説明しました．
関数ポインタを使うことで，Newton法を適用する関数を引数で指定することができます．
