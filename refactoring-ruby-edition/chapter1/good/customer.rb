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
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |rental|
      this_amount = amount_for(rental)

      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1
        frequent_renter_points += 1
      end

      # show figures for this rental
      result += "\t" + rental.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"

    result
  end

  ##
  # This method was created by Extract Method from Customer#statement
  # https://github.com/Benny1992/RubyApplications/blob/master/refactoring-ruby-edition/chapter1/bad/customer.rb#L18-L30
  #
  def amount_for(rental)
    rental.charge
  end
end

