require 'rubygems'
require 'ffi-rzmq'

if ARGV.length < 3
  puts "usage: ruby leak.rb <connect-to> <message-size> <roundtrip-count>"
  exit
end

link = ARGV[0]
message_size = ARGV[1].to_i
roundtrip_count = ARGV[2].to_i

ctx = ZMQ::Context.new
request_socket = ctx.socket ZMQ::REQ
reply_socket = ctx.socket ZMQ::REP

request_socket.connect link
reply_socket.bind link

poller = ZMQ::Poller.new
poller.register_readable request_socket
poller.register_readable reply_socket

start_time = Time.now

message = ZMQ::Message.new("a" * message_size)
request_socket.send message, ZMQ::NOBLOCK
i = roundtrip_count
messages = []

until i.zero?
  i -= 1

  poller.poll_nonblock

  poller.readables.each do |socket|
    message = ZMQ::Message.new
    socket.recv message, ZMQ::NOBLOCK
    messages << message
    socket.send ZMQ::Message.new(message.copy_out_string), ZMQ::NOBLOCK
  end
end

elapsed_usecs = (Time.now.to_f - start_time.to_f) * 1_000_000
latency = elapsed_usecs / roundtrip_count / 2

puts "mean latency: %.3f [us]" % latency
puts "received #{messages.size} messages in #{elapsed_usecs / 1_000_000} seconds"
