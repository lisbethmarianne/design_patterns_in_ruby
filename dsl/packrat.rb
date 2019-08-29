require_relative 'file_finder'
require_relative 'backup'
require_relative 'data_source'

def backup(dir, find_expression=All.new)
  Backup.instance.data_sources << DataSource.new(dir, find_expression)
end

def to(backup_directory)
  Backup.instance.backup_directory = backup_directory
end

def interval(minutes)
  Backup.instance.interval = minutes
end

eval(File.read('dsl/backup.pr'))
Backup.instance.run
