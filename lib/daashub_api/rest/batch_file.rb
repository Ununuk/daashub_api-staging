require 'daashub_api/batch_file'
require 'daashub_api/request'

module DaashubAPI
  module REST
    module BatchFile
      def list_batch_files
        response = DaashubAPI::Request.perform_get('/v1/batch_files',
                                                   access_token)
        response['items'].map { |item| DaashubAPI::BatchFile.new(item) }
      end

      def create_batch_file(params)
        query = { batch_file: params }
        response = DaashubAPI::Request.perform_post('/v1/batch_files',
                                                    access_token, query: query)
        DaashubAPI::BatchFile.new(response)
      end
    end
  end
end
