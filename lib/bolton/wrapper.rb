require "httparty"
require "json"
require "byebug"

class Wrapper
  class << self
    private
    def add_method(http_method)
      define_method(http_method) do |query_params = {}|
        request(http_method, query_params)
      end
    end
  end

  attr_reader :url, :basic_auth

  add_method :get
  add_method :post
  add_method :put
  add_method :patch
  add_method :delete

  def initialize(base_url, method, basic_auth, *args)
    resource_id = args.first
    @url = "#{base_url}/#{method}"
    @url << "/#{resource_id}" if resource_id
    @basic_auth = basic_auth
  end

  private

  def request(method, query_params={})
    options = { query: query_params, body: query_params, basic_auth: basic_auth }
    response = HTTParty.public_send(method, url, options)
    parsed_response(response)
  end

  def method_missing(method, *args)
    Wrapper.new(url, method, basic_auth, *args)
  end

  def parsed_response(response)
    JSON.parse(response.body, object_class: OpenStruct)
  end
end
