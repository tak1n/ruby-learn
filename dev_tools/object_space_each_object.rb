types_count = Hash.new(0)
ObjectSpace.each_object do |o|
  types_count[o.class] += 1
end

puts types_count.to_a.sort {|a, b| b[1] <=> a[1] }.to_h
