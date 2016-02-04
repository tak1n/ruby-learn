require 'concurrent'

time = Time.now
futures = []

5.times do
  futures << Concurrent::Future.execute do
    sleep(1)
    puts 'what'
  end
end

futures.each(&:wait!)
time2 = Time.now
time_elapsed = time2 - time
p time_elapsed # => about 1 second (waiting 1 second in each thread / future)

