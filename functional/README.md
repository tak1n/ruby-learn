# Functional Programming with Ruby

- Freezing variables
- Use Pure functions (no side effects, no dependencies on internal state, no time dependencies) -> kinda frozen methods

## Possible benefits:

### Easier testing:

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
