class A
  def sup(**)
    puts 'hello'
  end
end

class B < A
  def sup(**)
    super
  end
end

A.new.sup
B.new.sup
