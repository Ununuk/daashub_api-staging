require 'daashub_api/request'
require 'daashub_api/history'

module DaashubAPI
  module REST
    module History
      def requests(params = {})
        options = prepare_requests_options(params)
        response = DaashubAPI::Request.perform_get('/v1/requests', access_token, options)
        DaashubAPI::History.new(response)
      end

      protected

      def prepare_requests_options(params)
        { query: params }
      end
    end
  end
end
