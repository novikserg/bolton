require "httparty"
require "json"

module Bolton
  class Request
    class << self
      private

      def add_method(http_method)
        define_method(http_method) do |query_params = {}|
          request(http_method, query_params)
        end
      end
    end

    add_method :get
    add_method :post
    add_method :put
    add_method :patch
    add_method :delete

    attr_accessor :url, :default_options

    def initialize(url, default_options)
      self.url = url
      self.default_options = default_options
    end

    def update_url(method, resource_id = nil)
      self.url = [url, method, resource_id].compact.join("/")
    end

    private

    def request(method, query_params = {})
      options = { query: query_params, body: query_params, basic_auth: default_options[:basic_auth] }
      response = HTTParty.public_send(method, url, options)
      parsed_response(response)
    end

    def parsed_response(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
  end
end
