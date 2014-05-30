class Integer
   def factors
     factors = `factor #{self.abs}`.split(' ')[1..-1].map {|i| i.to_i}
     h = Hash.new(0); factors.each {|f| h[f] +=1}; h.to_a.sort
   end

   def primality?
     return true if `factor #{self.abs}`.split(' ')[1..-1].size == 1
     return false
   end
end

p 6000000000000001.primality?
