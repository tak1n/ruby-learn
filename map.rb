class Array
  def mapp
    out = []

    self.each { |elem| out << yield(elem) } if block_given?

    out
  end
end

array = [5, 4, 3]
p array

array2 = array.mapp do |elem|
  elem + 1
end
p array2
