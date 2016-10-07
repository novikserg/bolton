require "bolton"

class Stripe
  include Bolton::API

  attr_reader :api_url, :default_options

  def initialize
    @api_url = "https://api.stripe.com/v1"
    @default_options = { basic_auth: { username: "sk_test_bM6v8alK0SW6BK00wlr6zIqC" } }
  end
end
