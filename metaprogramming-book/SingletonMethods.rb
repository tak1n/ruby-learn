str = "Just a regular string"

def str.title?
  self.upcase == self
end

p str.title?
p str.methods.grep(/title?/)
p str.singleton_methods

# Singleton methods are instance methods on the Singleton class

p str.class
p str.singleton_class

p str.class.class
p str.singleton_class.class
