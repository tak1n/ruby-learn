# Different ways of defining class methods or module methods
require 'minitest/autorun'

# good
class A
  def self.hi
    'hi'
  end
end

# Better
# but use self.method
class B
  def B.hi
    'hi'
  end
end

# Bad
# use self.method approach
class C
  class << self
    def hi
      'hi'
    end
  end
end

# Special case of defining class methods for modules
# Bad use module_function instead
module D
  extend self

  def hi
    'hi'
  end
end

module E
  module_function

  def hi
    'hi'
  end
end

puts A.hi
puts B.hi
puts C.hi
puts D.hi
puts E.hi

class Test < Minitest::Test
  def test_hi
    assert_equal(A.hi, B.hi)
    assert_equal(A.hi, C.hi)
    assert_equal(A.hi, D.hi)
    assert_equal(A.hi, E.hi)
  end
end


