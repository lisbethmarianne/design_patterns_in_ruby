## Iterator

- an Iterator provides the outside world with a sort of movable poiter into the objects stored inside an otherwise opaque aggregate object
- external iterator (object points down to a member of a collection):
```ruby
class ArrayIterator
  def initialize(array)
    @array = Array.new(array) # make copy of array in case it changes during iteration
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end
```
```ruby
array = ['red', 'green', 'blue']

i = ArrayIterator.new(array)
while i.has_next?
  puts("item: #{i.next_item}")
end
```

- internal iterator (code, that needs to deal with the sub-objects, is passed down):
```ruby
def for_each_element(array)
  copy = Array.new(array) # make copy so we can securely change the array in the block
  i = 0
  while i < copy.length
    yield(copy[i])
    i += 1
  end
end
```
```ruby
array = ['red', 'green', 'blue']

for_each_element(array) { |element| puts("item: #{element}") }
```

- with ruby's Enumerable module we can enhance the iterable experience for just about any collection
  - mix in the `Enumerable` module, define `each` method
  - items you are iterating over need a `<=>` comparison operator
```ruby
class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end
```
```ruby
class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end
```
```ruby
my_portfolio = Portfolio.new
my_portfolio.add_account(Account.new("A", 200))
my_portfolio.add_account(Account.new("B", 2000))

my_portfolio.any? { |account| account.balance >= 2000 }
```
