require "minitest/autorun"
require "minitest/pride"
require "vcr"

require "coveralls"
Coveralls.wear!

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
end
