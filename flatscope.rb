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

# Scope Gates are: class, module, def
# Flat Scopes use: closures (blocks)