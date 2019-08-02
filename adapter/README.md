## Adapter

- an adaper is an object that crosses the chasm between the interface you have and the interface you need
- need to build an adapter because the interface that the client is expecting is not the interface that the adaptee is offering
- the client expects the target to have a certain interface
- unknown to the client the target is really an adapter
- burried in the adapter is a second object the adaptee, that performs the actual work

![adapter](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/adapter/adapter.png)

- in ruby you can also adapt an object by reopening it and defining new methods, editing existing methods or deleting methods

```ruby
require "british_text_object"

class BritishTextObject
  def color
    colour
  end

  # ...
end
```

- instead of modifying an entire class you can also modify a single instance
  - methods that are unique to an object are called sigleton methods
  - most ruby objects have a second, secret class - the singleton class
  - the singleton class is the first place ruby looks when you call a method
  - you can see the singleton methods of an object by calling `.singleton_methods`

```ruby
class << bto
  def color
    colour
  end

  # ...
end
```

or

```ruby
def bto.color
  colour
end

#...
```
