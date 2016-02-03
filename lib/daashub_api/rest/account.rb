require 'daashub_api/account'
require 'daashub_api/request'

module DaashubAPI
  module REST
    module Account

      def account_info
        response = DaashubAPI::Request.perform_get('/v1/account/info', access_token)
        DaashubAPI::Account.new(response)
      end

    end
  end
end
