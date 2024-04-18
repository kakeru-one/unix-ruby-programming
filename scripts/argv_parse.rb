# ユーザーから help オプションを渡されたかを確認す
ARGV.include?('--help')
# -c オプションの値を取得する
ARGV.include?('-c') && ARGV[ARGV.index('-c')+1]
