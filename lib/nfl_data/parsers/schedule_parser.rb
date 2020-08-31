module NflData
  module Parsers
    class ScheduleParser
      def schedule(schedule_data:)
        Schedule.new(games: schedule_data.map { |data| init_game(data) })
      end

      private

      def init_game(data)
        Game.new(
          week: data["week"],
          home_team: data["homeTeam"]["abbreviation"],
          away_team: data["awayTeam"]["abbreviation"],
          start_time: data["startTime"]
        )
      end
    end
  end
end
