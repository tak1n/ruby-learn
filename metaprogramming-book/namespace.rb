MyConstant = 3
module Rake
  MyConstant = 2
  class Task
    MyConstant = 1
  end
end

puts MyConstant
puts Rake::MyConstant
puts Rake::Task::MyConstant

#Spell Namespace
