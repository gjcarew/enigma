require 'enigma'

class Encryption < Enigma

  def encrypt(message, key, date)
    {
      encryption: encrypted_array(message, key, date).join,
      key: key,
      date: date
    }
  end

  def encrypted_array(message, key, date)
    encrypted_a = []
    message.chars.each_slice(4) do |a, b, c, d|
      encrypted_a << scramble(key, date, :A, a)
      encrypted_a << scramble(key, date, :B, b)
      encrypted_a << scramble(key, date, :C, c)
      encrypted_a << scramble(key, date, :D, d)
    end
    encrypted_a
  end

end
