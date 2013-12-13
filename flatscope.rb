a = 1

Klass1 = Class.new do
	puts a # a = 1
end

class Klass2
  begin
    puts a # throws (NameError) undefined local variable
  rescue NameError
  	puts "class: NameError"
  end
end

puts "\n"

Module1 = Module.new do
  puts a
end

module Module2
  begin
    puts a # throws (NameError) undefined local variable
  rescue NameError
  	puts "module: NameError"
  end
end

puts "\n"

define_method :method1 do
  puts a
end

def method2
  begin
    puts a
  rescue NameError
  	puts "def: NameError"
  end
end

method1
method2

puts "\n"

class MyClass
  def initialize
  	@v = 1
  end
end

obj = MyClass.new
v = 2

obj.instance_eval do
	puts self
	puts @v
	@v = 2
	puts @v
end
# Scope Gates are: class, module, def
# Flat Scopes use: closures (blocks)