fork do
  i = 0

  loop do
    puts "looping in own process"

    break if i == 10
    sleep 1

    i += 1
  end

  exit 99
end

puts "hi"

Process.wait
