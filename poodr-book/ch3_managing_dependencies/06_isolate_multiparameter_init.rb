# So far all examples have been for situations where you control the classes and init methods
# In some cases classes have dependencies you don't control, therefore you should protect your class against this dependency with a Factory | Wrapper

# you are not in control of SomeFramework::Gear and in which way it will change or possible to refactor it for order independent init params
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
    end

    # ...
  end
end

# Therefore surround it with a factory | wrapper
module GearFactory
  extend self

  def gear(args)
    # here you could again set default values if needed
    args = default.merge(args)

    SomeFramework::Gear.new(
      args[:chainring],
      args[:cog],
      args[:wheel])
  end

  def default
    {:chainring => 40, :cog => 18}
  end
end

GearFactory.gear(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5))
