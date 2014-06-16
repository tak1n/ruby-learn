module Lev
  extend self

  def calculate(string_one, string_two)
    string_one_array = string_one.split('')
    string_two_array = string_two.split('')
    distance = 0

    string_one_array.each_with_index do |char, index|
      distance += 1 unless char.eql?(string_two_array[index])
    end

    distance
  end

  alias_method :call, :calculate
end
