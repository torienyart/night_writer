class FileAccessor

  def self.message_receiver
    File.open(ARGV[0], "r")
  end

  def self.input_character_count
    message_receiver.read.gsub("\n",'').size
  end

  def self.generate_file
    File.new(ARGV[1], "w+")
  end

  def self.open_new_file
    File.open(ARGV[1],"r")
  end

  def self.output_character_count
    open_new_file.read.gsub("\n",'').size
  end
end