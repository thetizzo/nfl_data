module NflData
  Schedule = Struct.new(:games, keyword_init: true) {
    def initialize(games: [])
      super
    end

    def to_h
      games.map!(&:to_h)
      super
    end
  }
end
