class ChecksummingWriter < WriterDecorator
  attr_reader :check_sum

  def initialize(real_writer)
    super(real_writer)
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte { |byte| @check_sum = (@check_sum + byte.ord) % 256 }
    @check_sum += "\n".ord % 256
    @real_writer.write_line(line)
  end
end
