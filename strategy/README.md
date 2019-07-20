## Strategy

- pulling algorithm into a separate object
- define a family of objects, the strategies, which all do the same thing and support the same interface, they look alike from the outside
- user of the stategy, the conext class, can treat the strategies like interchangeable parts
- each strategy does its thing a little differently
- better separation of concerns
- based on composition and delegation rather than inheritance, that makes it easy to switch strategies at runtime
- allows to concentrate the decision about which variation to use in one or a few places
- sharing data between the context and the strategy:
  - pass everything that the strategy needs as arguments when the context calls the methods on the strategy object; or
  - context object passes a reference to itself to the strategy object's methods, strategy can then get the data it needs

![strategy](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/strategy/strategy.png)
