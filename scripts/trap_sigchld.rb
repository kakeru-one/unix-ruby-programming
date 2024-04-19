child_processes = 3
dead_processes = 0
# 子プロセスを 3 つ生成する
child_processes.times do |child_process|
  fork do
    puts "子プロセス#{child_process}が作成されました"
    sleep 1
  end
end

# この後、親プロセスは重い計算処理で忙しくなるが、
# 子プロセスの終了は検知したい。

# NOTE: 子プロセスが終了したことを「見失う」ことがあり、その際はProcess.waitがずっと終わらないため、冪等な結果にならない。
# そこで、:CHLD シグナルを捕捉する。こうすることで
# 子プロセスの終了時にカーネルからの通知を受信できる。
trap(:CHLD) do
  # 終了した子プロセスの情報を Process.wait で取得すれば、
  # 生成した子プロセスのどれが終了したのかがわかる。
  puts Process.wait
  dead_processes += 1
  # すべての子プロセスが終了した時点で明示的に親プロセスを終了させる。
  exit if dead_processes == child_processes
end

# 親プロセスの重い計算処理
loop do
  puts "親プロセスの処理: #{Process.pid}"
  sleep 3
end
