class InputOutput

  def initialize(args, what_to_do)
    @args = args
    @what_to_do = what_to_do
    @key = rand_key
    @date = date_today
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
      puts "Please make sure your key is 5 digits and you date is formatted DDMMYY"
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
