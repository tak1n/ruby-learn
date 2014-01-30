class CashRegister
  def initialize
    @items = []
  end
  def total
    @items.inject(0, &:+)
  end
  def scan(item)
    @items << item
  end
  def clear
    @items = []
  end
end