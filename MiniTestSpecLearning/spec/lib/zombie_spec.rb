require 'spec_helper'

describe Zombie do
  let(:zombie) { Zombie.new }


  it 'should be a zombie' do
    expect(zombie).to be_instance_of(Zombie)
  end

  it 'needs brains to eat' do
    expect(zombie.needs).to eq('brains')
  end
end
