require "test_helper"
require_relative "json_placeholder"
require_relative "stripe"

describe JsonPlaceholder do
  before do
    VCR.insert_cassette("json_placeholder")
    @client = JsonPlaceholder.new
  end

  after do
    VCR.eject_cassette
  end

  describe "when creating a resource" do
    before do
      @post = @client.posts.post(title: "Michael Bolton", body: "is a major cinaphile")
    end

    it "returns an object-like response with correct attributes" do
      assert_equal @post.title, "Michael Bolton"
      assert_equal @post.body, "is a major cinaphile"
    end
  end

  describe "when updating a resource" do
    before do
      @post = @client.posts(1).put(userId: 12)
    end

    it "returns an object-like response with new attributes" do
      assert_equal @post.userId, 12
    end
  end

  it "" do
    @stripe = Stripe.new
    assert_equal @stripe.charges.get.data.first.id, "ch_15ponjAV9fXgRPvYbvqBzGgX"
  end
end
