require "net/http"
require "json"
require "byebug"

class Wrapper
  attr_reader :base_url, :resource_id, :method

  def initialize(base_url, method, *args)
    @base_url = base_url
    @resource_id = args.first
    @method = method
  end

  def get(query_params = {})
    uri = URI(url)
    uri.query = URI.encode_www_form(query_params)
    response = Net::HTTP.get(uri)
    JSON.parse(response, object_class: OpenStruct)
  end

  private

  def method_missing(method, *args)
    Wrapper.new(url, method, *args)
  end

  def url
    "#{base_url}/#{method}/#{resource_id}"
  end
end
