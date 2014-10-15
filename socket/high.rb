require 'socket'

Socket.tcp_server_loop(3030) do |client|
  p client
  client.write("You said #{client.read}")
  client.close
end
