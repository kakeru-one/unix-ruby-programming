# 孤児プロセスを作成する例
fork do
  5.times do
    sleep 1
    puts "I'm an orphan!"
  end
end

# 子プロセスのどれか1つが終了するまでの間、親プロセスをブロックして待つ。
Process.wait

abort "Parent process died..."
