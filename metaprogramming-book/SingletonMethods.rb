str = "Just a regular string"

def str.title?
  self.upcase == self
end

str.title?
str.method.grep(/title?/)
str.singleton_methods

#Singleton methods defined in this way creates an eigenclass for the str object on the fly
# where this methods then are defined as current class 
