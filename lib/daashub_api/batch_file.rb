require 'daashub_api/base'

module DaashubAPI
  class BatchFile < Base
    def started_at
      attr_to_date(:started_at)
    end

    def finished_at
      attr_to_date(:finished_at)
    end

    def created_at
      attr_to_date(:created_at)
    end

    private

    def attr_to_date(attr_name)
      (date = @attributes[attr_name]) && Time.parse(date)
    end
  end
end
