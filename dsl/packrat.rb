require_relative 'file_finder'

def backup(dir, find_expression=All.new)
  puts "Backup called, source dir=#{dir} find expr=#{find_expression}"
end

def to(backup_directory)
  puts "To called, backup_dir=#{backup_directory}"
end

def interval(minutes)
  puts "Interval called, interval=#{minutes} minutes"
end

eval(File.read('dsl/backup.pr'))
