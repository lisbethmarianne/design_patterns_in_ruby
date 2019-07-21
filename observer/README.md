## Observer

- subject acts as a source of news
- any object that is interested in the state of the subject (the news) simply needs to register with the object ahead of time
- class with the news is called the subject
- observers are the objects that are interested in getting the news
- observers can "pull" the information they need from the subject (you need to pass the subject to the update method); or
- subject can "pull" information to the observer by passing the relevant data in the update method, e.g.
```ruby
observer.update_salary(self, old_salary, new_salary)
observer.update_title(self, old_title, new_title)
```

![observer](https://raw.githubusercontent.com/lisbethmarianne/design_patterns_in_ruby/master/observer/observer.png)

### Observer pattern using code blocks

```ruby
module Subject
  def initialize
    @observers = []
  end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)
    end
  end
end
```

```ruby
class Employee
  include Subject

  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end
```

```ruby
fred = Employee.new('Fred', 'Crane Operator', 30000)

fred.add_observer do |changed_employee|
  puts("Cut a new check for #{changed_employee.name}!")
  puts("Their salary is now #{changed_employee.salary}!")
end
```

### Observer Pattern in ActiveRecord

- does not require to register observers, figures out what to observe based on the class name

```ruby
class EmployeeObserver < ActiveRecord::Observer
  def after_create(employee)
  end

  def after_update(employee)
  end

  def after_delete(employee)
  end
end
```
