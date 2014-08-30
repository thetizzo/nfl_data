require 'nokogiri'
require 'open-uri'
require 'json'

module NflData
  class Player
    attr_accessor :name, :position, :team, :status, :nfl_player_id

    def to_json
      JSON.generate({
        name: name,
        position: position,
        team: team,
        status: status,
        nfl_player_id: nfl_player_id
      })
    end
  end
end
