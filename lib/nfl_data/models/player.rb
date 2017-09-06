module NflData
  class Player
    ATTRIBUTES = [
      :first_name, :last_name, :full_name, :position, :number,
      :status, :team, :nfl_player_id, :picture_link, :profile_link
    ]

    attr_accessor(*ATTRIBUTES)

    def initialize(attributes = {})
      attributes.each { |attr, value| send("#{attr}=", value) }
    end

    def to_hash
      attributes_hash = {}
      ATTRIBUTES.each { |attr| attributes_hash.merge!(attr => send(attr)) }
      attributes_hash
    end
  end
end
