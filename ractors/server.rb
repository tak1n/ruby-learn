require 'socket'

# Request Queue
queue = Ractor.new do
  loop do
    Ractor.yield(Ractor.recv, move: true) # move is set to true so that requests are moved permanently to their handling ractors
  end
end

# Total number of ractors to be created in the server. This should usually be equal to the number of available cores in the machine's processor
COUNT = 8

workers = COUNT.times.map do
  # queue is passed to every ractor to facilitate the transfer of requests
  Ractor.new(queue) do |queue|
    loop do
      # Take a request from the queue
      session = queue.take

      # Print the request's data
      data = session.recv(1024)
      puts data

      # Respond to the request
      session.print "Hello world!\n"
      session.close
    end
  end
end

# TCP Server
server = TCPServer.new(8000)
loop do
  conn, _ = server.accept
  # Move the incoming request to the main queue, from where it will be picked up by a worker ractor
  queue.send(conn, move: true)
end
