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

  # threaded version
  x.report('threads'){
    8.times.map do
      Thread.new { tarai(14, 7, 0) }
    end.each(&:join)
  }
end

#                user     system    total       real
# seq         135.949443 0.003992 135.953435 (135.976772)
# par         287.926185 0.104037 288.030222 ( 38.530438)
# threads     135.636022 0.016013 135.652035 (135.610998) ruby code can't run in multiple threads due to the GVL/GIL
