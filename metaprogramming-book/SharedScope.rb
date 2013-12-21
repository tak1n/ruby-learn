def define_methods
  shared = 0

  Kernel.send :define_method, :counter do
    puts shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods

counter
inc(4)
counter