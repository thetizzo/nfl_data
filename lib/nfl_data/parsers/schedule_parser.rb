module NflData
  module Parsers
    class ScheduleParser
      def parse(schedule_data:)
        Schedule.new(games: schedule_data.map { |data| init_game(data) })
      end

      private

      def init_game(data)
        Game.new(
          week: data["week"],
          home_team: data.dig("homeTeam", "abbreviation"),
          away_team: data.dig("awayTeam", "abbreviation"),
          start_time: data["startTime"]
        )
      end
    end
  end
end
