require "test_helper"
require "bolton"

class DummyAPI
  include Bolton::API

  set_api_url "http://api.example.com/v1/"

  def default_params
    { foo: :bar }
  end
end

class TestAPI < Minitest::Test
  def setup
    @api = DummyAPI.new
    @response = OpenStruct.new(title: "Michael Bolton is a major cinaphile")
  end

  def test_method_missing
    assert_raises(NoMethodError) { @api.bad_action_name! }

    mock = MiniTest::Mock.new
    @api.stub(:request, mock) do
      mock.expect(:update_url, nil, [:posts, 3])
      mock.expect(:get, @response)
      assert_equal @api.posts(3).get.title, "Michael Bolton is a major cinaphile"
      mock.verify

      mock.expect(:update_url, nil) do
        @api.good_action_name_3.get # accepts digits in node calls
      end
    end
  end

  def test_request
    assert_equal "http://api.example.com/v1/", @api.request.url
    assert_equal({ foo: :bar }, @api.request.default_options)
  end

  def test_respond_to_missing?
    assert_equal @api.respond_to?(:good_action_name_3), true
    assert_equal @api.respond_to?(:bad_action_name!), false
  end
end
