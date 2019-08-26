## Decorator

- vary the responsibilities of an object
- easily add an enhancement to an object
- allows you to layer features atop of each other

![decorator](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/decorator/decorator.png)


### Wrapping Methods

- we can also modify the behaviour of a single instance/class

```ruby
writer = SimpleWriter.new('out.txt')

class << writer
  alias old_write_line write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{line}")
  end
end
```

## Decorating with Modules

- adding a module in the objects inheitance tree with `extend`

```ruby
module TimestampingWriter
  def write_line(line)
    super("#{Time.now}: #{line}")
  end
end

module NumberingWriter
  attr_reader :line_number

  def write_line(line)
    @line_number = 1 unless @line_number
    super("#{@line_number}: #{line}")
    @line_number += 1
  end
end

writer = SimpleWriter.new('out.txt')
writer.extend(NumberingWriter)
writer.extend(TimestampingWriter)

writer.write_line('hello')
```
