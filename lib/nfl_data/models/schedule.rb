module NflData
  class Schedule
    Game = Struct.new(:week, :away_team, :home_team, :start_time, keyword_init: true)

    attr_accessor :games

    def initialize(games: [])
      @games = games
    end

    def to_a
      games.map(&:to_h)
    end
  end
end
