require "httparty"
require "json"
require "byebug"

class Wrapper
  attr_reader :url

  def initialize(base_url, method, *args)
    resource_id = args.first
    @url = "#{base_url}/#{method}/#{resource_id}"
  end

  def get(query_params = {})
    response = HTTParty.get(url, query: query_params)
    parsed_response(response)
  end

  def post(query_params = {})
    response = HTTParty.post(url, body: query_params)
    parsed_response(response)
  end

  def put(query_params = {})
    response = HTTParty.put(url, body: query_params)
    parsed_response(response)
  end

  private

  def parsed_response(response)
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def method_missing(method, *args)
    Wrapper.new(url, method, *args)
  end
end
