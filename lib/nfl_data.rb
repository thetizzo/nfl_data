require 'nfl_data/version'

require 'nokogiri'
require 'open-uri'
require 'json'

require 'nfl_data/player'
require 'nfl_data/statline'
require 'nfl_data/team'

require 'nfl_data/parsers/player_parser'
require 'nfl_data/parsers/statline_parser'
require 'nfl_data/parsers/team_parser'

require 'nfl_data/api/player'
require 'nfl_data/api/statline'
require 'nfl_data/api/team'

module NflData
end
