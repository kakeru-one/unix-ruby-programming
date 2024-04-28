## 学び
- execve(2) を使えば現在のプロセスを他のプロセスに変身させることができるが、元となる実行していたプロセスは終了する。
- forkと併用することで、実行しているプロセスは終了させずに済む。
  - 実行結果を利用するのであれば、Process.wait を使うと子プロセスの完了を待つことができる。
- IO.popen
  - https://docs.ruby-lang.org/ja/latest/method/IO/s/popen.html
