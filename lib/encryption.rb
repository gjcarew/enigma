require 'enigma'

class Encryption < Enigma

  def encrypt(message, key, date)
    stripped = strip_specials(message)
    encrypted_array = scramble_array(stripped, key, date, "en")
    encryption = add_back_specials(message, encrypted_array)
    {
      encryption: encryption.join,
      key: key,
      date: date
    }
  end
end
