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


### Strategy using Code-Blocks

- you can look at a strategy as a lump of code that knows how to do sth. and is wrapped up in an object
- code-block strategies work only when the strategy interface is a simple, one-method affair (only method you can call on a Proc is `call`)

```ruby
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end
```
```ruby
HTML_FORMATTER = lambda do |context|
  puts('<html>')
  puts('  <head>')
  puts("    <title>#{context.title}</title>")
  puts('  </head>')
  puts('  <body>')
  context.text.each do |line|
    puts("    <p>#{line}</p>")
  end
  puts('  </body>')
  puts('</html>')
end

report = Report.new &HTML_FORMATTER
report.output_report
```
or
```ruby
report = Report.new do |context|
  puts("**** #{context.title} ****")
  context.text.each do |line|
    puts(line)
  end
end

report.output_report
```
