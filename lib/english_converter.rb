require_relative 'file_accessor'
require './lib//modules/keyable'

class EnglishConverter
  include Keyable
  attr_reader :braille_dictionary
  def initialize
    @braille_dictionary = dictionary_hash
    @english_characters = []
  end

  def dictionary_hash
    {
      'a' => [b_key, d_key, d_key],
      'b' => [b_key, b_key, d_key],
      'c' => [a_key, d_key, d_key],
      'd' => [a_key, c_key, d_key],
      'e' => [b_key, c_key, d_key],
      'f' => [a_key, b_key, d_key],
      'g' => [a_key, a_key, d_key],
      'h' => [b_key, a_key, d_key],
      'i' => [c_key, b_key, d_key],
      'j' => [c_key, a_key, d_key],
      'k' => [b_key, d_key, b_key],
      'l' => [b_key, b_key, b_key],
      'm' => [a_key, d_key, b_key],
      'n' => [a_key, c_key, b_key],
      'o' => [b_key, c_key, b_key],
      'p' => [a_key, b_key, b_key],
      'q' => [a_key, a_key, b_key],
      'r' => [b_key, a_key, b_key],
      's' => [c_key, b_key, b_key],
      't' => [c_key, a_key, b_key],
      'u' => [b_key, d_key, a_key],
      'v' => [b_key, b_key, a_key],
      'w' => [c_key, a_key, c_key],
      'x' => [a_key, d_key, a_key],
      'y' => [a_key, c_key, a_key],
      'z' => [b_key, c_key, a_key],
      ' ' => [d_key, d_key, d_key]
    }
  end

  def convert_to_braille
    braille = FileAccessor.generate_file
    braille.write(format_braille)
    braille.rewind
  end
  
  def english_characters
    message = FileAccessor.message_receiver
    message.rewind
    message.read.delete("\n").split("")
    
  end

  def replace_characters
    braille_characters = english_characters.filter_map do |char|
      dictionary_hash[char]
    end
  end

  def format_braille
    lines_array = replace_characters.transpose.map do |char|
      char.join.chars.each_slice(80).map do |slice|
        slice.join
      end
    end.transpose.join("\n")
  end

end