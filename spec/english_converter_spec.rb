require './lib/english_converter'

describe EnglishConverter do
  let(:converter){EnglishConverter.new}

  it 'can exist' do
    expect(converter).to be_an_instance_of(EnglishConverter)
  end

  it 'has dictionary keys' do
    expect(converter.a_key).to eq('00')
    expect(converter.b_key).to eq('0.')
    expect(converter.c_key).to eq('.0')
    expect(converter.d_key).to eq('..')
  end

  it 'can have a braille dictionary' do
    expect(converter.dictionary_hash.count).to eq(27)

    expected = []
    expected << ('a'..'z').to_a
    expected << ' '

    expect(converter.dictionary_hash.keys).to eq(expected.flatten)
    expect(converter.dictionary_hash['a']).to eq(["0.", "..", ".."])
  end

  it 'stores a braille dictionary' do
    expect(converter.braille_dictionary).to eq(converter.dictionary_hash)
  end

  
  it 'can pull english characters into array' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('braille.txt', "w+"))
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('dummy_message.txt', "r"))
    
    expect(converter.english_characters).to eq(["a", "b", "c"])
  end
  
  it 'can replace english characters w/ braille' do
    allow(converter).to receive(:english_characters).and_return(["a"])
    
    expect(converter.replace_characters).to eq([["0.", "..", ".."]])
  end
  
  it 'can format braille characters' do
    allow(converter).to receive(:english_characters).and_return(["a"])
    
    expect(converter.format_braille).to eq("0.\n"+"..\n" + "..")
  end
  
  it 'can take and format multiple letters' do
    allow(converter).to receive(:english_characters).and_return(["a", "b", "c"])
  
    expect(converter.format_braille).to eq("0.0.00\n"+"..0...\n" + "......")
  end

  it 'can convert english characters to braille characters' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('braille.txt', "w+"))
    allow(converter).to receive(:english_characters).and_return(["a", "b", "c"])
    
    converter.convert_to_braille
    
    braille = File.open('braille.txt', "r")
    
    expect(braille.read).to eq("0.0.00\n"+"..0...\n" + "......")
  end

  it 'can format multiple lines' do
    allow(FileAccessor).to receive(:generate_file).and_return(File.new('braille.txt', "w+"))
    allow(FileAccessor).to receive(:message_receiver).and_return(File.open('message.txt', "r"))
    
    converter.convert_to_braille
    
    braille = File.open('braille.txt', "r")


    line_1 = braille.readlines[0]
    braille.rewind
    line_2 = braille.readlines[1]
    braille.rewind
    line_3 = braille.readlines[2]
    
    expect(line_1.size).to eq(81)
    expect(line_2.size).to eq(81)
    expect(line_3.size).to eq(81)

  end
  
end