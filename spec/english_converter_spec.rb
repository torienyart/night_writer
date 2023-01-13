require './lib/english_converter'

describe EnglishConverter do
  let(:converter){EnglishConverter.new}

  it 'can exist' do
    expect(converter).to be_an_instance_of(EnglishConverter)
  end
  
end