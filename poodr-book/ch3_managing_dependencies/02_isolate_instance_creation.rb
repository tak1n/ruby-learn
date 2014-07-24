# Isolate Instance Creation
# If you can't isolate the dependency of Wheel in Gear you should at least isolate the creation of a Wheel object
# into a seperate method -> see also isolate_multiparameter_init for external dependencies (Factory | Wrapper around ext. dependency)
#
# Rule: Dependency Injection > Instance Creation Isolation

# Bad
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # ...
end

# Better
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end
