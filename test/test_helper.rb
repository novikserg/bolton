require "coveralls"
Coveralls.wear!

require "minitest/autorun"
require "minitest/pride"
require "vcr"

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter "test/"
end

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
end
