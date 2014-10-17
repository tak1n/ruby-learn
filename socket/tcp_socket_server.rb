require 'socket'

server = TCPServer.open(1234)

loop {
    client = server.accept
    client.gets
    client.puts( 'Hello World!' )
    client.close
}
