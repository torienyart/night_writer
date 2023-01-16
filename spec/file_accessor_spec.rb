require './lib/file_accessor'

describe FileAccessor do
  it 'can count characters in a file' do
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('dummy_message.txt', "r"))
    
    expect(FileAccessor.input_character_count).to eq(3)
  end

  it 'can count output characters' do
    allow(FileAccessor).to receive(:open_new_file).and_return(File.open('dummy_braille.txt', "r"))

    expect(FileAccessor.output_character_count).to eq(20)
  end
end