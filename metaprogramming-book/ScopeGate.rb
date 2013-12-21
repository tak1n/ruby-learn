v1 = 1
class MyClass # SCOPE GATE: entering class
  v2 = 2
  puts local_variables # => ["v2"]
  def my_method # SCOPE GATE: entering def
    v3 = 3
    puts local_variables
  end   		# SCOPE GATE: leaving def
  puts local_variables # => ["v2"]
end # SCOPE GATE: leaving class

obj = MyClass.new
obj.my_method # => ["v3"]
puts local_variables # => ["v1", "obj"]


#SCOPE GATES are class, module and def
#To use a flatscope substitute this keywords with -> Class.new, Module.new, define_method
#Methods uses blocks as closures to carry the local scope with them