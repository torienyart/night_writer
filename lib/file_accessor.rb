class FileAccessor

  def self.message_reciever
    File.open(ARGV[0], "r")
  end
  
  def self.character_count
    message_reciever.read.size
  end
end