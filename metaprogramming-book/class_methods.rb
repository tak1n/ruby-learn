# Different ways of defining class methods or module methods
require 'minitest/autorun'

class A
  def self.hi
    'hi'
  end
end

class B
  def B.hi
    'hi'
  end
end

class C
  class << self
    def hi
      'hi'
    end
  end
end

# Special case of defining class methods for modules
module D
  extend self

  def hi
    'hi'
  end
end

class Test < MiniTest::Unit::TestCase
  def test_hi
    assert_equal(A.hi, B.hi)
    assert_equal(A.hi, C.hi)
    assert_equal(A.hi, D.hi)
  end
end


