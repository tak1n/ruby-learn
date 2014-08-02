require 'test_helper'

describe DemoModel do
  it "should respond to name" do
    Demo.respond_to?(:name).must_equal true
  end
end

