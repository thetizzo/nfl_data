require 'nfl_data/version'

require 'nokogiri'
require 'open-uri'
require 'json'

require 'nfl_data/models/player'
require 'nfl_data/models/statline'
require 'nfl_data/models/team'

require 'nfl_data/parsers/player_parser'
require 'nfl_data/parsers/statline_parser'
require 'nfl_data/parsers/team_parser'

require 'nfl_data/api/player'
require 'nfl_data/api/statline'
require 'nfl_data/api/team'

module NflData
end
