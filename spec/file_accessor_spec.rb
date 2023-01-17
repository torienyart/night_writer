require_relative 'spec_helper'

describe FileAccessor do
  it 'can count characters in a file' do
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('dummy_message.txt', "r"))
    
    expect(FileAccessor.input_character_count).to eq(3)
  end

  it 'can count output characters' do
    allow(FileAccessor).to receive(:open_new_file).and_return(File.open('dummy_braille.txt', "r"))

    expect(FileAccessor.output_character_count).to eq(18)
  end

  it 'can receive a message' do
    allow(File).to receive(:open).and_return(File.open('dummy_message.txt', "r"))

    expect(FileAccessor.message_receiver).to be_an_instance_of File
  end

  it 'can generate a file' do
    allow(File).to receive(:new).and_return(File.new('dummy_braille.txt', "r"))

    expect(FileAccessor.generate_file).to be_an_instance_of File
  end

  it 'can receive a message' do
    allow(File).to receive(:open).and_return(File.open('dummy_braille.txt', "r"))

    expect(FileAccessor.open_new_file).to be_an_instance_of File
  end
end