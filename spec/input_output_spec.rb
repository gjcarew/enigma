require './lib/input_output'

RSpec.describe InputOutput do

  before :each do
    @inputoutput = InputOutput.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
  end

  it 'exists' do
    expect(@inputoutput).to be_an InputOutput
  end

  it 'reads and downcases a message' do
    expect(@inputoutput.message("message.txt")).to be_a String
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
