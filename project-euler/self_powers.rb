i = 1
prev = 1
while i <= 1000
  number = prev + i**i
  prev = i**i
  i = i + 1
end

print number

