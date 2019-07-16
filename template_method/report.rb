# Abstract base class controls the higher-level processing through the template method,
# the subclasses fill in the details
class Report
  def initialize
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well']
  end

  # this is the template method
  def output_report
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end
  end

  def output_body
    @text.each do |line|
      output_line(line)
    end
  end

  # Hook method, provide default behavior, but can be overwritten by subclasses
  def output_start
  end

  def output_head
    raise "Called abstract method: output_head"
  end

  def output_body_start
  end

  def output_line(line)
    raise "Called abstract method: output_line"
  end

  def output_body_end
  end

  def output_end
  end
end
