ract = Ractor.new name: 'my-ractor' do
  # Code goes here
end

# Ractor#name returns the name that you passed earlier
puts ract.name

ract2 = Ractor.new 42 do |arg|
  arg # returning arg
end

# Expecting a result from ract
puts ract2.take
