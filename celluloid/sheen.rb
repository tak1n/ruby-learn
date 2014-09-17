require 'celluloid'

class Sheen
  include Celluloid

  def initialize(name)
    @name = name
  end

  def current_status
    "#{@name} is winning!"
  end
end

charlie = Sheen.spawn "Charlie Sheen"

puts charlie.current_status
