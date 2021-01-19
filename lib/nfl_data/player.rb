module NflData
  Player = Struct.new(
    :first_name,
    :last_name,
    :full_name,
    :position,
    :number,
    :team,
    :msf_player_id,
    :image_source,
    :current_roster_status,
    keyword_init: true
  )
end
