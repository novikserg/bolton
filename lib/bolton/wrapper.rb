require "net/http"
require "json"

class Wrapper
  attr_reader :base_url, :resource_id, :method

  def initialize(base_url, method, *args)
    @base_url = base_url
    @resource_id = args.first
    @method = method
  end

  def get
    JSON.parse(response, object_class: OpenStruct)
  end

  private

  def method_missing(method, *args)
    Wrapper.new(url, method, *args)
  end

  def response
    Net::HTTP.get(uri)
  end

  def uri
    URI(url)
  end

  def url
    "#{base_url}/#{method}/#{resource_id}"
  end
end
