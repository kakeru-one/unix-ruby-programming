# オープンできるファイルの最大数を 3 に設定する。
# 標準ストリームでファイルディスクリプタを 3 つ使うため、
# 既に上限に達している状態になる。
Process.setrlimit(:NOFILE, 3)
File.open('/dev/null')
