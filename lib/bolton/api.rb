require_relative "request"
require "forwardable"

module Bolton
  module API
    extend Forwardable

    def_delegators :request, :get, :post, :put, :patch, :delete

    attr_reader :api_url

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def set_api_url(url)
        define_method(:api_url) do
          @api_url ||= url
        end
      end
    end

    def default_options
      default_params || {}
    end

    def request
      @request ||= Request.new(api_url, default_options)
    end

    def method_missing(method, *args)
      if http_compliant?(method)
        request.update_url(method, args.first)
        self
      else
        super
      end
    end

    def respond_to_missing?(method, *)
      http_compliant?(method)
    end

    def http_compliant?(method_name)
      method_name =~ /^[a-zA-Z_\d]*$/
    end
  end
end
