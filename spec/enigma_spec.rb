require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new("message string")
    expect(enigma).to be_an Enigma
  end





end
