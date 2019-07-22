class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute
    @commands.each { |command| command.execute }
  end

  def description
    description = ''
    @commands.each { |command| description += command.description + "\n" }
    description
  end
end
