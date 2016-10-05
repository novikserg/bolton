# require "test_helper"
# require_relative "chuck_norris"
#
# describe ChuckNorris do
#   before do
#     VCR.insert_cassette("chuck_norris")
#     @chuck = ChuckNorris.new
#   end
#
#   after do
#     VCR.eject_cassette
#   end
#
#   describe "when asked for all jokes" do
#     before do
#       @jokes = @chuck.jokes.get.value
#     end
#
#     it "returns an array of jokes" do
#       ids = @jokes.map(&:id)
#
#       assert_includes ids, 46
#       assert_includes ids, 48
#       assert_instance_of Array, @jokes
#     end
#   end
#
#   describe "when asked for a certain joke" do
#     before do
#       @joke = @chuck.jokes(46).get.value
#     end
#
#     it "returns an object-like response" do
#       assert_equal @joke.categories, ["explicit"]
#     end
#
#     describe "with first name and last name specified" do
#       before do
#         @joke = @chuck.jokes(46).get(firstName: "John", lastName: "Doe").value
#       end
#
#       it "uses the names specified" do
#         assert_includes @joke.joke, "John Doe once ate three 72 oz. steaks"
#       end
#     end
#   end
#
#   describe "when asked for a random joke" do
#     it "returns random joke" do
#       assert_includes @chuck.jokes.random.joke.get.value.joke, "Chuck Norris"
#     end
#   end
# end
