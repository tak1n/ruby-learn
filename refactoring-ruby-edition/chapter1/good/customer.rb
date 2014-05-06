class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |rental|
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
    end

    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"

    result
  end

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end

  ##
  # This method was created by Extract Method from Customer#statement
  # https://github.com/Benny1992/RubyApplications/blob/master/refactoring-ruby-edition/chapter1/bad/customer.rb#L18-L30
  #
  # It was edited by Move Method - moved method logic to Rental Object because method uses Rental's data
  # Also it's no longer needed after Move Method because it's only a delegating method anymore
  #
  # def amount_for(rental)
    # rental.charge
  # end
end

