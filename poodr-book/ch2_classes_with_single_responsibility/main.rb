require_relative 'gear'
require_relative 'wheel'

wheel = Wheel.new(26, 1.5)
puts wheel.circumference

puts Gear.new(52, 11, wheel).gear_inches
puts Gear.new(52, 11).ratio
