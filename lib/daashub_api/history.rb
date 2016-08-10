require 'daashub_api/base'
require 'daashub_api/query'

module DaashubAPI
  class History < Base
    def items
      @items ||= @attributes.fetch(:items, []).map { |i| Query.new(i) }
    end
  end
end
