list = (1..Float::INFINITY).lazy
  .collect { |x| x * x }
  .collect { |x| x + 1 }
  .first(10)

p list
