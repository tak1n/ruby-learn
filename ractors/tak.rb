def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 8.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    8.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
       # user     system      total        real
# seq 123.281671   0.000000 123.281671 (123.284889)
# par 244.643257   0.015671 244.658928 ( 31.286156)
