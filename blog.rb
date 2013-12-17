class Object
	def eigenclass
		class << self; self; end
	end
end

class MyClass
end

class MySecondClass < MyClass
end

puts MySecondClass.eigenclass
puts MySecondClass.eigenclass.superclass
puts MySecondClass.superclass
