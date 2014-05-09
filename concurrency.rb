class Inventory
  def initialize(stock_levels)
    @stock = stock_levels
  end

  def decrease(item)
    @stock[item] -= 1
  end

  def [](item)
    @stock[item]
  end
end

@inventory = Inventory.new(:tshirt => 200,
                          :pants => 340,
                          :hats => 4000)

threads = Array.new
lock = Mutex.new

40.times do
  threads << Thread.new do
    lock.synchronize do
      100.times do
        @inventory.decrease(:hats)
      end
    end
  end
end

threads.each(&:join)
puts @inventory[:hats]
