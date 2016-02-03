require 'spec_helper'
require_relative '../../lib/zombie.rb'


RSpec.describe Zombie do
  it "is named Ash" do
    zombie = Zombie.new("Ash")
    expect(zombie.name).to eq("Ash")
  end
end
