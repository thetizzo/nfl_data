module NflData

  class Statline
    attr_accessor :week, :year, :rush_atts, :rush_yards, :rush_tds, :fumbles,
      :pass_comp, :pass_att, :pass_yards, :pass_tds, :ints, :qb_rating, :receptions,
      :rec_yards, :rec_tds, :nfl_player_id, :sacks

    def to_hash
      {
        nfl_player_id: nfl_player_id,
        week: week,
        year: year,
        rush_atts: rush_atts,
        rush_yards: rush_yards,
        rush_tds: rush_tds,
        fumbles: fumbles,
        pass_comp: pass_comp,
        pass_att: pass_att,
        pass_yards: pass_yards,
        pass_tds: pass_tds,
        ints: ints,
        qb_rating: qb_rating,
        receptions: receptions,
        rec_yards: rec_yards,
        rec_tds: rec_tds
      }
    end
  end

end
