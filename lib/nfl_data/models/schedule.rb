module NflData
  class Schedule
    Game = Struct.new(:week, :opponent, :date, :home_game, keyword_init: true)

    attr_accessor :games

    def initialize
      @games = []
    end

    def to_a
      @games.map(&:to_h)
    end
  end
end
