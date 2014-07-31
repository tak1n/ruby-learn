require 'benchmark/ips'
require 'set'

list = ('a' .. 'zzzz').to_a
set = Set.new(list)

Benchmark.ips do |x|
  x.report("set access") { set.include?("foo") }

  x.report("ary access") { list.include?("foo") }
end
