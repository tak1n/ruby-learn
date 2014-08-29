module Mygem
  class Myfirstrubylib
    def first_ruby_call
      puts 'First Ruby call'
      Myextlib.new.first_ext_call
    end
  end
end
