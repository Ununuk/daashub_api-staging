require 'daashub_api/base'

module DaashubAPI
  class Account < Base

    def renewal_date
      (rdate = @attributes[:renewal_date]) && Time.parse(rdate)
    end

  end
end
