Learning Repo for MiniSpec && MiniTest

# Testing Guidelines for TDD / Unit Tests (by Sandi Metz)

## Rules of testing

Categories of Messages (origin):

- Incoming: S
- Sent to self
- Outgoing

![Categories](http://sebastien.saunier.me/images/posts/object_under_test.jpg)

Type of Messages:

- Query: Returns something but doesn't change anything
- Command: Returns nothing but changes a state

## The Grid of testing:

### Test incoming query messages

Test incoming query messages by asserting against the return value.
Also don't test private methods (Messages sent to self) which are used by this query message.

```ruby
class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  # This is a Query message which calculates a return value but doesn't change anything
  def diameter
    rim + (tire * 2)
  end
end

# TEST

class WheelTest < Minitest::Test
  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)
    assert_in_delta(29, wheel.diameter, 0.01)
  end
end
```

### Test incoming command messages

Incoming command messages change a state of the object.
So test against the direct public side effect.

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    # blablubb
  end

  def set_cog(cog)
    @cog = new_cog
  end
end

# TEST

class GearTest < MiniTest::Test
  def test_set_cog
    gear = Gear.new
    gear.set_cog(27)
    assert(27, gear.cog)
  end
end
```

### Do not test query / command messages sent to self (private interface)

TDD it for a complex private algorithm were error trailing would be helpful to implement it.

Remove the tests afterwards so you haven't to stick with the implementation.

Just delete them when they begin to fail at refactoring steps.

### Do not test outgoing query messages

An outgoing message is also an incomming message for another object.

This incomming message has already been tested at this object level.

- Don't make assertions
- Don't expect to send them a specific method

REMEMBER: The RECEIVER is responsible for asserting

### Test outgoing command messages

An outgoing message is an incomming message of another object.

Altough you should not test outgoing query messages you should test outgoing command messages.

Because outgoing command messages alter the state of other objects or dependencies (database actions)

Really tempting here you could assert against a public instance var of another object which has been altered by your outgoing command message. But this would be an INTEGRATION TEST, we only cover UNIT TESTS.

```ruby
class Gear
  # ...
  def set_cog(new_cog)
    @cog = new_cog
    changed
    @cog
  end

  def changed
    # the observer sents database changes (side effects)
    # This is an outgoing command message and has to be sent to ensure a proper application functionality
    # Don't assert the side effect which will be triggered by this command message, just check if its called
    # Side effects from this method isn't Gear's responsibility it's an integration test
    observer.changed(chainring, cog)
  end
end

# Proper Test (Unit)

class GearTest < Minitest::Test
  def test_notifies_observers_when_cogs_change
    @observer = Minitest::Mock.new
    @gear = Gear.new(
              chainring: 52,
              cog:       11,
              observer:  @observer)
    @observer.expect(:changed, true, [52, 27])
    @gear.set_cog(27)
    @observer.verify
  end
end
```

Note on mocking:

Beware of an API Drift, FakeObjects and RealApp Objects has to impelment the same logic.

"Ensure test doubles stay in sync with your API"

Tools to ensure this:
  -[rspec-fire](https://github.com/xaviershay/rspec-fire)
  -[minitest-fire](https://github.com/cfcosta/minitest-firemock)
