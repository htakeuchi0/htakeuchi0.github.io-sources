---
title: "行列積の計算時間"
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 行列積の計算時間

## 概要

行列の積は2重のfor文で計算できますが，プログラムでの行列の表現方法にはいくつかの選択肢があります．
本節では，行列の表現方法や，行列積の計算手順などによって，実行時間にどのような差がでるかを実験的に確認します．

目次は以下のとおりです．

1. [行列を表現するデータ構造と行列積の計算時間]({{< ref "./basic.md" >}})
1. [行列積の計算時間のOpenMPによる高速化]({{< ref "./openmp.md" >}})
1. [行列積の計算時間のCPU拡張命令による高速化]({{< ref "./avx.md" >}})

実験用に使ったプログラムは以下に配置しています．
* https://github.com/htakeuchi0/mmul-gcc-sample
