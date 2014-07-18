# x = 0
#
# 10.times.map do |i|
#   Thread.new do
#     puts "before (#{ i }): #{ x }"
#     x += 1
#     puts "after (#{ i }): #{ x }"
#   end
# end.each(&:join)
#
# puts "\ntotal: #{ x }"
#
# x, mutex = 0, Mutex.new
#
# 10.times.map do |i|
#   Thread.new do
#     mutex.synchronize do
#       puts "before (#{ i }): #{ x }"
#       x += 1
#       puts "after (#{ i }): #{ x }"
#     end
#   end
# end.each(&:join)
#
# puts "\ntotal: #{ x }"

def func1
  i=0
  while i<=2
    puts "func1 at: #{Time.now}"
    sleep(2)
    i=i+1
  end
end

def func2
  j=0
  while j<=2
    puts "func2 at: #{Time.now}"
    sleep(1)
    j=j+1
  end
end

puts "Started At #{Time.now}"
t1=Thread.new{func1()}
t2=Thread.new{func2()}
t1.join
t2.join
puts "End at #{Time.now}"
