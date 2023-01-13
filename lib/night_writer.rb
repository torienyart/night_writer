require_relative 'file_accessor'

message_characters = FileAccessor.output_character_count

p "Created '#{ARGV[1]}' containing #{message_characters} characters"