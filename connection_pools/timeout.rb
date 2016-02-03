require 'connection_pool'

class Client
  def fancy_get
    sleep(2)
    puts 'got something fancy'
  end
end

client = ConnectionPool.new(size: 5, timeout: 1) { Client.new }
arr    = []

6.times do |i|
  arr[i] = Thread.new do
    client.with do |conn|
      conn.fancy_get
    end
  end
end

arr.each { |t| t.join; }
