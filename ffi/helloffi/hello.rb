require 'ffi'

module HelloC
  extend FFI::Library
  ffi_lib "./libhello.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    puts hellomath(a, b)
  end
end

module HelloCpp
  extend FFI::Library
  ffi_lib "./libhellopp.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    puts hellomath(a, b)
  end
end

module HelloRust
  extend FFI::Library
  ffi_lib "./libhellorust.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    puts hellomath(a, b)
  end
end

HelloC.math(3, 5)
HelloCpp.math(3, 5)
HelloRust.math(3, 5)

