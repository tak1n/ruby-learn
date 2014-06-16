require 'minitest/autorun'
require './levenshtein'

describe Lev do
  it 'should measure the difference between two sequences' do
    Lev.('hello', 'hella').must_equal 1
    Lev.('hallo', 'hella').must_equal 2

    Lev.('halo', 'hallo').must_equal 1
    Lev.('helo', 'hallo').must_equal 2
  end
end
