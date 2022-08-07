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

  #
  # def scramble_array(message, key, date, direction)
  #   scrambled_a = []
  #   message.each_slice(4) do |a, b, c, d|
  #     scrambled_a << scramble(key, date, :A, a, direction)
  #     scrambled_a << scramble(key, date, :B, b, direction)
  #     scrambled_a << scramble(key, date, :C, c, direction)
  #     scrambled_a << scramble(key, date, :D, d, direction)
  #   end
  #   scrambled_a.compact
  # end
  #
  # def scramble(key, date, shift_pos, slice_pos, direction)
  #   if slice_pos.nil? == false
  #     slice_index = character_set.find_index(slice_pos)
  #     shift_n = shifts(key, date)[shift_pos]
  #     de_or_en(shift_n, direction)[slice_index]
  #   end
  # end
  #
  # def de_or_en(shift_n, direction)
  #   if direction == "de"
  #     rotated = character_set.rotate(-shift_n)
  #   else
  #     rotated = character_set.rotate(shift_n)
  #   end
  #   rotated
  # end

end
