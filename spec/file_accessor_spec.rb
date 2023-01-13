require './lib/file_accessor'

describe FileAccessor do
  xit 'can count characters in a file' do
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('message.txt', "r"))
    
    expect(FileAccessor.input_character_count).to eq(43)
  end

  xit 'can count output characters' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('braille.txt', "w+"))

    expect(FileAccessor.output_character_count).to eq(0)
  end
end