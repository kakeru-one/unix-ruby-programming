# プロセスのユーザーが作成できる最大プロセス数
Process.getrlimit(:NPROC)

# プロセスが作成できるファイルサイズの最大値
Process.getrlimit(:FSIZE)

# プロセススタックの最大サイズ
Process.getrlimit(:STACK)
