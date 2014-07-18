require 'minitest'
require 'minitest/mock'

arg = Minitest::Mock.new
mock = Minitest::Mock.new
mock.expect(:foo, nil, [arg])
mock.foo(arg)
