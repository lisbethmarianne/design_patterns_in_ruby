## Factory

- techique of pushing the "which class" decision down on a subclass
- creator (`Pond`), concrete creators (`DuckPond`, `FrogPond`), products (`Duck` and `Frog`)
- uses the Template Method pattern

![factory](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/factory/factory.png)

## Abstract Factory

- used when you need to create a set of compatible objects
- 2 concrete factories, each of which produces it's own set of compatible products
- uses the Strategy pattern

![abstract_factory](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/abstract_factory/abstract_factory.png)
