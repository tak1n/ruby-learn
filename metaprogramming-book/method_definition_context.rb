# In the global context self is main
# Current class is Object
def my_global_method
end

class A
  # self is A
  # current class is A

  # in a class definition current class and self are the same!
end

# B inherits from A
class B < A
end

# class_eval sets self to the Class Object and the "current class" to A
# Therefore method definitions in class_eval are getting instance methods of class A

A.class_eval do
  def my_instance_method
    puts "Instance Method"
  end
end

# instance_eval sets self to the Class Object BUT "current class" to the eigenclass of A
# Method definitions in instance_eval are class methods of A or in general singleton methods of an object
# Inherited Classes share the same Class methods -> superclass of a eigenclass is the eigenclass of the superclass
# Eigenclasses are therefore a "virtual class" (one step right and then up for method lookup)

A.instance_eval do
  def my_class_method
    puts "Class Method"
  end
end

puts A.instance_methods(false)
puts A.methods(false)

A.my_class_method
A.new.my_instance_method

o = Object.new

# global methods are instance methods of class Object
puts method(:my_global_method).owner
