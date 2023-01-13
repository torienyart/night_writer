class FileAccessor

  def self.message_receiver
    File.open(ARGV[0], "r")
  end

  def self.character_count
    message_reciever.read.size
  end
end