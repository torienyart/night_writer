require_relative 'file_accessor'

message_characters = FileAccessor.character_count

p "Created '#{ARGV[1]}' containing 256 characters"