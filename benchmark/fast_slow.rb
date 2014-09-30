require 'benchmark/ips'

def method_block(&block)
  block.call
end

def method_yield
  yield
end

Benchmark.ips do |x|
  x.report("yield") do
    method_yield do
      1 + 1
    end
  end

  x.report("block") do
    method_block do
      1 + 1
    end
  end

  x.compare!
end
