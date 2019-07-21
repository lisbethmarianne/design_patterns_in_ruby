# Subject class (has the news)
require 'observer'

class Employee
  include Observable

  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    old_salary = salary
    @salary = new_salary

    if old_salary != new_salary
      changed
      notify_observers(self)
    end
  end
end
