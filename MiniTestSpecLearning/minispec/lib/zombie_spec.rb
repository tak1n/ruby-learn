require 'spec_helper'
require 'shared/shared_spec'

describe Zombie do
  include SomeExamples

  let(:zombie) { Zombie.new }

  it 'should be a zombie' do
    zombie.must_be_instance_of(Zombie)
  end

  it 'needs brains to eat' do
    zombie.needs.must_equal('brains')
  end

  it 'checks the truth' do
    true.must_equal true
  end
end
