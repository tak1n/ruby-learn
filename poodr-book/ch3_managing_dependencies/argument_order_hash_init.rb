# Every codepart which creates a new Gear object is depending on the argument order of the initialize method
# Imagine you got a whole framework where in 100 places a Gear object is created
# Now imagine your design decisions drive you to change the order, or numbers of params for initialize
#
# You now got errors evrywhere through your framework
# Solution use a hash / option object for instance creation

# Bad
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  # ....
end

Gear.new(
  52,
  11,
  Wheel.new(26, 1.5))

# Better
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end
end

Gear.new(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5))
