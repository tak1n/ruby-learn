require "benchmark/ips"

def work(name)
  File.open name, "r" do |f|
    f.each_byte { }
  end
end

small_file  = File.join(File.dirname(__FILE__), 'small.txt')
large_file  = File.join(File.dirname(__FILE__), 'large.txt')

Benchmark.ips do |x|
  x.report("small file") { work small_file }
  x.report("large file") { work large_file }
end
