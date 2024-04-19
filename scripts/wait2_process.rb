# 子プロセスを 5 つ生成する
5.times do
  fork do
    # 子プロセスごとにランダムな値を生成する。
    # もし偶数なら 111 を、奇数なら 112 を終了コードとして返す。 
    if rand(5).even?
      exit 111
    else
      exit 112
    end
  end
end
    

5.times do
  # 生成した子プロセスが終了するのを待つ。
  pid, status = Process.wait2

  # もし終了コードが 111 なら、
  # 子プロセス側で生成された値が偶数だとわかる。 
  if status.exitstatus == 111
    puts "#{pid} encoutered an even number!"
  else
    puts "#{pid} encoutered an odd number!"
  end
end
