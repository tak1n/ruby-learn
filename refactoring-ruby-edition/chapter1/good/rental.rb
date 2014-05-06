class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  ##
  # This method was created by Move Method
  #
  # Moved the method from Customer#amount_for because this method uses Rental's data
  # => it should be an instance method of Rental
  #
  # Old method - https://github.com/Benny1992/RubyApplications/blob/411524c483334c73d1b2dfd95112a3c0950983b1/refactoring-ruby-edition/chapter1/good/customer.rb#L40-L53
  #
  def charge
    @movie.charge(@days_rented)
  end

  def frequent_renter_points
    @movie.frequent_renter_points(@days_rented)
  end
end
