class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    @subject.send(name, *args)
  end

  private

  def subject
    @subject ||= @creation_block.call
  end
end

# account = VirtualProxy.new { BankAccount.new(10) }
# array = VirtualProxy.new { Array.new }
