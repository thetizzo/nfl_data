module NflData
  Statline = Struct.new(
    :rush_atts,
    :rush_yards,
    :rush_tds,
    :fumbles,
    :pass_comp,
    :pass_att,
    :pass_yards,
    :pass_tds,
    :ints,
    :qb_rating,
    :receptions,
    :rec_yards,
    :rec_tds,
    :msf_game_id,
    :msf_player_id,
    keyword_init: true
  )
end
