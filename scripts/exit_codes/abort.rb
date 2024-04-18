# Kernel#at_exit で定義されたブロックは実行される
at_exit { puts 'Last!' }

# メッセージはプロセスの終了前に STDERR に出力される。
# 終了コードは1を返す。
abort "Something went horribly wrong."
