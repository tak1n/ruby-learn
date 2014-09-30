class SimpleObject < BasicObject
  def to_s
    'simple_object'
  end
end

puts String(SimpleObject.new)
