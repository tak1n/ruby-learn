module Mygem
  class Myfirstrubylib
    def first_ruby_call
      puts 'First Ruby call'
      if RUBY_PLATFORM == 'java'

      else
        first_cext_call
      end
    end
  end
end
