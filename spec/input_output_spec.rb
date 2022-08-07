require './lib/input_output'

RSpec.describe InputOutput do

  before :each do
    @inputoutput = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
  end

  it 'exists' do
    expect(@inputoutput).to be_an InputOutput
  end

  it 'creates an encryption or decryption object' do
    expect(@inputoutput.enigma).to be_a(Encryption)
    io2 = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "decrypt")
    expect(io2.enigma).to be_a(Decryption)
  end

  it 'reads and downcases a message' do
    expect(@inputoutput.message("message.txt")).to be_a String
  end

  it 'validates arguments (integration test)' do
    expect(@inputoutput.validate(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@inputoutput.validate(["message.csv", "encrypted.txt", "02715", "040895"])).to be false
  end

  it 'validates filepaths' do
    expect(@inputoutput.validate_filepath(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@inputoutput.validate_filepath(["message.csv", "encrypted.txt", "02715", "040895"])).to be false
  end

  it 'validates number of arguments' do
    expect(@inputoutput.validate_num_args(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@inputoutput.validate_num_args(["message.txt", "encrypted.txt", "02715", "040895", "90210"])).to be false
  end

  it 'validates key and date are numeric' do
    expect(@inputoutput.validate_key_date_numeric?(["message.txt", "encrypted.txt", "02T15", "040895"])).to be false
    expect(@inputoutput.validate_key_date_numeric?(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
  end

  it 'validates the length of the key and date' do
    expect(@inputoutput.validate_key_date_length(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@inputoutput.validate_key_date_length(["message.txt", "encrypted.txt", "0271569", "040895"])).to be false
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

end
