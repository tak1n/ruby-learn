require 'pry'
binding.pry

module TimeExtensions
  refine Fixnum do
    def minutes; self * 60; end
  end
end

class MyApp
  using TimeExtensions

  def initialize
    p 2.minutes
  end
end

MyApp.new    # => 120
p 2.minutes
