## 学び
- すべてのプロセスは親プロセスから環境変数を引き継ぐ。
  - 環境変数は親プロセスによって設定され、子プロセスに引き継がれる。
- 環境変数はプロセスごとに存在し、それぞれのプロセスではグローバルにアクセスできる。
```bash
$ MESSAGE='wing it' ruby -e "puts ENV['MESSAGE']"
```

## 意外だと思ったこと
- exportコマンドの仕様
  - 「ターミナル.app」プロセス内でグローバルになる？
    - NO! ターミナルの別タブでは使用できなかった。
    - 調べてみると、実行中のbash/zshプロセス内でしか使用できない。

## 今回扱ったシステムコール
- 今回はシステムコールというよりは、C言語による操作になる。
- C 言語の setenv(3) や getenv(3) といった関数。
