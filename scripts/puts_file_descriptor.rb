passwd = File.open('/etc/passwd')
puts passwd.fileno

hosts = File.open('/etc/hosts')
puts hosts.fileno
# 開いていた passwd ファイルを閉じる。
# ファイルディスクリプタ番号は次に開かれるリソースで再利用される
passwd.close

null = File.open('/dev/null')
puts null.fileno
