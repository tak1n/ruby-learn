require 'rubinius/debugger'

class Tmp < Object
  def initialize name
    Rubinius::Debugger.start
    puts "initializing Tmp object edited"
    @name = name
  end
end
