module DaashubAPI
  class Company < Base

    def self.from_array(items)
      @companies = (items['items'] || []).map { |i| new(i) }
      check_for_errors(items)
      add_fields(items['fields'])
      @companies
    end

    private

    def self.check_for_errors(items)
      @companies.instance_eval { @daashub_response = items }
      class << @companies
        def error?
          !@daashub_response['errors'].nil?
        end

        def errors
          @daashub_response['errors'] || []
        end
      end
    end

    def self.add_fields(fields)
      if fields && fields.kind_of?(Array)
        @companies.instance_eval { @daashub_fields = fields }
        class << @companies
          def daashub_fields
            @daashub_fields
          end
        end
      end
    end

  end
end
