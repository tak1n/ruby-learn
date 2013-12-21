class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do
  self
  @v
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { @v } # => 2

#instance_eval sets self to the caller obj and current class to the meta class of the caller obj