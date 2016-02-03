require 'daashub_api/rest/account'
require 'daashub_api/rest/company'

module DaashubAPI
  class Client
    include DaashubAPI::REST::Account
    include DaashubAPI::REST::Company

    def initialize(access_token)
      @access_token = access_token
    end

    def access_token
      @access_token
    end

  end
end
