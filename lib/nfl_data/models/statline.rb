module NflData
  class Statline
    ATTRIBUTES = [
      :week, :year, :rush_atts, :rush_yards, :rush_tds, :fumbles, :pass_comp,
      :pass_att, :pass_yards, :pass_tds, :ints, :qb_rating, :receptions,
      :rec_yards, :rec_tds, :nfl_player_id
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
