ENV['NFL_DATA_ENV'] = 'test'

require 'nfl_data'

require 'minitest/autorun'
require 'minitest/pride'
require 'vcr'

include NflData

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end
