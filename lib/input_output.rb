require_relative 'enigma'
require_relative 'genericable'

class InputOutput
  include Genericable
  attr_reader :args, :key, :date, :enigma

  def initialize(args, what_to_do)
    @args = args
    @key = rand_key
    @date = date_today
    @enigma = new_enigma(what_to_do)
  end

  def new_enigma(what_to_do)
    check_key_and_date
    message = read_message(@args[0])
    if what_to_do == "encrypt"
      @enigma = Enigma.new.encrypt(message, @key, @date)
      write(@enigma[:encryption])
    elsif what_to_do == "decrypt"
      @enigma = Enigma.new.decrypt(message, @key, @date)
      write(@enigma[:decryption])
    else
      puts "Argument error"
      return "argument error"
    end
    @enigma
  end

  def write(message)
    File.write(@args[1], message)
    puts "Created '#{@args[1]}' with the key #{@key} and date #{@date}"
  end

  def read_message(filepath)
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

end
