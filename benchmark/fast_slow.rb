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

Benchmark.ips do |x|
  x.report("block") do
    names = %w{ant bee cat}
    result = names.map {|name| name.upcase}
  end

  x.report("to_proc") do
    names = %w{ant bee cat}
    result = names.map(&:upcase)
  end

  x.compare!
end
