class Fixnum
  alias_method :old_plus, :+

  def +(val)
    self.old_plus(val).old_plus(1)
  end
end

p 1 + 1
p 1 + 2
