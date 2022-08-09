require './lib/validate'

RSpec.describe Validate do
  before :each do
    @validate = Validate.new
  end

  it 'validates arguments (integration test)' do
    expect(@validate.validate(["message.txt", "encrypted.txt", "02715", "040895"], "encrypt")).to be_a InputOutput
    expect(@validate.validate(["message.csv", "encrypted.txt", "02715", "040895"], "encrypt")).to eq(nil)
  end

  it 'validates filepaths' do
    expect(@validate.validate_filepath(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@validate.validate_filepath(["message.csv", "encrypted.txt", "02715", "040895"])).to be false
  end

  it 'validates number of arguments' do
    expect(@validate.validate_num_args(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@validate.validate_num_args(["message.txt", "encrypted.txt", "02715", "040895", "90210"])).to be false
  end

  it 'validates key and date are numeric' do
    expect(@validate.validate_key_date_numeric?(["message.txt", "encrypted.txt", "02T15", "040895"])).to be false
    expect(@validate.validate_key_date_numeric?(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
  end

  it 'validates the length of the key and date' do
    expect(@validate.validate_key_date_length(["message.txt", "encrypted.txt", "02715", "040895"])).to be true
    expect(@validate.validate_key_date_length(["message.txt", "encrypted.txt", "0271569", "040895"])).to be false
  end

end
