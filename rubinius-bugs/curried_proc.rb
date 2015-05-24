l = lambda{|a,b,c| a+b+c }
l1 = l.curry.call(1)
l2 = l1.curry.call(2)
l2.curry.call(3) #=> 6
l1.curry.call(2,3) #=> ArgumentError
