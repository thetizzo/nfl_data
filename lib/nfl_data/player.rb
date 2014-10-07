module NflData

  class Player
    attr_accessor :first_name, :last_name, :full_name, :position, :number, :status, :team, :nfl_player_id

    def to_hash
      {
        first_name: first_name,
        last_name: last_name,
        full_name: full_name,
        position: position,
        number: number,
        status: status,
        team: team,
        nfl_player_id: nfl_player_id
      }
    end

  end

end
