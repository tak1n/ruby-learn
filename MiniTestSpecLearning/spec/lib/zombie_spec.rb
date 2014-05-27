require 'spec_helper'

describe Zombie do
  let(:zombie) { Zombie.new }


  it 'should be a zombie' do
    1_000_000.times do
      expect(zombie).to be_instance_of(Zombie)
    end
  end

  it 'needs brains to eat' do
    expect(zombie.needs).to eq('brains')
  end
end
