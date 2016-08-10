require 'daashub_api/rest/account'
require 'daashub_api/rest/company'
require 'daashub_api/rest/history'

module DaashubAPI
  class Client
    include DaashubAPI::REST::Account
    include DaashubAPI::REST::Company
    include DaashubAPI::REST::History

    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end
  end
end
