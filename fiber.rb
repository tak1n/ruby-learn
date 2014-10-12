fib = Fiber.new do
  x, y = 0, 1
  loop do
    # each time the Fiber yields it's kinda returning the value to the main program (10.times { ... })
    # but also saving the current variables x, y
    # each time the fiber is resumed, it's resumed at the starting point Fiber.yield
    # this means continuing the loop -> calculating new values and then again yielding the new y again to the main program
    Fiber.yield y
    x, y = y, x + y
  end
end
10.times { puts fib.resume }

# Difference between Fibers and Procs / lambdas
# fibers save the state and can be resumed,
# procs and lambdas can only be called once and not broken out and resumed again.
# PROC = Proc.new do
#   x, y = 0, 1
#   loop do
#     return y
#     x, y = y, x + y
#   end
# end
# 10.times { puts PROC.call }
#
# thread = Thread.new do
#   x, y = 0, 1
#   loop do
#     x, y = y, x + y
#   end
# end
