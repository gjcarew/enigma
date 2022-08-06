require './lib/encryption'

RSpec.describe Encryption do
  before :each do
    @encryption = Encryption.new("hello world", "02715", "040895")
  end

  it "exists" do
    expect(@encryption).to be_an Encryption
  end

  it 'has attributes' do
    expect(@encryption.message). to eq("hello world")
    expect(@encryption.key).to eq("02715")
    expect(@encryption.date).to eq("040895")
  end

  it 'encrypts a message with a key and date' do
    expect(@encryption.encrypt("hello world", "02715", "040895")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'encrypts a message with just a key' do
    allow(@encryption).to receive(:date_today).and_return("040895")
    expect(@encryption.encrypt("hello world", "02715")).to eq(
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
