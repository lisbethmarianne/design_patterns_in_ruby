## Dynamically loading classes with the 'Convention over Configuration' pattern

- build an extensible system without carrying the configuration burden
- pattern suggests establishing some conventions based on class, method and file names, as well as a standard directory layout, instead of relying on configuration files

- e.g. you require the user to put any new adapters into specific directory and with the name `<protocol>Adapter`, then you can instantiate and load them like this:

```ruby
def adapter_for(message)
  protocol = message.to.scheme.downcase
  adapter_name = "#{protocol.capitalize}Adapter"
  adapter_class = self.class.const_get(adapter_name)
  adapter_class.new
end
```

```ruby
def load_adapters
  lib_dir = File.dirname(__FILE__)
  full_pattern = File.join(lib_dir, 'adapter', '*.rb')
  Dir.glob(full_pattern).each {|file| require file }
end
```
- file structure:

![gateway](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/convention_over_configuration/gateway.png)

- can provide a Ruby script to generate the scaffold for a new adapter class that can be run with `ruby adapter_scaffold.rb ftp` and will generate a `FtpAdapter`

```ruby
protocol_name = ARGV[0]
class_name = protocol_name.capitalize + 'Adapter'
file_name = File.join('adapter', protocol_name + '.rb')

scaffolding = %Q{
  class #{class_name}
    def send_message(message)
      # Code to send the message
    end
  end
}

File.open(file_name, 'w') do |f|
  f.write(scaffolding)
end
```

- while configuration files provide some (maybe hard to interpret) road map for your system, conventions-based systems need to supply their road map via documentation
- make sure conventions are consistent and work as expected
