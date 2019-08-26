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

### Ruby-specific implementations
- in ruby we can take advantage of the fact the classes are just objects
  - no need to always use inheritance-based implementation suggested by GoF
  - can use much simpler class-based implementation
- we can look up classes by name, pass them around and store them for future use
- if product follow a regular naming pattern, you can use `const_get` to get the class name from the name of the product:

```ruby
class IOFactory
  def initialize(format)
    @reader_class = self.class.const_get("#{format}Reader")
    @writer_class = self.class.const_get("#{format}Writer")
  end

  def new_reader
    @reader_class.new
  end

  def new_writer
    @writer_class.new
  end
end

html_factory = IOFactory.new('HTML')
html_reader = html_factory.new_reader

pdf_factory = IOFactory.new('PDF')
pdf_writer = pdf_factory.new(writer)
```
