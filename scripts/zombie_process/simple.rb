# 1 秒後に終了する子プロセスを生成する。
pid = fork { sleep 1 }

# 終了した子プロセスの pid を出力する。
puts pid

# 親プロセスを sleep させる。
# こうしておけば子プロセスのステータスを調査できる
sleep 5