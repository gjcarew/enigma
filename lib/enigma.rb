require 'date'

class Enigma

  def character_set
    ("a".."z").to_a << " "
  end

  def rand_key
    rand(99999).to_s.rjust(5, '0')
  end

  def date_today
    Date.today.strftime("%d%m%y")
  end

  def shifts(key, date)
    offset = (date.to_i * date.to_i).to_s[-4..-1]
    {
      A: key[0..1].to_i + offset[0].to_i,
      B: key[1..2].to_i + offset[1].to_i,
      C: key[2..3].to_i + offset[2].to_i,
      D: key[3..4].to_i + offset[3].to_i
    }
  end

  def encrypt(message, key = rand_key, date = date_today)
    Encryption.new.encrypt(message, key, date)
  end

  def scramble(key, date, shift_pos, slice_pos)
    if slice_pos.nil? == false
      slice_index = character_set.find_index(slice_pos)
      shift_n = shifts(key, date)[shift_pos]
      rotated = character_set.rotate(shift_n)
      rotated[slice_index]
    end
  end

  def add_back_specials(message, encrypted_array)
    message.downcase.chars.select.each_with_index do |char, index|
      if !character_set.include?(char)
        encrypted_array.insert(index, char)
      end
    end
    encrypted_array
  end

  def strip_specials(message)
    message.downcase.chars.select {|char| character_set.include?(char)}
  end
end
