require './lib/file_accessor'

describe FileAccessor do
  it 'can count characters in a file' do
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('message.txt', "r"))
    
    expect(FileAccessor.character_count).to eq(43)
  end
end