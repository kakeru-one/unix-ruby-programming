favourite = fork do
  exit 77
end

middle_child = fork do
  abort "I want to be waited on!"
end

# forkメソッドの返り値はpidとなる
pid, status = Process.waitpid2 favourite
puts status.exitstatus
