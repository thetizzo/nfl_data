module NflData
  module Api
    class Statline
      attr_reader :parser, :feed

      def initialize(parser: Parsers::StatlineParser.new, feed: MySportsFeeds::WeeklyPlayerGamelogs.new)
        @parser = parser
        @feed = feed
      end

      def statlines(year:, week:)
        statline_data = feed.feed(season_start_year: year, week: week)
        {statlines: parser.parse(statline_data: statline_data).map(&:to_h)}.to_json
      end
    end
  end
end
