require 'daashub_api/company'
require 'daashub_api/request'

module DaashubAPI
  module REST
    module Company

      def companies(params = {})
        options = prepare_companies_options(params)
        response = DaashubAPI::Request.perform_get('/v1/companies', access_token, options)
        DaashubAPI::Company.from_array(response)
      end

      protected

      def prepare_companies_options(params)
        if params[:where] && params[:where].kind_of?(Hash)
          where = params[:where].first
          params[:where] = "#{where[0]}==#{where[1]}"
        end
        { query: params }
      end

    end
  end
end
