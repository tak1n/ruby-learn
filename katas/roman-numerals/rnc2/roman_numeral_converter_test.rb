require 'minitest/autorun'
require 'minitest/pride'

require './roman_numeral_converter'

class RomanNumeralConverterTest < Minitest::Test
  def setup
    @rnc = RomanNumeralConverter
  end

  def test_roman_numeral_converter
    assert_equal('I', @rnc.(1))
    assert_equal('II', @rnc.(2))
    assert_equal('III', @rnc.(3))
    assert_equal('IV', @rnc.(4))
    assert_equal('V', @rnc.(5))
    assert_equal('VI', @rnc.(6))
    assert_equal('IX', @rnc.(9))
    assert_equal('X', @rnc.(10))
    assert_equal('XX', @rnc.(20))
    assert_equal('XL', @rnc.(40))
    assert_equal('L', @rnc.(50))
    assert_equal('XC', @rnc.(90))
    assert_equal('C', @rnc.(100))
    assert_equal('CD', @rnc.(400))
    assert_equal('D', @rnc.(500))
    assert_equal('CM', @rnc.(900))
    assert_equal('M', @rnc.(1000))

    assert_equal('MMXIV', @rnc.(2014))
    assert_equal('MMMCMXCIX', @rnc.(3999))
    assert_equal('', @rnc.(0))
    assert_equal('-I', @rnc.(-1))
  end
end
