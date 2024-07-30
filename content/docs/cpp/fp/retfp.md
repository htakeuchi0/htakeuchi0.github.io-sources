---
title: "関数ポインタを返却する関数"
weight: 5
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 関数ポインタを返却する関数

## 概要

前ページまでで，関数ポインタを引数にとる関数を例示しました．

本ページでは，逆に関数ポインタを返却する関数について述べます．

結論からいうと，文字列を受け取って，`(double, double) -> double` の関数へのポインタを返す関数は，以下のような（奇妙な）宣言になります．

```cpp
double (*From(const std::string& label))(double, double);
```

## 文字列に対応する関数を返却する関数（オブジェクト指向）

いま，`"ADD", "SUB"` という文字列を指定したら，その文字列に対応する関数を返却する関数を考えます．

オブジェクト指向プログラミングでは，以下のような実装が考えられます．

```cpp
#include <iostream>
#include <memory>

class Operator {
public:
  virtual ~Operator() {}
  virtual double Compute(double, double) const = 0;
};

class Add : public Operator {
public:
  double Compute(double a, double b) const override { return a + b; }
};

class Sub : public Operator {
public:
  double Compute(double a, double b) const override { return a - b; }
};

std::unique_ptr<Operator> From(const std::string& label) {
  if (label == "ADD") {
    return std::make_unique<Add>();
  }

  if (label == "SUB") {
    return std::make_unique<Sub>();
  }

  throw std::invalid_argument("Not implemented.");
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add->Compute(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub->Compute(3, 2) << "\n";
  return 0;
}
```

インタフェースクラス `Operator` が `Compute` メソッドの実装を要求し，移譲された継承クラスの実装関数で，それぞれ具体的なロジックを定義しています．

`From` 関数では，スマートポインタを利用して，指定された文字列に対応するオブジェクトをヒープ領域上に生成して返しています．

## 文字列に対応する関数を返却する関数（標準ライブラリ）

もっと軽量に，ラムダ式で直接関数を返す場合を考えると以下のようになります．

```cpp
#include <iostream>
#include <functional>

std::function<double(double, double)> From(const std::string& label) {
  if (label == "ADD") {
    return [](double a, double b) { return a + b; };
  }

  if (label == "SUB") {
    return [](double a, double b) { return a - b; };
  }

  throw std::invalid_argument("Not implemented.");
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub(3, 2) << "\n";
  return 0;
}
```

実用上はこれで十分でしょうか．

ラムダ式を使わず，事前に定義された関数を返す場合は以下のとおりです．

```cpp
#include <iostream>
#include <functional>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

std::function<double(double, double)> From(const std::string& label) {
  if (label == "ADD") {
    return Add;
  }

  if (label == "SUB") {
    return Sub;
  }

  throw std::invalid_argument("Not implemented.");
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub(3, 2) << "\n";
  return 0;
}
```

このときの戻り値は `std::function<double(double, double)>` で，これは `(double, double)` を引数にとり，`double` を返す関数の型を表します．

## 文字列に対応する関数を返却する関数（using キーワードによるエイリアス宣言）

標準ライブラリを利用しましたが，関数ポインタで表現するとどのようになるでしょうか．

関数ポインタの型は，どのように変数を宣言するかを考えるとわかりやすいと思います．
つまり，
```cpp
double Function(double, double);
```
という関数のポインタ変数は，
```cpp
double (*f)(double, double);
```
と宣言するのでした．

よって，以下のソースコードはコンパイルできて，意図通りに実行できます．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

int main() {
  double (*add)(double, double);
  add = &Add;
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  double (*sub)(double, double);
  sub = &Sub;
  std::cout << 3 << " + " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}
```

using キーワードによるエイリアス宣言を使うと，以下のようになります．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

int main() {
  using Operator = double(double, double);

  Operator *add = &Add;
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  Operator *sub = &Sub;
  std::cout << 3 << " + " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}
```

以下のようにも書けます．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

