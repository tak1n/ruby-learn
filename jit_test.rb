# test.rb
$index = 0

def m(input = 5)
  if input == 5
    puts $index += 1
  else
    raise "Input: #{input.inspect}"
  end
end

value = nil

loop do
  m(*value)
end
