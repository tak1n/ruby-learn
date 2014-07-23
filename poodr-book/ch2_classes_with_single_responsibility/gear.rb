class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    # don't use @chainring or any instance variables in methods
    # use methods which wraps instance variables -> easiest way attr_reader
    # now u can modify the method which contains chainring for example
    #
    # def chainring
    #   @chainring / 2
    # end
    #
    # RULE: ALWAYS wrap instance variables in methods!!
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end
