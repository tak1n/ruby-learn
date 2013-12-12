def parrot(argument)
  yield argument
end

parrot("Polly want a cracker.") do |argument|
  puts "hi"
end