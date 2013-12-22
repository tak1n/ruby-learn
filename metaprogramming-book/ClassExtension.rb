module MyModule
  def my_method 
    puts 'hello'
  end
end

class MyClass
  class << self		 # Open the Eigenclass
    include MyModule # included methods from Module MyModule are singleton methods (instance methods of the eigenclass)
  end
end

#This is called a Class Extension