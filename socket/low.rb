require 'socket'

# Selfmade - lowest possible level in ruby (or in other programming languages that have a socket api - python etc)

def tcp_server_sockets(port)
  # ipv4_socket = TCPServer.new(port)
  # or
  ipv4_socket = Socket.new(:INET, :STREAM)
  addr = Addrinfo.tcp('0.0.0.0', port)
  ipv4_socket.bind(addr)
  ipv4_socket.listen(Socket::SOMAXCONN)

  ipv6_socket = Socket.new(:INET6, :STREAM)
  # somehow IPv4 socket and IPv6 socket are blocking each other Errno::EADDRINUSE => port + 1
  addr = Addrinfo.tcp('::', port + 1)
  ipv6_socket.bind(addr)
  ipv6_socket.listen(Socket::SOMAXCONN)
  # SOMAXCONN = 10 (maximum pending connections)

  [ipv4_socket, ipv6_socket]
end

def accept_loop(sockets, &block)
  loop do
    readable, _ = IO.select(sockets)

    readable.each do |socket|
      client, addr = socket.accept
      block.call(client)
    end
  end
end

sockets = tcp_server_sockets(3030)
accept_loop(sockets) do |client|
  p client
  client.write("You said #{client.read}")
  client.close
end
