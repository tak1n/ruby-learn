require 'test_helper'

class ZombieBucket
end

class ZombieTest < Minitest::Test
  def setup
    # runs before each test
    @zombie = Zombie.new
  end

  def test_zombie_is_zombie
    assert_instance_of(Zombie, @zombie, "Zombie should be zombie")
  end

  def test_zombie_needs
    assert_equal('brains', @zombie.needs, 'Zombie need brains')
  end

  def test_mock
    m = Minitest::Mock.new
    m.expect(:random_growl, 'my random growl')

    Zombie.stub_const(:ZombieBucket, m) do
      out, err = capture_io { Zombie.new.growl }
      assert_equal('my random growl', out)
    end
  end

  def teardown
    # runs after each test
  end
end
