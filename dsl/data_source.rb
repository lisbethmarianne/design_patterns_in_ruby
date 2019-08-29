class DataSource
  attr_reader :directory, :finder_expression

  def initialize(directory, finder_expression)
    @directory = directory
    @finder_expression = finder_expression
  end

  def backup(backup_directory)
    files = @finder_expression.evaluate(@directory)
    files.each do |file|
      backup_file(file, backup_directory)
    end
  end

  def backup_file(file, backup_directory)
    backup_file = File.join(backup_directory, file)
    FileUtils.mkdir_p(File.dirname(backup_file))
    FileUtils.cp(file, backup_file)
  end
end
