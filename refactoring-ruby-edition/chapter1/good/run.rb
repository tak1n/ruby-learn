require_relative 'movie'
require_relative 'rental'
require_relative 'customer'

movie = Movie.new('Aliens vs Predators', 1)
rental = Rental.new(movie, 10)

benny = Customer.new('benny')
benny.add_rental(rental)

puts benny.statement
