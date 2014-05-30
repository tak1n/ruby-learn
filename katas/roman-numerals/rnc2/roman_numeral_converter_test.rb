require 'minitest/autorun'
require 'minitest/pride'

require './roman_numeral_converter'

class RomanNumeralConverterTest < Minitest::Test
  def setup
    @rnc = RomanNumeralConverter
  end

  def test_roman_numeral_converter_to_roman
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

  def test_roman_numeral_converter_to_arabic
    assert_equal(1, @rnc.('I'))
    assert_equal(2, @rnc.('II'))
    assert_equal(3, @rnc.('III'))
    assert_equal(4, @rnc.('IV'))
    assert_equal(5, @rnc.('V'))
    assert_equal(6, @rnc.('VI'))
    assert_equal(9, @rnc.('IX'))
    assert_equal(10, @rnc.('X'))
    assert_equal(20, @rnc.('XX'))
    assert_equal(40, @rnc.('XL'))
    assert_equal(50, @rnc.('L'))
    assert_equal(90, @rnc.('XC'))
    assert_equal(100, @rnc.('C'))
    assert_equal(400, @rnc.('CD'))
    assert_equal(500, @rnc.('D'))
    assert_equal(900, @rnc.('CM'))
    assert_equal(1000, @rnc.('M'))

    assert_equal(2014, @rnc.('MMXIV'))
    assert_equal(3999, @rnc.('MMMCMXCIX'))
    assert_equal(0, @rnc.(''))
    assert_equal(-1, @rnc.('-I'))
  end
end
