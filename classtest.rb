class Test
  def initialize
    puts "Test Constructor"
  end
end

class Test2 < Test
  def initialize
    super
    puts "test2 Constructor"
  end
end

testobj = Test2.new
