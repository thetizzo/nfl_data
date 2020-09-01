# frozen_string_literal: true

module NflData
  module Api
    class Schedule
      attr_reader :parser

      def initialize(parser: Parsers::ScheduleParser.new, feed: MySportsFeeds::SeasonalGamesFeed.new)
        @parser = parser
        @feed = feed
      end

      def season(year:)
        schedule_data = @feed.feed(season_start_year: year)
        parser.parse(schedule_data: schedule_data).to_h.to_json
      end
    end
  end
end
