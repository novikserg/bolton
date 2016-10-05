require "bolton"

class ChuckNorris < Bolton::API
  def initialize
    @base_host = "http://api.icndb.com"
  end
end
