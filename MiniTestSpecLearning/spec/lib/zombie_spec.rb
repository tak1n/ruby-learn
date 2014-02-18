require 'spec_helper'

describe Zombie do
  before do
    @zombie = Zombie.new
  end

  describe '#new' do
    it 'should be a zombie' do
      @zombie.must_be_instance_of Zombie
    end
  end

  describe '#needs' do
    it 'needs brains to eat' do
      @zombie.needs.must_equal 'brains'
    end
  end
end
