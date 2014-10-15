require 'socket'

sockets = Socket.tcp_server_sockets(3030) # creates 2 sockets 1 IPv4, 1 IPv6

Socket.accept_loop(sockets) do |client|
  p client
  client.write("You said #{client.read}")
  client.close
end
