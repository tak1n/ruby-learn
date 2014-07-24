# Explicitly define defaults is good when you got some standard values, eg you expect a normal
# Gear to have 40 chainring (EU - standard or whatever) etc...
#
# Altough || is super awesome in this case watchout for boolean values
#
#   @bool = args[:boolean_thing] || true
#
# Default value is true
# But if false is an acceptable value and this was actually set by the user who instantiates a new
# Gear Object @bool is regardless of the former point true
#
# Therefore use #fetch
#
#   @bool = args.fetch(:boolean_thing, true)
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog       = args[:cog]       || 18
    @wheel     = args[:wheel]
  end

  # ....
end

# buggy for boolean values
class Testy
  def initialize(args)
    @bool = args[:boolean_thing] || true
  end
end

test1 = Testy.new(:boolean_thing => false) # => <#Testy @bool=true>
test2 = Testy.new( {} ) # <#Testy @bool=true>

# works for boolean values
class Testy
  def initialize(args)
    @bool = args.fetch(:boolean_thing, true)
  end
end

test1 = Testy.new(:boolean_thing => false) # <#Testy @bool=false>
test2 = Testy.new( {} ) # <#Testy @bool=true>


# Also consider a whole default wrapper method when default values are more complicated

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)

    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end
end
