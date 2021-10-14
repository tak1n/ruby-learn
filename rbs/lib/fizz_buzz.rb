class FizzBuzz
  def self.run(n)
    1.upto(n).map do |n|
      if n % 15 == 0
        'FizzBuzz'
      elsif n % 3 == 0
        'Fizz'
      elsif n % 5 == 0
        'Buzz'
      else
        n.to_s
      end
    end
  end
end
