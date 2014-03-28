require 'ffi'

module HelloC
  extend FFI::Library
  ffi_lib "./libhello.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    sleep(1)
    puts hellomath(a, b)
  end
end

module HelloCpp
  extend FFI::Library
  ffi_lib "./libhellopp.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    sleep(1)
    puts hellomath(a, b)
  end
end

module HelloD
  extend FFI::Library
  ffi_lib "./libhellod.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    sleep(1)
    puts hellomath(a, b)
  end
end

HelloC.math(3, 5)

sleep(1)

HelloCpp.math(3,5)

sleep(1)

HelloD.math(3,5)


