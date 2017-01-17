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
        perform(access_token) { get(endpoint, options) }
      end

      def perform_post(endpoint, access_token, options = {})
        perform(access_token) { post(endpoint, options) }
      end

      private

      def perform(access_token)
        headers 'Authorization' => "Token token=#{access_token}"
        response = yield
        check_for_errors(response)
        response.parsed_response
      end

      def check_for_errors(response)
        return unless response.parsed_response['error']
        send("error_#{response.response.code}",
             response.parsed_response['error'])
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
