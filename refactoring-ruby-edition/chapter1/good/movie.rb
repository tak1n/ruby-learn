class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code

  def price_code=(value)
    @price_code = value
    @price = case @price_code
    when REGULAR then RegularPrice.new
    when NEW_RELEASE then NewReleasePrice.new
    when CHILDRENS then ChildrensPrice.new
    end
  end

  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    if @price_code.eql?(NEW_RELEASE) && days_rented > 1
      2
    else
      1
    end
  end
end

class RegularPrice
  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
  end
end

class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end
end

class ChildrensPrice
  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end

