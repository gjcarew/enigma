require_relative 'encryption'
require_relative 'decryption'

class InputOutput

  def initialize(args, what_to_do)
    @args = args
    @key = rand_key
    @date = date_today
    @enigma = new_enigma(what_to_do)
  end

  def new_enigma(what_to_do)
    check_key_and_date
    if what_to_do == "encrypt"
      @enigma = Encryption.new.encrypt(message(@args[0]), @key, @date)
      write(@enigma[:encryption])
    elsif what_to_do == "decrypt"
      @enigma = Decryption.new.decrypt(message(@args[0]), @key, @date)
      write(@enigma[:decryption])
    else
      puts "Argument error"
    end
  end

  def write(message)
    File.write(@args[1], message)
    puts "Created '#{@args[1]}' with the key #{@key} and date #{@date}"
  end

  def message(filepath)
    File.read(filepath).downcase
  end

  def check_key_and_date
    if !@args[2].nil?
      if @args[2].length == 5 && @args[3] != nil
        @key = @args[2]
        @date = @args[3]
      elsif @args[2].length == 5
        @key = @args[2]
      elsif @args[2].length == 6
        @date = @args[2]
      end
    end
  end

  def rand_key
    rand(99999).to_s.rjust(5, '0')
  end

  def date_today
    Date.today.strftime("%d%m%y")
  end

end
