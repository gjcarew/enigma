class Validate

  def validate(args, what_to_do)
    if validate_filepath(args) &&
      validate_num_args(args) &&
      validate_key_date_numeric?(args) &&
      validate_key_date_length(args)
      InputOutput.new(args, what_to_do)
    end
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
