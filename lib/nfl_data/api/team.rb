module NflData
  module API
    class Team

      def initialize
        @parser = TeamParser.new
      end

      def get(year)
        @parser.get_by_year(year).to_json
      end

      class << self

        def get_all(year)
          self.new.get(year)
        end

      end
    end
  end
end
