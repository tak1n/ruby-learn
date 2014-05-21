require 'minitest/autorun'

class RomanNumeralConverterTest < Minitest::Test
  def setup
    @converter = RomanNumeralConverter
  end

  def test_the_truth
    assert(@converter)
  end
end
