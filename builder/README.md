## Builder

- pattern, designed to help you configure complex objects
- can help to avoid creating invalid objects and help you create valid ones
- client of the builder object is the director, because it directs the builder in the construction of the new object (the product)

![builder](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/builder/builder.png)

- instead of building a computer like this

```ruby
motherboard = Motherboard.new(TurboCPU.new, 4000)
drived = []
drives << Drive.new(:hard_drive, 200000, true)
drives << Drive.new(:cd, 760, true)
drives << Drive.new(:dvd, 4700, false)

computer = Computer.new(:lcd, motherboard, drives)
```

- you can use a builder like this

```ruby
builder = ComputerBuilder.new
builder.turbo
builder.add_cd(true)
builder.add_dvd
builder.add_hard_disk(200000)

computer = builder.computer
```
