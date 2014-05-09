require 'rspec'
require 'rspec/expectations'

describe "RSpec" do
  before(:each) do
    @numbers = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2
  end

  it "is fast" do
    (1..50).each do |n|
      expect(n).to eq(n)
      expect(n).to be > 0
    end
  end

  (1..15).each do |n|
    it "is example #{n}" do
      expect((true)).to be_truthy
    end
  end

  after(:each) do
    @numbers = nil
  end
end
