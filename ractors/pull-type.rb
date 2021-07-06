ract = Ractor.new do
  Ractor.yield 42
  Ractor.yield 84
end

puts ract.take # => 42
puts ract.take # => 84
