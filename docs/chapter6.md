## 学び
- 1プロセスあたりどれくらいのファイルディスクリプタを持てるのかは決まっている。
  - ソフトリミットとハードリミットがある。
- :NOFILE シンボルを引数にして Process.getrlimit を呼び出してオープンできる ファイルの最大数を尋ねられる。
```ruby
puts Process.getrlimit(:NOFILE)
# 配列の 1 番目の要素にはファイルディスクリプタ数のソフトリミットが、2 番目の要素 にはファイルディスクリプタ数のハードリミットが格納されている。
# ソフトリミットを超えると例外を挙げる。
=> [256, 9223372036854775807]
```

## 今回扱ったシステムコール
- sysctl(8)
