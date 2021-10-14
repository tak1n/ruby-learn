require 'date'
require 'retryable'
require_relative '../lib/fizz_buzz'
require_relative '../lib/person'

Retryable.retryable() do
  results = FizzBuzz.run(Date.today.day)
  puts results
end

Person.new('Alice')
person.hello
