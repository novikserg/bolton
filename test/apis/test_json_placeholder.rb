require "test_helper"
require_relative "json_placeholder"

describe JsonPlaceholder do
  before do
    VCR.insert_cassette("json_placeholder", record: :once)
    @client = JsonPlaceholder.new
  end

  after do
    VCR.eject_cassette
  end

  describe "when updating a resource" do
    before do
      @post = @client.posts(1).put(title: "Michael Bolton", body: "is a major cinaphile", userId: 12)
    end

    it "returns an object-like response with new attributes" do
      assert_equal @post.title, "Michael Bolton"
      assert_equal @post.body, "is a major cinaphile"
    end
  end
end
