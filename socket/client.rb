require 'socket'
tStart = Time.now
u = 0
while Time.now - tStart<5
    socket = TCPSocket.open('localhost', 1234)
    socket.puts('a')
    socket.gets
    socket.close
    u += 1
end
puts u.to_s
