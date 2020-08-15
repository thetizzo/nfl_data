module NflData
  module Api
    class Statline
      def initialize
        @parser = StatlineParser.new
      end

      def get(week, year, stat_type)
        @parser.get(week, year, stat_type).to_json
      end

      class << self
        def get_all(week, year)
          new.get(week, year, :all)
        end

        def get_passing(week, year)
          new.get(week, year, :passing)
        end

        def get_rushing(week, year)
          new.get(week, year, :rushing)
        end

        def get_receiving(week, year)
          new.get(week, year, :receiving)
        end
      end
    end
  end
end
