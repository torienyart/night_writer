class FileAccessor

  def self.message_receiver
    File.open(ARGV[0], "r")
  end

  def self.input_character_count
    message_receiver.read.size
  end

  def self.generate_file
    File.new(ARGV[1], "w+")
  end

  def self.output_character_count
    braille_file = File.open(ARGV[1],"r")
    braille_file.read.size
  end
end