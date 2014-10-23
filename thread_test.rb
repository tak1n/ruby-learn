t1 = Thread.new { while true ; sleep(3); puts("done"); end }
t2 = Thread.new { while true ; sleep(3); puts("done"); end }
t1.join # wait for thread 1 to finish
t2.join # wait for thread 2 to finish
