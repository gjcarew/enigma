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
    if validate(@args) && what_to_do == "encrypt"
      @enigma = Encryption.new.encrypt(message(@args[0]), @key, @date)
      write(@enigma[:encryption])
    elsif validate(@args) && what_to_do == "decrypt"
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

  def validate(args)
    validate_filepath(args) &&
    validate_num_args(args) &&
    validate_key_date_numeric?(args) &&
    validate_key_date_length(args)
  end

  def validate_filepath(args)
    if !args[0..1].all?{ |filepath| filepath[-4..-1] == ".txt"}
      puts "Please make sure your filepaths are .txt files"
      false
    else
      true
    end
  end

  def validate_num_args(args)
    if args.length > 4 || args.length < 2
      puts "Wrong number of arguments"
      false
    else
      true
    end
  end

  def validate_key_date_numeric?(args)
    if !args[2..3].all?{ |arg| arg != nil && !arg.match?(/\D/)}
      puts "Please make sure your key and date are all numeric"
      false
    else
      true
    end
  end

  def validate_key_date_length(args)
    if !args[2..3].all?{ |arg| arg != nil && [5, 6].include?(arg.length)}
      puts "Please make sure your key is 5 digits and your date is formatted 'DDMMYY'"
      false
    else
      true
    end
  end

  def rand_key
    rand(99999).to_s.rjust(5, '0')
  end

  def date_today
    Date.today.strftime("%d%m%y")
  end

end