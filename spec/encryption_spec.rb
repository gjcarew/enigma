require './lib/encryption'
require './lib/enigma'

RSpec.describe Encryption do
  before :each do
    @encryption = Encryption.new
  end

  it 'exists' do
    expect(@encryption).to be_an(Encryption)
  end

  it 'encrypts a message with a key and date' do
    expect(@encryption.encrypt("hello world", "02715", "040895")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

end
