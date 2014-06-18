# Each returns the unmodified Array
array = [1, "two", 3, "four"]
new_array = array.each do |item|
  item.to_s + "*"
end

puts "#{new_array.inspect}\n\n"

# Map returns a new Array modified with modifications to the original Array made in the block
array = [1, "two", 3, "four"]
new_array = array.map do |item|
  item.to_s + "*"
end

puts "#{new_array.inspect}\n\n"

# Inject takes the param in inject() and uses this as first available param in the block (initial Value)
# After the first looping the first param of the block is the resulted value from the first inject loop
#
# the second param (n) is each range element in this case
val = (5..10).inject(1) do |sum, n|
  sum + n
end

puts "#{val}\n\n"

# If no initial Value for inject is set, the first element in the collection/array is automatically used as initial value
array = ["one", "two", 3, "four"]
val = array.inject(1) do |seed, item|
  (item.class == Fixnum) && (seed.class == Fixnum) ? seed + item : seed
end

puts "#{val}\n\n"
