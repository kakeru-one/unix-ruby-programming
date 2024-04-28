hosts = File.open('/etc/hosts')
python_code = %Q[import os; print(os.fdopen(#{hosts.fileno}).read())]
# 引数の最後のハッシュは exec を介して開きつづける
# ファイルディスクリプタを指定している
exec 'python', '-c', python_code, {hosts.fileno => hosts}
