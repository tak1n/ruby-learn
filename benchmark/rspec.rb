require 'rspec'

class User
end

describe User do
  it "should do"
  10_000.times do
    define_method("it") do |argument|
      expect(argument).to be_truthy
    end
  end
end
