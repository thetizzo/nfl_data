module NflData
  module API
    class Team

      def initialize
        @parser = TeamParser.new
      end

      def get(year, with_schedule = false)
        @parser.get_by_year(year, with_schedule).to_json
      end

      class << self

        def get_all(year)
          self.new.get(year)
        end

        def get_all_with_schedule(year)
          self.new.get(year, true)
        end

      end
    end
  end
end
