require 'minitest/autorun'
require_relative 'eval.rb'

class Person; end;
class TestCheckedAttribute < Minitest::Test
  def setup
    add_checked_attribute(Person, :age)
    @bob = Person.new
  end

  def test_acepts_valid_values
    @bob.age = 20
    assert_equal(20, @bob.age)
  end

  def test_refuses_nil_values
    assert_raises(RuntimeError, 'Invalid attribute') do
      @bob.age = nil
    end
  end

  def test_refuses_false_values
    assert_raises(RuntimeError, 'Invalid attribute') do
      @bob.age = false
    end
  end
end
