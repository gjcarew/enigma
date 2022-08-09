require 'date'

module Genericable

    def rand_key
      rand(99999).to_s.rjust(5, '0')
    end

    def date_today
      Date.today.strftime("%d%m%y")
    end

end
