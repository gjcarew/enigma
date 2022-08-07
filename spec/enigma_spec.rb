require './lib/enigma'
require './lib/encryption'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an Enigma
  end

  it 'has a character set' do
    expect(@enigma.character_set).to all(be_a(String))
    expect(@enigma.character_set.length).to eq(27)
  end

  it 'can get todays date' do
    allow(Date).to receive(:today).and_return Date.new(1995,8,4)
    expect(@enigma.date_today).to eq("040895")
  end

  it 'calculates shifts' do
    expect(@enigma.shifts("02715", "040895")).to eq(
      { A: 3,
        B: 27,
        C: 73,
        D: 20 }
    )
  end

  it 'encrypts a message with a key and date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'decrypts a message with a key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
    {
      decryption: "hello world",
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

  it 'decrypts a message with a key' do
    allow(@enigma).to receive(:date_today).and_return("040895")
    expect(@enigma.decrypt("keder ohulw", "02715")).to eq(
    {
      decryption: "hello world",
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

  it 'removes special characters from a message' do
    expect(@enigma.strip_specials("Hello! World.")).to eq(
      ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end

  it 'adds special characters back to the message after encryption' do
    @encryption = Encryption.new
    message = "Hello! World."
    stripped = @enigma.strip_specials(message)
    encrypted_a = @enigma.scramble_array(stripped, "02715", "040895", "en")
    expect(@enigma.add_back_specials(message, encrypted_a)).to eq(
      ["k", "e", "d","e", "r", "!", " ", "o", "h", "u", "l", "w", "."]
    )
  end

end
