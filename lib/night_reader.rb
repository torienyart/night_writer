require_relative 'file_accessor'
require_relative 'braille_converter'


new_conversion = BrailleConverter.new

new_conversion.convert_to_english

message_characters = FileAccessor.output_character_count
p "Created '#{ARGV[1]}' containing #{message_characters} characters"