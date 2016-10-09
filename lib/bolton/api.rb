require_relative "request"
require "forwardable"

module Bolton
  module API
    extend Forwardable

    private

    def_delegators :request, :get, :post, :put, :patch, :delete

    def api_url
      raise NotImplementedError
    end

    def default_options
      {}
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
