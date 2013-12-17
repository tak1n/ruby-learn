# In the global context self is main
# Current class is Object
def global
end

class A
  #self is Test
  #current class is Test

  #in a class definition current class and self are the same!
end

# B inherits from A
class B < A
end

# class_eval sets self to the Class Object and the "current class" to Test
# Therefore method definitions in class_eval are getting instance methods of class Test

A.class_eval do
  def method1
    puts "Instance Method"
  end
end

# instance_eval sets self to the Class Obect BUT "current class" to the eigenclass of Test
# Method definitions in instance_eval are class methods of Test or in general singleton methods of an object
# Inherited Classes share the same Class methods -> superclass of a eigenclass is the eigenclass of the superclass
# Eigenclasses are therefore a "virtual class" (one step right and then up for method lookup)

A.instance_eval do
  def method2
    puts "Class Method"
  end
end

puts A.instance_methods(false)
puts A.methods(false)

B.method2

o = Object.new

# global methods are instance methods of class Object
puts o.method(:global).inspect
