require "bolton"

class ChuckNorris
  include Bolton::API

  attr_reader :api_url

  def initialize
    @api_url = "http://api.icndb.com"
  end
end
