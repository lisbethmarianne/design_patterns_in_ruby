class Drive
  attr_reader :type, :size, :writeable

  def initialize(type, size, writeable)
    @type = type
    @size = size
    @writeable = writeable
  end
end
