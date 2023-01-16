require './lib/braille_converter'

describe BrailleConverter do
  let(:converter){BrailleConverter.new}

  it 'can exist' do
    expect(converter).to be_an_instance_of(BrailleConverter)
  end

  it 'has dictionary keys' do
    expect(converter.a_key).to eq('00')
    expect(converter.b_key).to eq('0.')
    expect(converter.c_key).to eq('.0')
    expect(converter.d_key).to eq('..')
  end

  it 'can have an english dictionary' do
    expect(converter.dictionary_hash.count).to eq(27)

    expected = []
    expected << ('a'..'z').to_a
    expected << ' '

    expect(converter.dictionary_hash.values).to eq(expected.flatten)
    expect(converter.dictionary_hash["0.", "..", ".."]).to eq(['a'])
  end

  it 'stores an english dictionary' do
    expect(converter.english_dictionary).to eq(converter.dictionary_hash)
  end

  
  it 'can pull braille characters into array' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('original_message.txt', "w+"))
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('dummy_braille.txt', "r"))
    
    expect(converter.braille_characters).to eq([["0.","0.","00"], ["..", "0.", ".."], ["..", "..", ".."]])
  end
  
  it 'can replace braille characters w/ english' do
    allow(converter).to receive(:braille_characters).and_return([["0.","0.","00"], ["..", "0.", ".."], ["..", "..", ".."]])
    
    expect(converter.replace_characters).to eq(["a", "b", "c"])
  end
  
  it 'can format english characters' do
    allow(converter).to receive(:braille_characters).and_return([["0.","0.","00"], ["..", "0.", ".."], ["..", "..", ".."]])
    
    expect(converter.format_english).to eq("abc")
  end

  it 'can convert braille characters to english characters' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('braille.txt', "w+"))
    allow(converter).to receive(:braille_characters).and_return([["0.","0.","00"], ["..", "0.", ".."], ["..", "..", ".."]])
    
    converter.convert_to_braille
    
    braille = File.open('braille.txt', "r")
    
    expect(braille.read).to eq("0.0.00\n"+"..0...\n" + "......")
  end

  it 'can format multiple lines' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('original_message.txt', "w+"))
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('message.txt', "r"))
    
    converter.convert_to_english
    
    english = File.open('original_message.txt', "r")


    line_1 = english.readlines[0]
    english.rewind
    line_2 = english.readlines[1]
    english.rewind
    line_3 = english.readlines[2]
    
    expect(line_1.size).to eq(41)
    expect(line_2.size).to eq(41)
    expect(line_3.size).to eq(41)

  end
  
end