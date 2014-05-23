require 'json'

class Greeter
  def initialize(name)
    @name = name
  end

  def hello
    puts "Hello #{@name}"
  end
end

benny = Greeter.new('benny')
benny.hello
