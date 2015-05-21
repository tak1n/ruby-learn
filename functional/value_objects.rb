require 'anima'
require 'adamantium'
require 'virtus'

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
  include Anima.new(:color, :tuning), Anima::Update
  include Adamantium

  def tune(string, note)
    self.class.new(
      color: color,
      tuning: tuning.take(string) + [note] + tuning.drop(string+1)
    )
  end

  def tune2(string, note)
    update(
      tuning: tuning.take(string) + [note] + tuning.drop(string+1)
    )
  end
end

vu1 = ValueUkulele.new(color: 'green', tuning: [:G, :C, :E, :B])
vu2 = ValueUkulele.new(color: 'green', tuning: [:G, :C, :E, :B])

p vu1 == vu2

# vu1.tuning << :F => can't modify frozen Array (RuntimeError)

# An interesting side effect of immutable objects is that the result of method calls can be cached safely. 
# This is a technique known as memoization and is built-in to Adamantium.
class ValueUkulele
  def snares
    tuning.count
  end
  memoize :snares
end

class GeoLocation
  include Virtus::ValueObject

  attribute :latitude,  Float
  attribute :longitude, Float
end

location  = GeoLocation.new(latitude: 10, longitude: 100)
location2 = GeoLocation.new(latitdue: 10, longitude: 100)

p location == location2
