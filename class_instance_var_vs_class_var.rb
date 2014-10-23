class Parent
  @things = []
  def self.things
    @things
  end
  def things
    self.class.things
  end
end

class Child < Parent
  @things = []
end

Parent.things << :car
Child.things  << :doll
mom = Parent.new
dad = Parent.new

p Parent.things #=> [:car]
p Child.things  #=> [:doll]
p mom.things    #=> [:car]
p dad.things    #=> [:car]

# Class Instance variables aren't saved in the class hirarchy
# This means a subclass has it's own class instance var (different values)

class Parent2
  @@things = []
  def self.things
    @@things
  end
  def things
    @@things
  end
end

class Child2 < Parent2
end

Parent2.things << :car
Child2.things  << :doll

p Parent2.things #=> [:car,:doll]
p Child2.things  #=> [:car,:doll]

mom = Parent2.new
dad = Parent2.new
son1 = Child2.new
son2 = Child2.new
daughter = Child2.new

[ mom, dad, son1, son2, daughter ].each{ |person| p person.things }

# Class variables are saved through the inheritance hierarchy
# This means subclasses share the same class var (same value for all classes)
