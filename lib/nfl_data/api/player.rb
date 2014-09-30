module NflData
  module API
    class Player

      class << self
        def positions
          ['quarterback', 'runningback', 'widereceiver', 'tightend']
        end

        def get_quarterbacks
          players = PlayerParser.new.get_by_position('quarterback').map { |player| player.to_json }
          JSON.generate({quarterbacks: players})
        end

      end
    end
  end
end
