# The commented part is the haskell approach

# Lists
# [1..10]
p (1..10).to_a

# Calculating first 10 squares
# Haskel is processing from right to left
# [ x*x | x <- [1..10] ]
p (1..10).collect { |x| x*x }
p (1..10).map { |x| x*x }

##
# What are high order functions?
#
# High order functions are functions which param is a function itself
#
# How does this apply to the previous example?

# map (\x -> x*x) [1..10]
p (1..10).map &lambda { |x| x*x }
p (1..10).map &(->(x) { x*x })

# In a functional programming language you want to know where your data came from and where is it going ->
# params passing

# In haskel each param from the list is passed through the function chain
# [ x + 1 | x <- [ x*x | x <- [1..10]]]
#
# In Ruby on the other hand the first #collect is called on each range item and then the second #collect is processing the 
# resulting "tmp" values
#
# Step 1: f(x) = x*x
# Step 2: g(x) = x+1
p (1..10).collect { |x| x*x }.collect { |x| x + 1 }
