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

        def get_runningbacks
          players = PlayerParser.new.get_by_position('runningback').map { |player| player.to_json }
          JSON.generate({runningbacks: players})
        end

        def get_wide_receivers
          players = PlayerParser.new.get_by_position('widereceiver').map { |player| player.to_json }
          JSON.generate({wide_receivers: players})
        end

        def get_tight_ends
          players = PlayerParser.new.get_by_position('tightend').map { |player| player.to_json }
          JSON.generate({tight_ends: players})
        end
      end
    end
  end
end
