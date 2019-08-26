class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts("Frog #{@name} is eating.")
  end

  def speak
    puts("Frog #{@name} says Crooooaaak!")
  end

  def sleep
    puts("Frog #{@name} doesn't sleep; he croakes all night!")
  end
end
