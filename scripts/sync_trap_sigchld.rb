child_processes = 3
dead_processes = 0
# 子プロセスを 3 つ生成する
child_processes.times do
  fork do
    sleep 3
  end
end

# CHLD ハンドラの中で puts の出力をバッファリングしないよう、
# $stdout の出力を同期モードに設定する。
# こうすることで、もし puts を呼び出した後にシグナルハンドラが
# 中断された場合には ThreadError 例外が送出されるようになる。
# これはシグナルハンドラで IO を扱う場合の一般的な流儀。
$stdout.sync = true

# この後、親プロセスは重い計算処理で忙しくなるが、
# 子プロセスの終了は検知したい。
# そこで、:CHLD シグナルを捕捉（trap）する。こうすることで
# 子プロセスの終了時にカーネルからの通知を受信できる。
trap(:CHLD) do
  # 終了した子プロセスの情報を Process.wait で取得すれば、
  # 生成した子プロセスのどれが終了したのかがわかる。

  # Process.wait(-1, Process::WNOHANG) をループさせることで、
  # 親プロセスの処理をブロックさせることなく子プロセスの終了を見逃さないようにする。
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_processes += 1
    end
  rescue Errno::ECHILD
    # カーネルの終了キューが空であれば待ち受けのループを終了する
    puts 'カーネルの終了キューが空です'
  end
end

loop do
  # すべての子プロセスが終了した時点で明示的に親プロセスを終了させる。
  exit if dead_processes == child_processes

  sleep 1
end
