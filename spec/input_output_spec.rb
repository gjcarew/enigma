require './lib/input_output'

RSpec.describe InputOutput do

  before :each do
    @inputoutput = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
  end

  it 'exists' do
    expect(@inputoutput).to be_an InputOutput
  end

  it 'validates arguments' do
    expect(@inputoutput.validate).to be true
    inputoutput1 = InputOutput.new(["message.csv", "encrypted.txt", "02715", "040895"], "encrypt")
    expect(inputoutput1.validate).to be false
    inputoutput2 = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895", "90210"], "encrypt")
    expect(inputoutput2.validate).to be false
    inputoutput3 = InputOutput.new(["message.txt", "encrypted.txt", "02T15", "040895"], "encrypt")
    expect(inputoutput3.validate).to be false
    inputoutput4 = InputOutput.new(["message.txt", "encrypted.txt", "0271569", "040895"], "encrypt")
    expect(inputoutput4.validate).to be false
  end


  it 'can get a random key' do
    expect(@inputoutput.rand_key).to be_a String
    expect(@inputoutput.rand_key.length).to eq(5)
    expect(0..99999).to cover(@enigma.rand_key.to_i)
  end

  it 'can get todays date' do
    allow(Date).to receive(:today).and_return Date.new(1995,8,4)
    expect(@inputoutput.date_today).to eq("040895")
  end

end
