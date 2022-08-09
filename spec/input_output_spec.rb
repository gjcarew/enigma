require './lib/input_output'

RSpec.describe InputOutput do

  before :each do
    @inputoutput = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
    @decryption = InputOutput.new(["encrypted.txt", "decrypted.txt", "02715", "040895"], "decrypt")
  end

  it 'exists' do
    expect(@inputoutput).to be_an InputOutput
  end

  it 'reads and downcases a message' do
    expect(@inputoutput.read_message("message.txt")).to be_a String
  end

  it 'can get a random key' do
    expect(@inputoutput.rand_key).to be_a String
    expect(@inputoutput.rand_key.length).to eq(5)
    expect(0..99999).to cover(@inputoutput.rand_key.to_i)
  end

  it 'can get todays date' do
    allow(Date).to receive(:today).and_return Date.new(1995,8,4)
    expect(@inputoutput.date_today).to eq("040895")
  end

  it 'creates an encryption with a key and date' do
    allow_any_instance_of(InputOutput).to receive(:read_message).and_return("hello world")
    new_input = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
    expect(new_input.enigma).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end

  it 'creates a decryption with a key and date' do
    allow_any_instance_of(InputOutput).to receive(:read_message).and_return("keder ohulw")
    new_input = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "decrypt")
    expect(new_input.enigma).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
    })
  end

  it 'returns an argument error if there has been a validation failure' do
    new_input = InputOutput.new(["message.txt", "encrypted.txt", "02715"], "something else")
    expect(new_input.enigma).to eq("argument error")
  end

  it '** bonus ** creates a decryption with just a date' do
    allow_any_instance_of(InputOutput).to receive(:read_message).and_return("hello world")
    allow_any_instance_of(InputOutput).to receive(:rand_key).and_return("02715")
    new_input = InputOutput.new(["message.txt", "encrypted.txt", "040895"], "encrypt")
    expect(new_input.enigma).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })
  end
end
