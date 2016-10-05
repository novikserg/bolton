require "bolton"

class JsonPlaceholder < Bolton::API
  def initialize
    @base_host = "http://jsonplaceholder.typicode.com"
  end
end
