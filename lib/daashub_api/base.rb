module DaashubAPI
  class Base
    def initialize(args = {})
      @attributes = {}
      args.each { |k, v| @attributes[k.to_sym] = v }
    end

    protected

    def method_missing(name, *argv, &block)
      super unless @attributes.key?(name)
      @attributes[name]
    end

    def respond_to_missing?(name, include_private = false)
      @attributes.key?(name) || super
    end
  end
end
