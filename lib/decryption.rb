require 'enigma'

class Decryption < Enigma

  def decrypt(message, key, date)
    stripped = strip_specials(message)
    decryption = add_back_specials(message, decrypted_array(stripped, key, date))
    {
      decryption: decryption.join,
      key: key,
      date: date
    }
  end


  def decrypted_array(message, key, date)
    decrypted_a = []
    message.each_slice(4) do |a, b, c, d|
      decrypted_a << unscramble(key, date, :A, a)
      decrypted_a << unscramble(key, date, :B, b)
      decrypted_a << unscramble(key, date, :C, c)
      decrypted_a << unscramble(key, date, :D, d)
    end
    decrypted_a.compact
  end

  def unscramble(key, date, shift_pos, slice_pos)
    if slice_pos.nil? == false
      slice_index = character_set.find_index(slice_pos)
      shift_n = shifts(key, date)[shift_pos]
      rotated = character_set.rotate(-shift_n)
      rotated[slice_index]
    end
  end

end
