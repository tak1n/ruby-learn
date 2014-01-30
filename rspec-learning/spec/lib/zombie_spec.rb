require 'spec_helper'

describe Zombie do
	it "is named Ash" do
	  zombie = Zombie.new("Ash")
	  zombie.name.should eq("Asha")
	end
end