reader, writer = IO.pipe
writer.write("Into the pipe I go...")
writer.close

binding.irb
puts reader.read
