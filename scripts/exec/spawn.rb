# ブロックして外部コマンドを実行する
system 'sleep 5'
# ブロックせずに外部コマンドを実行する

Process.spawn 'sleep 10'

puts 'spawnを実行しました。'

# Process.spawn を使いながらブロックするやり方。
# 子プロセスの pid が戻ってくることに注目。
pid = Process.spawn 'sleep 5'

# 'sleep 10'を待たずに実行される。
puts 'ブロック中'
puts Process.waitpid(pid)
