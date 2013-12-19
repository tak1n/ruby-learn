require 'test/unit'
require_relative 'block.rb'

class Person; end;
class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age) do |v|
      v >= 18
    end
    @bob = Person.new
  end

  def test_acepts_valid_values
    @bob.age = 20
    assert_equal(20, @bob.age)
  end

  def test_refuses_invalid_values
    assert_raise(RuntimeError, 'Invalid attribute') do
      @bob.age = 17
    end
  end
end