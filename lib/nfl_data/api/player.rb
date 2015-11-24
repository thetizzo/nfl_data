module NflData
  module API
    class Player
      def initialize
        @parser = PlayerParser.new
      end

      def get(position)
        @parser.get_by_position(position).to_json
      end

      class << self
        def get_all
          new.get(:all)
        end

        def get_quarterbacks
          new.get(:quarterbacks)
        end

        def get_runningbacks
          new.get(:runningbacks)
        end

        def get_wide_receivers
          new.get(:wide_receivers)
        end

        def get_tight_ends
          new.get(:tight_ends)
        end
      end
    end
  end
end
