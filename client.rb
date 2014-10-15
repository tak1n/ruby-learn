1_000.times do
  puts `echo "foo" | nc 127.0.0.1 3030`
end
