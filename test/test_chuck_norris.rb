require "test_helper"
require "chuck_norris"

describe ChuckNorris do
  before do
    @chuck = ChuckNorris.new
  end

  describe "when asked for all jokes" do
    before do
      @jokes = @chuck.jokes.get.value
    end

    it "returns an array of jokes" do
      ids = @jokes.map(&:id)

      assert_includes ids, 46
      assert_includes ids, 48
      assert_instance_of Array, @jokes
    end
  end

  describe "when asked for a certain joke" do
    before do
      @joke = @chuck.jokes(46).get.value
    end

    it "gives an object back" do
      assert_equal @joke.joke, "Chuck Norris once ate three 72 oz. steaks in one hour. He spent the first 45 minutes having sex with his waitress."
    end

    it "allows access to nested objects" do
      assert_equal @joke.categories, ["explicit"]
    end
  end

  describe "when asked for a random joke" do
    it "returns random joke" do
      assert_includes @chuck.jokes.random.joke.get.value.joke, "Chuck Norris"
    end
  end
end
