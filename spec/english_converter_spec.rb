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
    expect(converter.dictionary_hash.count).to eq(26)
    expect(converter.dictionary_hash.keys).to eq(('a'..'z').to_a)
    expect(converter.dictionary_hash['a']).to eq(["0.", "..", ".."])
  end

  it 'stores a braille dictionary' do
    expect(converter.braille_dictionary).to eq(converter.dictionary_hash)
  end

  it 'can convert english characters to braille characters' do
    converter.convert_to_braille
    
    braille = File.open('braille.txt', "r")
    expect(braille.read).to eq("0.\n"+"..\n" + "..")
  end

  it 'can pull english characters into array' do
    expect(converter.english_characters).to eq(["a"])
  end

  it 'can replace english characters w/ braille' do
    allow(converter).to receive(:english_characters).and_return(["a"])

    expect(converter.replace_characters).to eq(["0.", "..", ".."])
  end

  it 'can format braille characters' do
    allow(converter).to receive(:english_characters).and_return(["a"])

    expect(converter.format_braille).to eq("0.\n"+"..\n" + "..")
  end
  
end