require 'test_helper'

class CombieTest < Minitest::Test
  def setup
    @combie = Combie.new
  end

  def test_combie_needs
    assert_equal "brains", @combie.needs
  end
end
