# Guidelines for better Ruby and Rails Code:

1.) All OO Rules including this guideline should be treated like guidelines and not as rules / laws

2.) [Use class-level interfaces only for building objects](http://solnic.eu/2015/03/04/8-things-i-learned-during-8-years-of-ruby-and-rails.html#5---class-interfaces-are-a-smell), [Refactoring specific](http://blog.codeclimate.com/blog/2012/11/14/why-ruby-class-methods-resist-refactoring/)

3.) Use Dependency Injection for objects which need collaborators or configuration

4.) [Immutability](http://solnic.eu/2015/03/04/8-things-i-learned-during-8-years-of-ruby-and-rails.html#3---immutability) - use ValueObjects, or Objects without a public interface for changing its instance vars (mutable state will be your dead)

5.) [Know and respect Sandi's Rules](https://www.youtube.com/watch?v=npOGOmkxuio):

  5.1) Classes can be no longer than one hundred lines of code.

  5.2) Methods can be no longer than five lines of code.

  5.3) Pass no more than four parameters into a method. Hash options are parameters.

  5.4) Controllers can instantiate only one object. Therefore, views can only know about one instance variable and views should only send messages to that object

6.) [Convenience vs Explicitness](http://solnic.eu/2015/03/04/8-things-i-learned-during-8-years-of-ruby-and-rails.html#6---convenience-has-a-big-price)
