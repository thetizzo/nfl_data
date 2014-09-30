require 'json'

module NflData

  class Player
    attr_accessor :first_name, :last_name, :full_name, :position, :number, :name, :status, :team, :nfl_player_id

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
