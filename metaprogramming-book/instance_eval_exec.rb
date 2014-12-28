class C
  def initialize
    @x = 1
  end
end

class D
  def twisted_method
    @y = 2
    # @y isn't accessible in instance_eval block because self changed to object which is instance of C
    # Therefore blocks are closures only the local scope would be passed in
    C.new.instance_eval { "@x: #{@x}, @y: #{@y}" }
  end
end

p D.new.twisted_method

class D
  def twisted_method
    @y = 2
    y = @y
    # Here the fact that closures carry the local scope is used to pass in the instance var from obj of D via local var binding
    C.new.instance_eval { "@x: #{@x}, @y: #{y}" }
  end
end

p D.new.twisted_method

class D
  def twisted_method
    @y = 2
    # This has the same effect as above instance_exec takes a param which is passed into the block
    C.new.instance_exec(@y) { |y| "@x: #{@x}, @y: #{y}" }
  end
end

p D.new.twisted_method
