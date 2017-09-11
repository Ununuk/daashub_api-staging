module DaashubAPI
  class Company < Base
    def self.from_array(items)
      @companies = items.fetch('items', []).map { |i| new(i) }
      check_for_errors(items)
      add_fields(items['fields'])
      add_lookalikes_fields(items['lookalikes_items'])
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
      if fields && fields.is_a?(Array)
        @companies.instance_eval { @daashub_fields = fields }
        class << @companies
          attr_reader :daashub_fields
        end
      end
    end

    def self.add_lookalikes_fields(fields)
      if fields && fields.is_a?(Array)
        @companies.instance_eval { @lookalikes_fields = fields }
        class << @companies
          attr_reader :lookalikes_fields
        end
      end
    end
  end
end
