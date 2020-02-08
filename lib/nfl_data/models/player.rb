module NflData
  Player = Struct.new(
    :first_name,
    :last_name,
    :full_name,
    :position,
    :number,
    :status,
    :team,
    :nfl_player_id,
    :profile_link,
    :picture_link,
    keyword_init: true
  )
end
