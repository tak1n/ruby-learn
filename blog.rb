class Object
	def eigenclass
		class << self; self; end
	end
end


class MyClass
     def initialize
         puts "hi im a new ruby object from the class MyClass"
     end

     def self
     	self
     end
end
 
myobject = MyClass.new
#puts myobject.self
#puts myobject.class
#puts myobject.class.superclass
#puts myobject.class.superclass.superclass

puts myobject.eigenclass