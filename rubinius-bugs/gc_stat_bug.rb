
child = fork do
  puts "Should see FINE message if it works"
  puts "GC.stat.count = #{GC.stat.count}"
  puts "LOOKED, WAS FINE"
end
