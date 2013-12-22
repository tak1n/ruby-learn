module MyModule
  def my_method
    puts "hello"
  end
end

obj = Object.new

class << obj
  include MyModule
end

obj.my_method
puts obj.singleton_methods

#Object extension
#Object and Class Extensions are often used so ruby defined method for this
# Object#extend

class MyClass
  extend MyModule
end

MyClass.my_method