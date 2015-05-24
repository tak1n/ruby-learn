require 'benchmark'
require 'benchmark/ips'

small_file  = File.join(File.dirname(__FILE__), 'small.txt')
medium_file = File.join(File.dirname(__FILE__), 'medium.txt')
large_file  = File.join(File.dirname(__FILE__), 'large.txt')

# Open these before the actual benchmarks so we don't also benchmark
# File.open().
small_handle  = File.open(small_file, 'r')
medium_handle = File.open(medium_file, 'r')
large_handle  = File.open(large_file, 'r')

Benchmark.ips do |x|
  x.report "File.read a small file" do
    small_handle.each_byte {}
    small_handle.rewind
  end

  x.report "File.read a medium file" do
    medium_handle.each_byte {}
    medium_handle.rewind
  end

  x.report "File.read a large file" do
    large_handle.each_byte {}
    large_handle.rewind
  end
end
