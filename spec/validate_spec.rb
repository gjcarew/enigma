require './lib/validate'

RSpec.describe Validate do
  before :each do
    @validate = Validate.new(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")
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

end
