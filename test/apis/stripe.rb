require "bolton"

class Stripe < Bolton::API
  def initialize
    @base_host = "https://api.stripe.com/v1"
    @basic_auth = { username: "sk_test_bM6v8alK0SW6BK00wlr6zIqC" }
  end
end
