require 'nfl_data'

require 'minitest/autorun'
require 'minitest/pride'
require 'vcr'

include NflData

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/cassettes'
  c.hook_into :webmock
end
