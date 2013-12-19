require 'test/unit'
require_relative 'class_eval.rb'

class Person; end;
class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age)
    @bob = Person.new
  end

  def test_acepts_valid_values
    @bob.age = 20
    assert_equal(20, @bob.age)
  end

  def test_refuses_nil_values
    assert_raise(RuntimeError, 'Invalid attribute') do
      @bob.age = nil
    end
  end

  def test_refuses_false_values
    assert_raise(RuntimeError, 'Invalid attribute') do
      @bob.age = false
    end
  end
end