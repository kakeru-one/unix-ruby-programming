arr = [1,2,3]

fork do
  # ここで子プロセスが初期化される。
  # CoW であれば、この時点では arr 変数はコピーされない。 
  arr << 4
  # この行は配列に変更を加えるので、実際に変更を加える前に
  # 子プロセス用に配列のコピーが必要になる。
  # 親プロセス側での配列は変更されない。
end
