class MyClass
  def my_method(arg)
    puts arg
  end
end

obj = MyClass.new
obj.my_method(3) # normal dot notation for method call
obj.send(:my_method, 3)
# using this style the method gets a normal argument and u can wait to know your method call til the very last moment it gets called
# This is called Dynamic Dispatch
