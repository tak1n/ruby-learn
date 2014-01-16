fd = IO.sysopen "/dev/tty", "w"
ios = IO.new(fd, "w")
ios.puts "ZetCode"
ios.close
