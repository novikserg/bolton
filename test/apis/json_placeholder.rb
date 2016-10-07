require "bolton"

class JsonPlaceholder
  include Bolton::API

  attr_reader :api_url

  def initialize
    @api_url = "http://jsonplaceholder.typicode.com"
  end
end
