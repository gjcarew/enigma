require 'date'

class Enigma
  attr_reader :character_set

  def initialize()
    @character_set = ("a".."z").to_a << " "
  end

  def rand_key
    rand(99999).to_s.rjust(5, '0')
  end
end
