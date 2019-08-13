class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def balance
    subject.balance
  end

  def deposit(amount)
    subject.deposit(amount)
  end

  def withdraw(amount)
    subject.withdraw(amount)
  end

  private

  def subject
    @subject ||= @creation_block.call
  end
end

# account = VirtualAccountProxy.new { BankAccount.new(10) }
