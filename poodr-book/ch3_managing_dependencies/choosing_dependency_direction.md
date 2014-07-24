## Dependency Direction

In all these examples, ```Gear``` depends on ```Wheel``` or ```diameter```.

It could also be reversed, eg.:

```ruby
class Gear
  # ...

  def gear_inches(diameter)
    ratio * diameter
  end

  # ...
end

class Wheel
  # ...

  def gear_inches
    gear.gear_inches(diameter)
  end

  # ...
end

Now ```Wheel``` depends on ```Gear``` and ```gear_inches```.

```Gear``` is still responsible for the calculation but it expects a diameter argument to be passed in by the caller.

### Choosing Dependency direction

The general rule here (on each single class): _Depend on things that change less often than you do_
