## 学び
- プロセス間通信(IPC、Inter Process Communication)と呼ばれる分野の話 になる。IPC はさまざまな方法で実現できる。
  - pipeを用いると、親プロセスと子プロセスの通信を行うこともできる。(子プロセス -> 親プロセスの一方向に伝える。)
  - Unix ソケットは同一の物理マシン上でだけ通信できるソケットの一種。
    - TCPソケットよりもはるかに速い。
    - 複数のマシン間で通信したい場合は、TCPソケットを使う。
  - 重要なのは、**パイプは単方向であり、ソケットは双方向である** ということ
