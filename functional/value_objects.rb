require 'anima'
require 'adamantium'

class Ukulele # < Struct.new(:color, :tuning)
  include Anima.new(:color, :tuning)
end

u1 = Ukulele.new(color: 'green', tuning: [:G, :C, :E, :B])
u2 = Ukulele.new(color: 'green', tuning: [:G, :C, :E, :B])

# This would work with a Struct, but because Anima is used for creating Value Objects no attr_writers are created.
# u1.color = 'red'

p u1 == u2

# To get real immutable value objects you also have to use Adamantium
# For example without adamantium you can modify the tuning array
u1.tuning << :F

p u1.tuning


class ValueUkulele
  include Anima.new(:color, :tuning)
  include Adamantium
end

vu1 = ValueUkulele.new(color: 'green', tuning: [:G, :C, :E, :B])
vu2 = ValueUkulele.new(color: 'green', tuning: [:G, :C, :E, :B])

p vu1 == vu2

vu1.tuning << :F
