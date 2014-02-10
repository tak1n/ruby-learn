#!/usr/bin/env ruby
class Hello
   def initialize( hello )
      @hello = hello
   end
   def hello
      @hello
   end
end

salute = Hello.new( "Hello, Mac!" )
puts salute.hello
