require_relative 'movie'
require_relative 'rental'
require_relative 'customer'

begin
  movie_benny   = Movie.new('Aliens vs Predators', 0)
  rental_benny  = Rental.new(movie_benny, 10)

  benny         = Customer.new('benny')

  benny.add_rental(rental_benny)
  puts benny.statement
end

begin
  movie_joe     = Movie.new('Aliens vs Predators 2', 1)
  rental_joe    = Rental.new(movie_joe, 12)

  joe           = Customer.new('joe')

  joe.add_rental(rental_joe)
  puts joe.statement
end

begin
  movie_doe     = Movie.new('Aliens vs Predators 3', 2)
  rental_doe    = Rental.new(movie_doe, 16)

  doe           = Customer.new('doe')

  doe.add_rental(rental_doe)
  puts doe.statement
end


