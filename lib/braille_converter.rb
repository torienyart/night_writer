require_relative 'file_accessor'

class BrailleConverter
  attr_reader :english_dictionary
  def initialize
    @english_dictionary = dictionary_hash
    @braille_characters = []
  end

  def dictionary_hash
    {
      [b_key, d_key, d_key] => 'a',
      [b_key, b_key, d_key] => 'b' ,
      [a_key, d_key, d_key] => 'c',
      [a_key, c_key, d_key] => 'd',
      [b_key, c_key, d_key] => 'e',
      [a_key, b_key, d_key] => 'f',
      [a_key, a_key, d_key] => 'g',
      [b_key, a_key, d_key] => 'h',
      [c_key, b_key, d_key] => 'i',
      [c_key, a_key, d_key] => 'j',
      [b_key, d_key, b_key] => 'k',
      [b_key, b_key, b_key] => 'l',
      [a_key, d_key, b_key] => 'm',
      [a_key, c_key, b_key] => 'n',
      [b_key, c_key, b_key] => 'o',
      [a_key, b_key, b_key] => 'p',
      [a_key, a_key, b_key] => 'q',
      [b_key, a_key, b_key] => 'r',
      [c_key, b_key, b_key] => 's',
      [c_key, a_key, b_key] => 't',
      [b_key, d_key, a_key] => 'u',
      [b_key, b_key, a_key] => 'v',
      [c_key, a_key, c_key] => 'w',
      [a_key, d_key, a_key] => 'x',
      [a_key, c_key, a_key] => 'y',
      [b_key, c_key, a_key] => 'z',
      [d_key, d_key, d_key] => ' '
    }
  end
  
  def a_key
    '00'
  end

  def b_key
    '0.'
  end

  def c_key
    '.0'
  end

  def d_key
    '..'
  end

  def braille_characters
    message = FileAccessor.message_receiver
    message.rewind
    lines = message.read.split("\n")
    char_lines = lines.map do |line|
      line.chars.each_slice(2).map do |char_lines|
        char_lines.join
      end
    end.each_slice(3).map do |triple_line|
      triple_line.transpose
    end
  end

  def replace_characters
    english_characters = braille_characters.map do |line|
      line.map do |char|
        dictionary_hash[char]
      end
    end
  end

  def format_english
    replace_characters.map do |line|
      line.join
    end.join("\n")
  end

  def convert_to_english
    english = FileAccessor.generate_file
    english.write(format_english)
    english.rewind
  end

end