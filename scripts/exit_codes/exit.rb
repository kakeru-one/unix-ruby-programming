# Kernel#exit が呼び出されると、プロセスを終了する前に
# Kernel#at_exit で定義されたすべてのブロックが呼び出される
at_exit { puts 'Last!' }
exit
