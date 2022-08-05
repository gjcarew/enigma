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

  def shifts(key = rand_key, date = date_today)
    offset = (date.to_i * date.to_i).to_s[-4..-1]
    separate_keys = {
      A: key[0..1].to_i + offset[0].to_i,
      B: key[1..2].to_i + offset[1].to_i,
      C: key[2..3].to_i + offset[2].to_i,
      D: key[3..4].to_i + offset[3].to_i}
  end

end
