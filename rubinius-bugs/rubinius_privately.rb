class User
  def initialize(name)
    @name = name
  end

  protected
  def hash
    @name.hash
  end
end

benny = User.new("benny")
john = User.new("john")

users = [benny, john, benny]
p users.uniq!
