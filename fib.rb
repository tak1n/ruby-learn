def fib(n)
  n < 2 ? n : fib(n-1) + fib(n-2)
end

start = Time.now

1.upto(5).map do |n|
  Thread.new { puts "Thread #{n}: #{fib(32)}" }
end.each(&:join)

puts "Time: #{Time.now - start}"
