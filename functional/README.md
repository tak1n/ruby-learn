# Functional Programming with Ruby

- Use Value Objects
- Use Pure functions (no side effects, no dependencies on internal state, no time dependencies)

## Value Objects

Value Objects should be immutable (in normal OOP you would define setters for fields of the objects -> attr_writer)
Just omit attr_writers and remember to always return a new instance of the Value Object with the modified data eg.:

```ruby
class Ukulele
  attr_reader :color

  def initialize(color)
    @color = green
  end

  def paint(color)
    self.class.new(color)
  end
end

u1 = Ukulele.new('green')
u2 = u1.paint('red')

u2.object_id == u1.object_id # => false
```

The problem with this approach is you still can modify the data its using.
See `value_objects.rb` for a deeper example and using gems like `Anima` & `Adamantium`

## Pure Functions

In Ruby we don’t usually talk about functions. Instead, we have objects with methods, but the difference is small. When you call a method on an object, it’s as if the object is passed to the function as the argument self. It’s another value the function can rely on to compute its result

## Possible benefits:

### Parallelization

### Memoization

Because pure functions are referentially transparent, we only need to compute their output once for given inputs. Caching and reusing the result of a computation is called memoization, and can only be done safely with pure functions.

### Laziness

### Easier testing / Reproducable Results

When functions are pure and values are easy to inspect and create, then every function call can be reproduced in isolation. The impact this has on testing and debugging is hard to overstate.

An application built on top of functional programming is built on top on pure functions, which can seen as segments for this app.
When there are no side effects in method calls and it also got no dependencies you can easily build those single segments with TDD.

TDD Workflow as always:
- Write test of this pure function (you know the input, you want a specific output)
- Let it fail
- Implement it
- Refactor (this for example means pulling out too much functional processing of data into other pure functions which will be invoked with this data as parameters)

### Documentation:

In my opinion the documentation and understanding of an lib / app written in functional style is better then in OO style.
You have to document each param for each method -> so you know which is passed where and how it is used only from the yard / rdoc documentation.

[Talk Goruco by pat](https://www.youtube.com/watch?v=5ZjwEPupybw)

[Talk arrcamp by plexus](https://www.youtube.com/watch?v=JcFmnF3BDIM)

[Slides of Tom Stuarts talk](http://codon.com/files/thinking-functionally-in-ruby.pdf)
