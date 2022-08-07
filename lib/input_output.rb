class InputOutput

  def initialize(args, what_to_do)
    @args = args
    @what_to_do = what_to_do
    @key = rand_key
    @date = date_today
  end

  def validate(args)
    if validate_filepath(args) &&
      validate_num_args(args) &&
      validate_key_date_numeric?(args) &&
      validate_key_date_length(args)
      true
    else
      false
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
    result = []
    args[2..3].each do |arg|
      if arg != nil && arg.match?(/\D/)
        puts "Please make sure your key and date only contain numbers"
        result << false
      else
        result << true
      end
    end
    result.all?{ |r| r == true}
  end

  def validate_key_date_length(args)
    result = []
    args[2..3].each do |arg|
      if arg != nil && ![5, 6].include?(arg.length)
      puts "Your key should be 5 digits and your date should be in DDMMYY format"
        result << false
      else
        result << true
      end
    end
    result.all?{ |r| r == true}
  end

  def rand_key
    rand(99999).to_s.rjust(5, '0')
  end

  def date_today
    Date.today.strftime("%d%m%y")
  end


end
