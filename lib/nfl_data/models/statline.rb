module NflData
  Statline = Struct.new(:week, :year, :rush_atts, :rush_yards, :rush_tds, :fumbles, :pass_comp, :pass_att, :pass_yards, :pass_tds, :ints,
                        :qb_rating, :receptions, :rec_yards, :rec_tds, :nfl_player_id)
end
