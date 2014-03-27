require 'ffi'

module Hello
  extend FFI::Library
  ffi_lib "./libhellopp.so"
  attach_function :hellomath, [:int, :int], :int

  def self.math(a, b)
    puts "Hello from Ruby land"
    puts hellomath(a, b)
  end
end

Hello.math(3, 5)

