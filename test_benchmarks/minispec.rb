require 'minitest/autorun'
 
describe "MiniSpec" do
  before do
    @numbers = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2
  end
 
  it "is fast" do
    (1..50).each do |n|
      n.must_equal(n)
      refute_nil n
    end
  end
 
  (1..15).each do |n|
    it "is example #{n}" do
      refute_nil (1 * @numbers)
    end
  end
 
  after(:each) do
    @numbers = nil
  end
end
