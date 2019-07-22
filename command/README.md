## Command

- instruction to do sth. specific
- can be executed now, later, or when sth. specific happens
- instead of saying "Do this!" you are saying "Remember how to do this," and, sometime later, "Do that thing that I told you to remember."
- commands can be made undoable (`unexecute`)

![command](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/command/command.png)

- often used in GUIs
  - separates sth. that changes (thing that happens when the button gets pushed) from sth. that does not change (generic button stuff)

```ruby
class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  # Lots of button drawing and management code

  def on_button_push
    @command.execute if @command
  end
end
```
```ruby
class SaveCommand
  def execute
    # save the current document
  end
end
```
```ruby
save_button = SlickButton.new(SaveCommand.new)
```

### Using code-blocks
```ruby
class SlickButton
  attr_accessor :command

  def initialize(&block)
    @command = block
  end

  # Lots of button drawing and management code

  def on_button_push
    @command.call if @command
  end
end
```
```ruby
new_button = SlickButton.new do
  # e.g. create a new document
end
```
