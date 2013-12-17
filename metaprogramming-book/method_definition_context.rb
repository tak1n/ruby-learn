# In the global context self is main
# Current class is Object
def global
end

class Test
	#self is Test
	#current class is Test

	#in a class definition current class and self are the same!
end

# class_eval sets self to the Class Object and the "current class" to Test
# Therefore method definitions in class_eval are getting instance methods of class Test

Test.class_eval do
	def method1
	end
end

# instance_eval sets self to the Class Obect BUT "current class" to the eigenclass of Test
# Method definitions in instance_eval are class methods of Test or in general singleton methods of an object

Test.instance_eval do
	def method2
	end
end

puts Test.instance_methods(false)
puts Test.methods(false)

o = Object.new

# global methods are instance methods of class Object
puts o.method(:global).inspect