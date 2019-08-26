## Singleton

- a class that can only have one instance and that provides global access to that instance
- ruby has build in Singleton module
  - creates the class variable and initializes it with a single instance
  - creates the class-level instance method
  - makes `new` private
  - uses lazy-instantiation

### Use and Abuse
- don't use the singleton like a global variable, to communicate between different parts of the system and tighly couple them
- don't use them to make the code simpler, sometimes it's better to just instantiate the one thing
- limit the amount of places your application needs to know that the thing is a singleton, sometimes it's better to pass it down

### Testing
- to make testing easier you can create a regular class and a singleton class
```ruby
require 'singleton'

class SimpleLogger
  # All of the logging functionality in this class..
end


class SingletonLogger < SimpleLogger
  include Singleton
end
```

### Alternatives to the classic singleton

#### Global Variables & Constants as Singletons

```ruby
$logger = SimpleLogger.new
```
- global variables are available everywhere and there is only one instance of a global variable
- not a good idea, because they can be modified

```ruby
Logger = SimpleLogger.new
```
- constants are available gloablly and the content can not change
- still not a good idea, because instantiation can not be delayed and anytime a second instance can be created

#### Classes as Singletons

- define all methods as class methods
```ruby
class ClassBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @log = File.open('log.txt', 'w')
  @level =  WARNING

  def self.error(msg)
    @log.puts(msg)
    @log.flush
  end

  ...

  def self.level=(new_level)
    @level = new_level
  end

  def self.level
    @level
  end
end
```
- solves the issue that somebody could create a second instance of the logger
- does not solve the problem of lazy instantiation (would get created whenever somebody requires the file)

#### Modules as Singletons

```ruby
module ModuleBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open("log.txt", "w")
  @@level =  WARNING

  def self.error(msg)
    @@log.puts(msg)
    @@log.flush
  end

  ...

  def self.warning(msg)
    @@log.puts(msg) if @@level >=  WARNING
    @@log.flush
  end

  def self.info(msg)
    @@log.puts(msg) if @@level >=  INFO
    @@log.flush
  end

  def self.level=(new_level)
    @@level = new_level
  end

  def self.level
    @@level
  end
end
```
- mostly the same as class based singleton
- because you cannot instantiate a module, the intent of the module-based singleton is a bit clearer
