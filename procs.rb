def event(&block)
  @event = block
end

event do
  puts "hi"
end

puts @event # &block turn a block in a proc
@event.call # call the proc
