class EmployeeManager
  def initialize
    @employees = {}
  end

  def add_employee(employee)
    @employees[employee.number] = employee
  end

  def change_address(number, address)
    employee = @employees[number]
    raise "No such employee" if not employee
    employee.address = address
  end

  def delete_employee(number)
    @employees.remove[number]
  end

  def find_employee(number)
    @employees[number]
  end
end

# store = SnapshotMadeleine.new('employees') { EmployeeManager.new }
# Thread.new do
#   while true
#     store.take_snapshot
#   end
# end
# tom = Employee.new('tom', '1001', '1 Division Street')
# harry = Employee.new('harry', '1002', '2345 Street')
# store.execute_command(AddEmployee.new(tom))
# store.execute_command(AddEmployee.new(harry))
# store.execute_command(FindEmployee.new('1001'))
