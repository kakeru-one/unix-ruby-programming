## 学び
- 前提として、カーネルは終了した子プロセスの情報をキュー（実際にはプロセステーブル内のエントリ）に入れる。
  - 親プロセスが`Process.wait`(システムコール的には、`wait()`または`waitpid()`)を使ってその情報を要求するまで、終了した子プロセスの情報をずっと持ち続ける。
- ゾンビプロセス
  - 既に実行していないにもかかわらず、プロセス・テーブル内で認識される (すなわち、PID 番号を持っている) 非活動プロセスのこと。
    - 親プロセスに待たれずに死んでしまった子プロセスは例外なくゾンビプロセスになる。
  - 親プロセスがゾンビプロセスの終了ステータスを取得すれば、その情報は消える。
  - 親プロセスが終了すると、ゾンビプロセスも消える。
    - https://qiita.com/ninoko1995/items/582106e8507163b2c50b
  - https://wa3.i-3-i.info/word11035.html
- ゾンビプロセスの何が良くないのか？
  - 子プロセスを「撃ちっ放し」方式で生成して、子プロセスの終了ステータスを放置しているのは、カーネルのリソースの無駄使いになる。
- `Process.detach`
  - 子プロセス pid の終了を監視するスレッドを生成して返す。
  - https://docs.ruby-lang.org/ja/latest/method/Process/m/detach.html
  - https://yaaamaaaguuu.hatenablog.com/entry/2018/03/10/222215
  - Rubiniusでの実装箇所(`Thread.new { Process.wait pid }`で実現している。)
    - https://github.com/rubinius/rubinius/blob/c6e8e33b37601d4a082ddcbbd60a568767074771/kernel/common/process.rb#L390
