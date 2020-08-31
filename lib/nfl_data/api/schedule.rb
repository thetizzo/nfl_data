# frozen_string_literal: true

module NflData
  module Api
    class Schedule
      attr_reader :parser

      def initialize(parser: Parsers::ScheduleParser.new, feed: MySportsFeeds::ScheduleFeed.new)
        @parser = parser
        @feed = feed
      end

      def season(year:)
        schedule_data = @feed.seasonal_games(season_start_year: year)
        parser.schedule(schedule_data: schedule_data).to_h.to_json
      end
    end
  end
end
