require 'thread'

threads = []
counter = 0
mutex = Mutex.new

4.times do
     threads << Thread.new {
        x=0
        y=0
        time=Time.new

        while 1 do
                if Time.new - time >= 10 then
                        break
                else
                        x=1.00/24000000000.001
                        y+=1
                end
        end
        mutex.synchronize { counter+=y.to_i }
    }
end
threads.each { |t| t.join }

puts "Total number of insane floating point divisions in 10 seconds is "+counter.to_s
