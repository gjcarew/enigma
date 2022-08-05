require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  it 'exists' do
    expect(@enigma).to be_an Enigma
  end

  it 'an attributes' do
    expect(@enigma.message).to eq("message string")
    expect(@enigma.key).to eq("02715")
    expect(@enigma.date).to eq("040895")
  end

  it 'has default attributes for key and date' do
    enigma2 = Enigma.new("other message")
    allow(enigma2).to receive(:rand_key).and_return("98116")
    allow(enigma2).to receive(:today).and_return("04082022")
    expect(enigma2.key).to eq("98116")
    expect(enigma2.date).to eq("04082022")
  end





end
