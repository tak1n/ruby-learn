puts Encoding.default_external
puts Encoding.default_internal

puts __ENCODING__

def show_encoding(str)
  puts "'#{str}' is #{str.encoding.name}"
end

show_encoding "cat"
show_encoding "∂og"

show_encoding /cat/
show_encoding /∂og/

puts "Greek pi: \u03c0"
puts "Greek pi: \u{3c0}"
puts "Greek \u{70 69 3a 20 3c0}"
puts "\u2026"

p "pi: \u03c0".bytes
p "pi: π".bytes
