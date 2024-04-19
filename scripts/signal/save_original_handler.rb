# これを既存の INT シグナルハンドラとみなす
trap(:INT) { puts 'This is the first signal handler' }

# 既存のハンドラの処理を踏みにじることなく、新たな処理を付け加える
old_handler = trap(:INT) {
  old_handler.call
  puts 'This is the second handler'
  exit
}
