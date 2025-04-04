---
title: "MariaDB で Newton 法の計算をする方法"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# MariaDB で Newton 法の計算をする方法

## 概要

**MariaDB** [[1]](#cite:1)[^1] はデータベース管理システムのひとつで，MySQL と呼ばれる歴史あるデータベース管理システムの派生として開発されているものです．
[^1]:以下本ページのURLリンクは同リンク先のページを参照しています．

**Newton 法** は非線形方程式の解を反復によって数値計算するための方法です．求める解の近くでは高速に解に収束する性質をもち，広く使われています．具体的にいえば，微分可能な関数 {{< katex >}}f:\mathbb{R}\to\mathbb{R}{{< /katex >}} について，適当な初期値 {{< katex >}}x^{(0)}\in\mathbb{R}{{< /katex >}} を与えて，{{< katex >}}x^{(k+1)}=x^{(k)}-f(x^{(k)})/f'(x^{(k)}){{< /katex >}} {{< katex >}}(k=0,1,\dots){{< /katex >}} として解を更新する方法です．

本ノートの作成者は，データベースの初心者です．データベース管理システムに慣れるため，MariaDB でこの Newton 法を動かしてみようと思います．

まずは，MariaDB のドキュメントを参考に，SQL の主要なキーワードである `SELECT` や `WITH` で何ができるのかを確認します．次に，`WITH RECURSIVE` というキーワードで再帰処理ができることを確認します．最後にこれらを組み合わせて，方程式 {{< katex >}}x^2-2=0{{< /katex >}} の正の解を Newton 法で計算することで {{< katex >}}\sqrt{2}{{< /katex >}} を求めます．

## SQLの文法

データベース管理システムにおいて，データの操作や定義を行うための言語を **SQL** といいます．
統一標準規格が存在しますが，具体的な文法はデータベース管理システムごとに微妙な差があります．
本節では，Newton 法を動かすために使う **MariaDB の** SQL の文法をまとめます．

### SELECT

MariaDB では加法の演算ができて，`SELECT` を使ってその結果が確認できます．    
https://mariadb.com/kb/en/addition-operator/

```sql
SELECT 3+5;
+-----+
| 3+5 |
+-----+
|   8 |
+-----+
```


これは式 `3 + 5` の評価結果が `8` ということなのだと思います．

これをより単純化した例として， `SELECT 1;` を実行したところこうなりました．
```sql
SELECT 1;
+---+
| 1 |
+---+
| 1 |
+---+
```

これは式 `1` の評価結果が `1` ということなのだと思います．

この仕様について，SELECT 文の説明ページでは明示的に述べられてはいませんでした．
BNF記法による説明はありますが，`select_expr` の定義まで詳細に書かれていません．    
https://mariadb.com/kb/en/select/

なお，`AS` で別名を付けられるので，こんなことができます．
標準的ではありませんが，本ページではこれを {{< katex >}}x=1{{< /katex >}} という式のSQLにおける表現と捉えておきます．
```sql
SELECT 1 AS x;
+---+
| x |
+---+
| 1 |
+---+
```

この表を `T` とおいて，表 `T` の列 `x` の値を選択するSQL文は `FROM` を使って以下のように書けます．
```sql
SELECT 
  x
FROM
  (SELECT 1 AS x) AS T;
+---+
| x |
+---+
| 1 |
+---+
```

表が2つあっても同様です．

```sql
SELECT 
  x, y
FROM
  (SELECT 1 AS x) AS T1,
  (SELECT 2 AS y) AS T2;
+---+---+
| x | y |
+---+---+
| 1 | 2 |
+---+---+

```

### WITH

`WITH` は以下の構文で使えます．    
https://mariadb.com/kb/en/with/

```sql
WITH [RECURSIVE] table_reference [(columns_list)] AS  (
  SELECT ...
)
[CYCLE cycle_column_list RESTRICT]
SELECT ...
```

前節の例は `WITH` を使って表現できます．

```sql
WITH T AS (
  SELECT 1 AS x
)
SELECT 
  x
FROM
  T;
+---+
| x |
+---+
| 1 |
+---+
```

テーブルが2つの場合も同様に `WITH` を使って表現できます．

```sql
WITH T1 AS (
  SELECT 1 AS x
),
T2 AS (
  SELECT 2 AS y
)
SELECT
  x, y
FROM
  T1, T2;
+---+---+
| x | y |
+---+---+
| 1 | 2 |
+---+---+

```

`columns_list` を使うとこう書けます．

```sql
WITH T1 (x) AS (
  SELECT 1
),
T2 (y) AS (
  SELECT 2
)
SELECT
  x, y
FROM
  T1, T2;
+---+---+
| x | y |
+---+---+
| 1 | 2 |
+---+---+
```

`WITH` を使って作られる一時的なテーブルまたはそれに対するクエリを **共通テーブル式** (Common Table Expression, **CTE**) と呼ぶようです．    
https://mariadb.com/kb/en/with/

### UNION

2つの表を結合するには `UNION` というキーワードを使います．    
https://mariadb.com/kb/en/union/

`UNION` を使って `(1, 1)`, `(1, 2)` というレコードをこの順に結合すると以下のようになります．
```sql
SELECT 1 AS x, 1 AS y
UNION
SELECT 1, 2;
+---+---+
| x | y |
+---+---+
| 1 | 1 |
| 1 | 2 |
+---+---+
```

2つの行が完全に一致すると追加されません．
`UNION` は重複行を削除します．
```sql
SELECT 1 AS x, 1 AS y
UNION
SELECT 1, 1;
+---+---+
| x | y |
+---+---+
| 1 | 1 |
+---+---+
```

`UNION` の代わりに `UNION ALL` を使うと削除されません．
```sql
SELECT 1 AS x, 1 AS y
UNION ALL
SELECT 1, 1;
+---+---+
| x | y |
+---+---+
| 1 | 1 |
| 1 | 1 |
+---+---+
```

### WITH RECURSIVE

`WITH` で紹介した共通テーブル式 (CTE) ですが，`RECURSIVE` というキーワードを使うと，CTE を再帰的に参照することができるようです．    
https://mariadb.com/kb/en/recursive-common-table-expressions-overview/

このページの説明によると，

```sql
with recursive R as (
  select anchor_data
  union [all]
  select recursive_part
  from R, ...
)
select ...
```

とすると，以下のように処理されるようです．
1. `anchor_data` を計算する．
2. 新しいデータを取得するために `recursive_part` を計算する．
3. 新しいデータが空でなければ2に戻る．

例えば，以下のように `WITH RECURSIVE` を使って {{< katex >}}n=1,2,\dots,10{{< /katex >}} に対応するテーブルを生成できます．

```sql
WITH RECURSIVE T (n) AS (
  SELECT
    1
  UNION ALL
  SELECT
    n + 1
  FROM
    T
  WHERE
    n < 10
)
SELECT
  n
FROM
  T;
+------+
| n    |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
|    5 |
|    6 |
|    7 |
|    8 |
|    9 |
|   10 |
+------+
```

これを一般の等差数列に拡張します．
つまり，{{< katex >}}a_n=a+(n-1)d,\ n=1,2,\dots,n_{\mathrm{max}}{{< /katex >}} を計算します．
{{< katex >}}n\ge2{{< /katex >}} ならば {{< katex >}}a_n=a_{n-1}+d{{< /katex >}} であることを使います．
ここでわかりやすさのため，{{< katex >}}a,d,n_{\mathrm{max}}{{< /katex >}} は設定値とみなして，これらをひとつの共通テーブル式 `Config` で表現することにします．

これらをふまえて {{< katex >}}a=2,d=3,n_{\mathrm{max}}=8{{< /katex >}} の場合の SQL 文を考えると以下のようになります．
```sql
WITH RECURSIVE T (n, a_n) AS (
  SELECT
    1, a
  FROM
    Config
  UNION ALL
  SELECT
    n + 1, a_n + d
  FROM
    T, Config
  WHERE
    n < n_max
),
Config (a, d, n_max) AS (
  SELECT 2, 3, 8
)
SELECT n, a_n FROM T;
+------+------+
| n    | a_n  |
+------+------+
|    1 |    2 |
|    2 |    5 |
|    3 |    8 |
|    4 |   11 |
|    5 |   14 |
|    6 |   17 |
|    7 |   20 |
|    8 |   23 |
+------+------+
```

## Newton 法の計算

前節より，`WITH RECURSIVE` を利用すると再帰処理ができることがわかりました．
そこで，本節では，`WITH RECURSIVE` を使って MariaDB で Newton 法を実行してみます．
SQL 文は等差数列の場合と同様に作れます．

まず，Newton 法とは，
{{< katex display=true >}}
  x^{(k+1)}=x^{(k)}-\frac{f(x^{(k)})}{f'(x^{(k)})},\quad k=0,1,\dots
{{< /katex >}}
の形で近似解を更新する計算法でした．
このままでは計算が終わらないので，適当な基準で反復を停止する必要があります．
そこで，{{< katex >}}\theta>0,k_{\mathrm{max}}>0{{< /katex >}} に対して，収束判定条件を {{< katex >}}k\ge1{{< /katex >}} のとき {{< katex >}}|x^{(k)}-x^{(k-1)}|/|x^{(k-1)}|<\theta{{< /katex >}} として，最大反復回数を {{< katex >}}k_{\mathrm{max}}{{< /katex >}} とします．
これは，ほとんど解が更新されなくなったか最大反復回数に達したら反復を終了するということになります．
ここで，{{< katex >}}k\ge1{{< /katex >}} ならば，
{{< katex display=true >}}
  \frac{|x^{(k)}-x^{(k-1)}|}{|x^{(k-1)}|}=\frac{|f(x^{(k-1)})/f'(x^{(k-1)})|}{|x^{(k-1)}|}
{{< /katex >}}
であることに注意してください．

収束したときの値が取得できる SQL 文を作るものとして，具体的な SQL 文を考えます．

まず， `Newton` という共通テーブル式を用意します．
この `Newton` は列 `k, x, err, converged` をもつものとします．
定義は以下のとおりです．

|列       |型      |意味|
|---------|--------|----|
|k        |INT  |反復回数を表すインデックス {{< katex >}}k{{< /katex >}}.|
|x        |DOUBLE  |第 {{< katex >}}k{{< /katex >}}近似解 {{< katex >}}x^{(k)}{{< /katex >}}.|
|err      |DOUBLE  |第 {{< katex >}}k{{< /katex >}}近似解における直前の近似解との相対誤差{{< katex >}}|x^{(k)}-x^{(k-1)}|/|x^{(k-1)}|{{< /katex >}}, ただし {{< katex >}}k=0{{< /katex >}} のとき `NULL`.|
|converged|BOOLEAN|第 {{< katex >}}k{{< /katex >}}反復で収束判定条件を満たしたかどうか．|

次に，`Config` という共通テーブル式を用意します．
この `Config` は列 `x0, theta, k_max` をもつものとします．
定義は以下のとおりです．

|列       |型      |意味|
|---------|--------|----|
|x0       |DOUBLE  |初期値 {{< katex >}}x^{(0)}{{< /katex >}}.|
|theta    |DOUBLE  |収束判定条件のしきい値 {{< katex >}}\theta{{< /katex >}}.|
|k_max    |INT  |最大反復回数 {{< katex >}}k_{\mathrm{max}}{{< /katex >}}.|

これらを用いて，方程式 {{< katex >}}x^2-2=0{{< /katex >}} の正の解を Newton 法で計算することで {{< katex >}}\sqrt{2}{{< /katex >}} を求めるための SQL 文を考えます．
その SQL 文と実行結果は以下のようになります．
ただし，意図通り動作するように，適宜 `CAST` で型を明示的に与えています．

```sql
WITH RECURSIVE Newton (k, x, err, converged) AS (
  SELECT
    0, CAST(x0 AS DOUBLE), CAST(NULL AS DOUBLE), FALSE
  FROM
    Config
  UNION ALL
  SELECT
    k + 1,
    x - (POWER(x, 2) - 2)/(2*x),
    ABS((POWER(x, 2) - 2)/(2*x)) / ABS(x),
    ABS((POWER(x, 2) - 2)/(2*x)) / ABS(x) < theta
  FROM
    Newton, Config
  WHERE
    k < k_max AND converged = FALSE
),
Config (x0, theta, k_max) AS (
  SELECT
    1, 1.0e-15, 100
)
SELECT
  k, x, err
FROM
  Newton;
+------+--------------------+--------------------------------+                    
| k    | x                  | err                            |                                  
+------+--------------------+--------------------------------+                                 
|    0 |                  1 |                           NULL |                                  
|    1 |                1.5 |                            0.5 |                                  
|    2 | 1.4166666666666667 |            0.05555555555555555 |                                  
|    3 | 1.4142156862745099 |          0.0017301038062284225 |                                  
|    4 | 1.4142135623746899 |       0.0000015018217097673717 |                                  
|    5 | 1.4142135623730951 | 0.0000000000011276535261092282 |                                  
|    6 |  1.414213562373095 |         1.1102230246251564e-16 |                                  
+------+--------------------+--------------------------------+  
```

第 {{< katex >}}k=6{{< /katex >}} 反復にて収束判定条件を満たし，{{< katex >}}\sqrt{2}{{< /katex >}} の近似値 {{< katex >}}1.414213562373095{{< /katex >}} が得られていることがわかります．

公式としてまとめると以下のようになります．

{{< katex display=true aligne=left >}}
\begin{aligned}
&\verb|WITH RECURSIVE Newton (k, x, err, converged) AS (|\\
&\verb|  SELECT|\\
&\verb|    0, CAST(x0 AS DOUBLE), CAST(NULL AS DOUBLE), FALSE|\\
&\verb|  FROM|\\
&\verb|    Config|\\
&\verb|  UNION ALL|\\
&\verb|  SELECT|\\
&\hspace{20pt}\verb|k + 1|,\\
&\hspace{20pt}\mathtt{x} - f(\mathtt{x})/f'(\mathtt{x}),\\
&\hspace{20pt}|f(\mathtt{x})/f'(\mathtt{x})|/|\mathtt{x}|,\\
&\hspace{20pt}|f(\mathtt{x})/f'(\mathtt{x})|/|\mathtt{x}|<\verb|theta|\\
&\verb|  FROM|\\
&\verb|    Newton, Config|\\
&\verb|  WHERE|\\
&\verb|    k < k_max AND converged = FALSE|\\
&\verb|),|\\
&\verb|Config (x0, theta, k_max) AS (|\\
&\verb|  SELECT|\\
&\verb|    |x_0, \theta, k_{\mathrm{max}}\\
&\verb|)|\\
&\verb|SELECT|\\
&\ \ \verb|  k, x, err|\\
&\verb|FROM|\\
&\verb|  Newton;|
\end{aligned}
{{< /katex >}}

反復途中の値は不要で，結果だけ取得したい場合の SQL 文を考えます．
収束した時点の `x` を `sqrt2` として取得する SQL 文とその実行結果は以下のとおりです．
```sql
WITH RECURSIVE Newton (k, x, err, converged) AS (
  SELECT
    0, CAST(x0 AS DOUBLE), CAST(NULL AS DOUBLE), FALSE
  FROM
    Config
  UNION ALL
  SELECT
    k + 1,
    x - (POWER(x, 2) - 2)/(2*x),
    ABS((POWER(x, 2) - 2)/(2*x)) / ABS(x),
    ABS((POWER(x, 2) - 2)/(2*x)) / ABS(x) < theta
  FROM
    Newton, Config
  WHERE
    converged = FALSE
),
Config (x0, theta, k_max) AS (
  SELECT
    1, 1.0e-15, 100
)
-- ここまでは同じ．
SELECT
  x AS sqrt2
FROM
  Newton, Config
WHERE
  err < theta;
+-------------------+
| sqrt2             |                                                                           
+-------------------+                                                                           
| 1.414213562373095 |                                                                           
+-------------------+
```

{{< katex >}}\sqrt{2}{{< /katex >}} の近似値 {{< katex >}}1.414213562373095{{< /katex >}} だけが得られました．

## まとめ

本ページではまず，MariaDB のドキュメントを参考に，`SELECT` や `WITH` で何ができるのかを確認しました．次に，`WITH RECURSIVE` というキーワードで再帰処理ができることを確認しました．最後にこれらを組み合わせて，方程式 {{< katex >}}x^2-2=0{{< /katex >}} の正の解を Newton 法で計算することで {{< katex >}}\sqrt{2}{{< /katex >}} を求めました．

冒頭でお断りしたとおり，本ノートの作成者は，データベースの初心者です．
より標準的な記法で実現する方法や，その他の数値計算を MariaDB で実行するための方法の検討は今後の課題とします．

## 参考文献

{{< anchor "cite:1" >}}[1] MariaDB Foundation, "MariaDB Foundation - MariaDB.org", https://mariadb.org/, 2025/3/23 最終アクセス．

