require 'spec_helper'

describe Zombie do
  let(:zombie) { Zombie.new }

  it 'should be a zombie' do
    1_000_000.times do
      zombie.must_be_instance_of(Zombie)
    end
  end

  it 'needs brains to eat' do
    zombie.needs.must_equal('brains')
  end
end
