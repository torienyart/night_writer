require_relative 'file_accessor'
require_relative 'english_converter'

new_conversion = EnglishConverter.new

new_conversion.convert_to_braille

message_characters = FileAccessor.input_character_count
p "Created '#{ARGV[1]}' containing #{message_characters} characters"