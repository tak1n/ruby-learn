module RomanNumeralConverter
  extend self

  ROMAN_VALUES = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ]

  ARABIC_VALUES = {}

  ROMAN_VALUES.each do |limit, glyph|
    ARABIC_VALUES[glyph] = limit
  end

  def convert(number)
    if number.is_a?(String)
      convert_to_arabic(number)
    else
      convert_to_roman(number)
    end
  end

  alias_method :call, :convert

private

  def convert_to_roman(number)
    if number < 0
      "-" + convert_to_positive_roman(-number)
    else
      convert_to_positive_roman(number)
    end
  end

  def convert_to_arabic(number)
    if number =~ /-/
       - convert_to_positive_arabic(number[1..number.length])
    else
      convert_to_positive_arabic(number)
    end
  end

  def convert_to_positive_roman(number)
    result = ''

    ROMAN_VALUES.each do |limit, glyph|
      while number >= limit
        result << glyph
        number -= limit
      end
    end

    result
  end

  def convert_to_positive_arabic(number)
    result = 0

    number.chars.each.with_index do |char, i|
      value = arabic_value(char)
      next_value = arabic_value(number[i+1])

      if value < next_value
        result -= value
      else
        result += arabic_value(char)
      end
    end

    result
  end

  def arabic_value(char)
    ARABIC_VALUES[char] || 0
  end
end
