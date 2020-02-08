module NflData
  class Team
    attr_accessor :name, :short_name, :schedule

    def to_hash
      {
        name: name,
        short_name: short_name,
        schedule: schedule.nil? ? [] : schedule.to_hash,
      }
    end

    class Schedule
      attr_accessor :games

      def initialize
        @games = []
      end

      def to_hash
        @games.map(&:to_hash)
      end

      class Game
        attr_accessor :week, :opponent, :date, :home_game

        def to_hash
          {
            week: week,
            opponent: opponent,
            date: date,
            home_game: home_game,
          }
        end
      end
    end
  end
end
