require 'daashub_api/base'
require 'daashub_api/company'

module DaashubAPI
  class Query < Base
    def items
      @items ||= @attributes.fetch(:items, []).map { |i| Company.new(i) }
    end

    def sent_at
      @sent_at ||= Time.parse(@attributes[:sent_at])
    end
  end
end
