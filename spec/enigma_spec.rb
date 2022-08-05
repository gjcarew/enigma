require './lib/enigma'

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

  it 'can get a random key' do
    expect(@enigma.rand_key).to be_a String
    expect(@enigma.rand_key.length).to eq(5)
    expect(0..99999).to cover(@enigma.rand_key.to_i)
  end

  it 'can get todays date' do
    allow(Date).to receive(:today).and_return Date.new(1995,8,4)
    expect(@enigma.date_today).to eq("040895")
  end

  xit 'calculates shifts' do
    expect(@enigma.shifts("02715", "040895")).to eq(
      { A: 3,
        B: 27,
        C: 73,
        D: 20 }
    )
  end

  xit 'encrypts a message with a key and date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  xit 'decrypts a message with a key and date' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

  xit 'encrypts a message with just a key' do
    allow(@enigma).to receive(:date_today).and_return("040895")
    expect(@enigma.encrypt("hello world", "02715")).to eq(
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  xit 'decrypts a message with a key' do
    allow(@enigma).to receive(:date_today).and_return("040895")
    expect(@enigma.decrypt("keder ohulw", "02715")).to eq(
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

  xit 'encrypts a message with a random key and todays date' do
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
