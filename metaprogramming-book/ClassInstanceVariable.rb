class MyClass
  @my_var = 1
  def self.read
    @my_var
  end

  def write
    @my_var = 2
  end

  def read
    @my_var
  end
end

obj = MyClass.new
obj.write
puts obj.read
puts MyClass.read

#first my_var is defined in MyClass where self is MyClass and current class is MyClass -> so its an instance variable of MyClass Object -> Class Instance variable
#second my_var is defined in an instance method of MyClass so its an instance variable of the caller object -> obj