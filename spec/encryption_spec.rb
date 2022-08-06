require './lib/encryption'
require './lib/'

RSpec.describe Encryption do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    encryption = Encryption.new
    expect(encryption).to be_an Encryption
  end

  it 'encrypts a message with a key and date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'encrypts a message with just a key' do
    allow(@enigma).to receive(:date_today).and_return("040895")
    expect(@enigma.encrypt("hello world", "02715")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'encrypts a message with a random key and todays date' do
    allow(@enigma).to receive(:date_today).and_return("040895")
    allow(@enigma).to receive(:rand_key).and_return("02715")
    expect(@enigma.encrypt("hello world")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

end
