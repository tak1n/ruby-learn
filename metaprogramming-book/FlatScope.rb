my_var = "Success"

MyClass = Class.new do
  puts "#{my_var} in the class definition"

  define_method :my_method do
    puts "#{my_var} in the method"
  end
end

MyClass.new.my_method


#If you replace Scope Gates with method calls, you allow one scope to see variables from another scope.
#Technically, this trick should be called nested lexical scopes, but many Ruby coders refer to it simply as "flattening the scope"
#Meaning that the two scopes share variables as if the scopes were squeezed together.