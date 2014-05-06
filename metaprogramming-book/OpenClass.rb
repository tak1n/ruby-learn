class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

require 'minitest/autorun'

class StringExtensionsTest < MiniTest::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal('3 the Magic Number', '#3, the *Magic ,Number*?'.to_alphanumeric)
  end
end


# Spell Open Class
# Monkey Patch is to use Open Class in the way to redefine a instance Method of class
# For example: Array#replace
# Sometimes it is useful but be carefull about this trick!!!