int main() {
  using OperatorPointer = double (*)(double, double);

  OperatorPointer add = &Add;
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  OperatorPointer sub = &Sub;
  std::cout << 3 << " + " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}
```

話を戻すと，using キーワードによるエイリアス宣言を使うと，以下のように書けることになります．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

using OperatorPointer = double (*)(double, double);

OperatorPointer From(const std::string& label) {
  if (label == "ADD") {
    return &Add;
  }

  if (label == "SUB") {
    return &Sub;
  }

  throw std::invalid_argument("Not implemented.");
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}

```

## 文字列に対応する関数を返却する関数（関数ポインタ）

ここからが本題です．

それでは，標準ライブラリを使わず，using キーワードによるエイリアス宣言も使わない場合，どのようになるのでしょうか．

関数ポインタの変数は
```cpp
double (*)(double, double) f; // NG
```
と**書けず**，
```cpp
double (*f)(double, double); // OK
```
となるのでした．

同様に，関数ポインタを返す関数の場合も 
```cpp
double (*)(double, double) From(const std::string& label); // NG
```
とは**書けません．**

結論からいうと，以下のようになります．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }

double (*From(const std::string& label))(double, double) {
  if (label == "ADD") {
    return &Add;
  }

  if (label == "SUB") {
    return &Sub;
  }

  throw std::invalid_argument("Not implemented.");
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}
```

`From` 関数の宣言部分が以下のような奇妙な形になっています．

```cpp
double (*From(const std::string& label))(double, double);
```

これは以下のように分解されます．

```
double (* From (const std::string& label) )(double, double);
~~~~~~~~~ ^^^^ ========================== ~~~~~~~~~~~~~~~~~
  |        |     |_ 関数 From　の引数リスト         |
  |        |         (const std::string& label)  |
  |        |                                     |
  |        |__ 関数名                             |
  |             From                             |
  |                                              |
  |__________________ 戻り値の型 __________________|
              double (*)(double, double)
```

関数ポインタの変数宣言と統一されているといえますが，わかりやすい構文とはいえないと思いますので，標準ライブラリ `std::function` を使うか，using キーワードによるエイリアス宣言を利用するのがよいと思われます．

ちなみに，`From` の `noexcept` とする場合は，以下のようになります．

```cpp
#include <iostream>

double Add(double a, double b) { return a + b; }
double Sub(double a, double b) { return a - b; }
double None(double, double) { return 0.0; }

double (*From(const std::string& label) noexcept)(double, double) {
  if (label == "ADD") {
    return &Add;
  }

  if (label == "SUB") {
    return &Sub;
  }

  return &None;
}

int main() {
  auto add = From("ADD");
  std::cout << 3 << " + " << 2 << " = " << add(3, 2) << "\n";

  auto sub = From("SUB");
  std::cout << 3 << " - " << 2 << " = " << sub(3, 2) << "\n";

  return 0;
}
```

これは，以下のように解釈されます．

```
double (* From (const std::string& label) noexcept )(double, double);
~~~~~~~~~ ^^^^ ========================== ******** ~~~~~~~~~~~~~~~~~
  |        |     |                         |_ 関数 From の修飾  |
  |        |     |                                            |
  |        |     |_ 関数 From　の引数リスト                      |
  |        |         (const std::string& label)               |
  |        |                                                  |
  |        |__ 関数名                                          |
  |             From                                          |
  |                                                           |
  |__________________ 戻り値の型 _______________________________|
              double (*)(double, double)
```

解釈は可能といえば可能ですが，やはり奇妙な形に見えます．

## まとめ

本ページでは，逆に関数ポインタを返却する関数について述べました．

例として，文字列を受け取って，`(double, double) -> double` の関数へのポインタを返す関数は，以下のような宣言になることがわかりました．

```cpp
double (*From(const std::string& label))(double, double);
```

わかりやすい構文とはいえないため，標準ライブラリ `std::function` を使うか，using キーワードによるエイリアス宣言を利用するのがよいと思われます．

なお，これは配列へのポインタや参照を返す関数でも同じような書き方になります．
