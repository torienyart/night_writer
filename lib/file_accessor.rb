class FileAccessor

  def self.message_receiver
    File.open(ARGV[0], "r")
  end

  def self.character_count
    message_receiver.read.size
  end
end