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
    keyword_init: true
  )
end
