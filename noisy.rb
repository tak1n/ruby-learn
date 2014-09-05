class Integer
  def to_b
    !self.zero?
  end
end

def noisy(f)
  lambda do |arg|
    puts "calling with #{arg}"
    val = arg.public_send(f)
    puts "called with #{arg} - got #{val}"
  end
end

noisy(:to_b).call(0)
