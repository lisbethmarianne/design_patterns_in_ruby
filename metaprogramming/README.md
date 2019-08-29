## Creating Custom Objects with Metaprogramming

- gain more flexibility when defining new classes and create custom tailored objects on the fly.

- we can make use of singleton methods:
```ruby
def new_plant(stem_type, leaf_type)
  plant = Object.new
  if stem_type == :fleshy
    def plant.stem
      'fleshy'
    end
  else
    def plant.stem
      'woody'
    end
  end
  if leaf_type == :broad
    def plant.leaf
      'broad'
    end
  else
    def plant.leaf
      'needle'
    end
  end
  plant
end

plant1 = new_plant(:fleshy, :broad)
plant2 = new_plant(:woody, :needle)
puts "Plant 1's stem: #{plant1.stem} leaf: #{plant1.leaf}"
puts "Plant 2's stem: #{plant2.stem} leaf: #{plant2.leaf}"
```

- we can add a bunch of methods via modules and `extend` (works like include)
```ruby
def new_animal(diet, awake)
  animal = Object.new
  if diet == :meat
    animal.extend(Carnivore)
  else
    animal.extend(Herbivore)
  end
  if awake == :day
    animal.extend(Diurnal)
  else
    animal.extend(Nocturnal)
  end
  animal
end
```

- we can also use `class_eval` to create methods

```ruby
class CompositeBase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.member_of(composite_name)
    code = %Q{
      attr_accessor :parent_#{composite_name}
    }

    class_eval(code)
  end

  def self.composite_of(composite_name)
    member_of composite_name

    code = %Q{
      def sub_#{composite_name}s
        @sub_#{composite_name}s = [] unless @sub_#{composite_name}s
        @sub_#{composite_name}s
      end

      def add_sub_#{composite_name}(child)
        return if sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s << child
        child.parent_#{composite_name} = self
      end

      def delete_sub_#{composite_name}(child)
        return unless sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s.delete(child)
        child.parent_#{composite_name} = nil
      end
    }

    class_eval(code)
  end
end

class Tiger < CompositeBase
  member_of(:population)
  member_of(:classification)
end

class Tree < CompositeBase
  member_of(:population)
  member_of(:classification)
end

class Jungle < CompositeBase
  composite_of(:population)
end

class Species < CompositeBase
  composite_of(:classification)
end

tony_tiger = Tiger.new('tony')
se_jungle = Jungle.new('southeastern jungle tigers')
se_jungle.add_sub_population(tony_tiger)

tony_tiger.parent_population # southeastern jungle tigers

species = Species.new('P. tigris')
species.add_sub_classification(tony_tiger)

tony_tiger.parent_classification # P. tigris
```

- some handy methods when doing metaprogramming to modify your objects are `public_methods` and `respond_to?`, with them you can keep track of what your objects can do

- metaprogramming can be dangerous as you will not know exaclty what code runs as it is created when it runs, debugging can be very hard (can not search for method names), methods can be overwritten unexpectedly

- often used in DSLs
