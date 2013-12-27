class HTTP
end

def R(string)
  if string == "/http"
    HTTP
  end
end

class A < R "/http"
  def my_attribute=(value)
  	@p = value
  end

  def my_attribute
  	@p
  end
end

obj = A.new
obj.my_attribute = "test"
puts obj.my_attribute
puts obj.class.ancestors

#Mimic Methods
# my_attribute=() & my_attribute are mimic methods
# R() is a mimic method thats look like a class (it returns a class for inhereting)
# also mimic methods are:
# protected, private, Class Macros like attr_reader, attr_accessor