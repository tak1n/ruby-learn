require_relative 'test_helper'
 
class TestCashRegister < MiniTest::Unit::TestCase 
  def setup
    @register = CashRegister.new
  end
  def test_default_is_zero
    assert_equal 0, @register.total
  end
  def test_total_calculation
    @register.scan 1
    @register.scan 2
    assert_equal 3, @register.total
  end
  def test_total_is_zero_after_clear
    @register.scan 1
    @register.clear
    assert_equal 0, @register.total
  end
end