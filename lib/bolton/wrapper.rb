require "net/http"
require "json"
require "byebug"

class Wrapper
  attr_reader :url

  def initialize(base_url, method, *args)
    resource_id = args.first
    @url = "#{base_url}/#{method}/#{resource_id}"
  end

  def get(query_params = {})
    uri = URI(url)
    uri.query = URI.encode_www_form(query_params)
    response = Net::HTTP.get(uri)
    parsed_response(response)
  end

  def put(query_params = {})
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Put.new(uri.path)
    request.set_form_data(query_params)
    response = http.request(request)
    parsed_response(response.body)
  end

  private

  def parsed_response(response)
    JSON.parse(response, object_class: OpenStruct)
  end

  def method_missing(method, *args)
    Wrapper.new(url, method, *args)
  end
end
