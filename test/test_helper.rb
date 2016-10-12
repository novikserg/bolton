require "coveralls"
Coveralls.wear!

require "byebug"
require "minitest/autorun"
require "minitest/pride"


SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter "test/"
end
