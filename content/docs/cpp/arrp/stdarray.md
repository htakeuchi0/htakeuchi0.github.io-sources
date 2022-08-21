---
title: "std::array について"
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# std::array について

## 概要

前ページまでで，配列型へのポインタ型や参照型について説明しました．一方で，標準ライブラリには `std::array` 構造体テンプレートがあり，通常の配列のパフォーマンスを保ったまま，サイズの取得などの付随的な機能を利用できます．

## std::array について

`array` ヘッダを include すると，`std::array` が利用できます．
`std::array` の定義は以下のとおりです [[1]](#cite:1)．

```cpp
namespace std {

template <class T, std::size_t N>
struct array;

} // namespace std
```

`std::array` は通常の配列と同等のパフォーマンスで利用できるとされています．通常の配列と異なり，以下のように，変数から配列のサイズが取得できます．よって，`std::array` を使う限り，**前ページで定義した `ArraySize` は不要です**．

```cpp
#include <array>
#include <iostream>

int main() {
  std::array<int, 3> a;
  std::cout << a.size() << "\n"; // 3
  return 0;
}
```

## まとめ

本ページでは，`std::array` について説明しました．`std::array` を使えば，配列から要素数を取得できます．よって，`std::array` を使う限り，前ページで定義した `ArraySize` 関数テンプレートは不要になります．

## 参考文献

{{< anchor "cite:1" >}}[1] cppreference.com, "std::array - cppreference.com", https://en.cppreference.com/w/cpp/container/array, 2022/8/21 最終アクセス.
