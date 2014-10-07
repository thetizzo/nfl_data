module NflData
  module API
    class Statline

      def initialize
        @parser = StatlineParser.new
      end

      def get(week, year, stat_type)
        @parser.get(week, year, stat_type)
      end

      class << self
        def get_all_by_week_and_year(week, year)
          self.new.get(week, year)
        end

        def get_passing_by_week_and_year(week, year)
          self.new.get(week, year, :passing)
        end

        def get_rushing_by_week_and_year(week, year)
          self.new.get(week, year, :rushing)
        end

        def get_receiving_by_week_and_year(week, year)
          slef.new.get(week, year, :receiving)
        end
      end
    end
  end
end
