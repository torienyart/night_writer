require_relative 'file_accessor'

class EnglishConverter
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
      'm' => [c_key, a_key, c_key],
      'n' => [a_key, d_key, a_key],
      'o' => [a_key, c_key, a_key],
      'p' => [b_key, c_key, a_key],
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

  def convert_to_braille
    braille = FileAccessor.generate_file
    braille.write(format_braille)
    braille.rewind
  end
  
  def english_characters
    message = FileAccessor.message_receiver
    message.rewind
    message.read.split("")
  end
  
  # def replace_characters
  #   conversion = []
  #   dictionary_hash.each do |k, v|
  #     english_characters.each do |char|
  #       conversion << v if k == char
  #     end
  #   end
  #   conversion.flatten
  # end

  def replace_characters
    conversion = Hash.new
    dictionary_hash.each do |k, v|
      english_characters.each do |char|
        if k == char
          conversion[char] = v
        end
      end
    end
    conversion
  end

  def format_braille
    line_1 = []
    line_2 = []
    line_3 = []

    replace_characters.each do |k, v|
      line_1 << v[0]
    end

    replace_characters.each do |k, v|
      line_2 << v[1]
    end

    replace_characters.each do |k, v|
      line_3 << v[2]
    end

    converted = line_1.join + "\n" + line_2.join + "\n" + line_3.join    
  end

end