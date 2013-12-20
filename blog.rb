class Object
  def eigenclass
    class << self; self; end
  end
end

class MyClass
end

class MySecondClass < MyClass
end

myobj = MySecondClass.new

puts "Object: #{myobj}"
puts "Eigenclass of Object: #{myobj.eigenclass} -> #myobj"
puts "Class of Object: #{myobj.class}"
puts "Eigenclass of Object's Class: #{myobj.class.eigenclass} -> #MySecondClass"
puts "Superclass of Object's Class: #{MySecondClass.superclass}"
puts "Superclass of Object's Class: Eigenclass: #{MySecondClass.eigenclass.superclass} -> #MyClass"
puts MyClass.superclass.superclass.eigenclass.superclass
puts MyClass.superclass.superclass.eigenclass.class

