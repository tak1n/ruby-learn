THREADS = 10
COUNT   = 50

$x = 1

THREADS.times.map { |t|
  Thread.new {
    COUNT.times { |c|
      a  = $x + 1
      sleep 0.000001
      puts "Thread #{t} wrote #{a}"
      $x =  a
    }
  }
}.each(&:join)

if $x != THREADS * COUNT + 1
  puts "Got $x = #{$x}."
  puts "Expected to get #{THREADS * COUNT + 1}."
else
  puts "Did not reproduce the issue."
end
