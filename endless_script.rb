def neverending_method
  i = 0

  while
    i = rand(10) + i
  end
end

thread_0 = Thread.new { neverending_method }
thread_1 = Thread.new { neverending_method }
thread_2 = Thread.new { neverending_method }

thread_0.join
