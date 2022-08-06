require './lib/decryption'

RSpec.describe Decryption do

  before :each do
    @decryption = Decryption.new
  end

  it 'exists' do
    expect(@decryption).to be_a Decryption
  end

  xit 'decrypts a message with a key and date' do
    expect(@decryption.decrypt("keder ohulw", "02715", "040895")).to eq(
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

end
