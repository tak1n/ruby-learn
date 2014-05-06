class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

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
