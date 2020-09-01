module NflData
  module Api
    class Player
      attr_reader :parser, :feed

      def initialize(parser: Parsers::PlayerParser.new, feed: MySportsFeeds::PlayersFeed.new)
        @parser = parser
        @feed = feed
      end

      def players
        player_data = feed.feed
        {players: parser.parse(player_data: player_data).map(&:to_h)}.to_json
      end
    end
  end
end
