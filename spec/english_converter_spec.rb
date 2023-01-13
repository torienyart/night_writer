require './lib/english_converter'

describe EnglishConverter do
  let(:converter){EnglishConverter.new}

  it 'can exist' do
    expect(converter).to be_an_instance_of(EnglishConverter)
  end

  it 'can have a braille dictionary' do
    expect(converter.dictionary_hash.count).to eq(26)
    expect(converter.dictionary_hash.keys).to eq(('a'..'z').to_a)
    expect(converter.dictionary_hash['a']).to eq(["0.", "..", ".."])
  end

  it 'stores a braille dictionary' do
    expect(converter.braille_dictionary).to eq(dictionary_hash))

  end
  it 'has dictionary keys' do
    expect(converter.a_key).to eq('00')
    expect(converter.b_key).to eq('0.')
    expect(converter.c_key).to eq('.0')
    expect(converter.d_key).to eq('..')
  end
  
end