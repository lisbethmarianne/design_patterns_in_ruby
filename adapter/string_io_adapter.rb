class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end

    ch = @string[@position]
    @position += 1
    ch
  end

  def eof?
    @position >= @string.length
  end
end
