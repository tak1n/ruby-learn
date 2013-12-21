class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  # a block
end

# Method missing is mainly used for so called Ghost methods

class MyOpenStruct
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    attribute = name.to_s
    if attribute =~ /=$/
      @attributes[attribute.chop] = args[0]
    else
      @attributes[attribute]
    end
  end
end

icecream = MyOpenStruct.new
icecream.flavor = "vanilla"
puts icecream.flavor

# method_missing catches calls to flavor and chops off "=" at the end to get the attribute name.
# Then it stores the attribute name and its value into a hash.
# When you call a method that doesn't end with an "=", method_missing looks up te method name in the hash and return the result.
# => attributes are ghost_methods