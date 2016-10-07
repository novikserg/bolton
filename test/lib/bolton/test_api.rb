require "test_helper"

class DummyAPI
  include Bolton::API
end

class TestAPI < Minitest::Test
  def setup
    @api = DummyAPI.new
  end

  def test_api_url
    assert_raises(NotImplementedError) { @api.api_url }
  end

  def test_method_missing
    assert_raises(NoMethodError) { @api.bad_action_name! }
  end

  def test_respond_to_missing?
    assert_equal @api.respond_to?(:good_action_name), true
    assert_equal @api.respond_to?(:bad_action_name!), false
  end
end
