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
    result = 0

    case @movie.price_code
    when Movie::REGULAR
      result += 2
      result += (@days_rented - 2) * 1.5 if @days_rented > 2
    when Movie::NEW_RELEASE
      result += @days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (@days_rented - 3) * 1.5 if @days_rented > 3
    end
  end
end
