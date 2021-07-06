ract = Ractor.new do
  msg = Ractor.receive
  msg
end

ract.send 42
puts ract.take #=> 42

ract2 = Ractor.new do
  msg = Ractor.receive_if{|msg| msg < 50 } # => 42
  msg
end

ract2.send 59
ract2.send 55
ract2.send 42
ract2.send 51

# The result will be based on the message that got through
puts ract2.take #=> 42
