require 'httparty'
require 'daashub_api/errors'

module DaashubAPI
  class Request
    include HTTParty
    base_uri 'https://emailmovers-api.herokuapp.com'
    headers 'Content-Type' => 'application/json'
    format :json

    class << self

      def perform_get(endpoint, access_token, options = {})
        headers 'Authorization' => "Token token=#{access_token}"
        response = get(endpoint, options)
        check_for_errors(response)
        response.parsed_response
      end

      private

      def check_for_errors(response)
        send("error_#{response.response.code}", response.parsed_response['error']) if response.parsed_response['error']
      end

      def error_400(message)
        raise BadRequest, message
      end

      def error_401(message)
        raise UnauthorizedError, message
      end

      def error_404(message)
        raise PageNotFound, message
      end

      def error_500(message)
        raise InternalServerError, message
      end

      def method_missing(name, *args, &block)
        super unless name =~ /^error_/
        raise Error, args.first
      end

    end

  end
end
