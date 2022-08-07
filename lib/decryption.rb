require 'enigma'

class Decryption < Enigma

  def decrypt(message, key, date)
    stripped = strip_specials(message)
    decrypted_array = scramble_array(stripped, key, date, "de")
    decryption = add_back_specials(message, decrypted_array)
    {
      decryption: decryption.join,
      key: key,
      date: date
    }
  end
end
