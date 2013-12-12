def parrot(argument)
  yield argument
end

parrot("Polly want a cracker.") do |argument|
  puts argument
end

class Array
  def my_map
    result = []
    self.each do |item|
      result << yield(item)
    end
    result
  end

  def each2   
    i = 0;  
    while self[i]  
      yield self[i]  
      i += 1  
    end  
    self  
  end 
end

[1, 2, 3].my_map{|i| print i}
print "\n"
[2, 3, 5].each2{|i| print i}
 
    
# Use map when you need an new array returned
# Use each when you need to loop through an array but don't necessarily neeed an new array