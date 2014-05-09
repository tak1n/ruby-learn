require 'minitest/autorun'
 
class MinitestTest < MiniTest::Unit::TestCase
  def setup
    @numbers = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2
  end
 
  def teardown
    @numbers = nil
  end
 
  def test_is_fast
    (1..50).each do |n|
      assert_equal n, n
      refute n.zero?
    end
  end
  (1..15).each do |n|
    define_method("test_is_example#{n}") do
      refute_nil (1 * @numbers)
    end
  end
end
