# frozen_string_literal: true

module NflData
  module Parsers
    class StatlineParser
      def parse(statline_data:)
        statline_data.map do |data|
          init_statline(data)
        end
      end

      private

      def init_statline(data)
        Statline.new(
          rush_atts: data.dig("stats", "rushing", "rushAttempts") || 0,
          rush_yards: data.dig("stats", "rushing", "rushYards") || 0,
          rush_tds: data.dig("stats", "rushing", "rushTD") || 0,
          fumbles: data.dig("stats", "fumbles", "fumbles") || 0,
          pass_comp: data.dig("stats", "passing", "passCompletions") || 0,
          pass_att: data.dig("stats", "passing", "passAttempts") || 0,
          pass_yards: data.dig("stats", "passing", "passYards") || 0,
          pass_tds: data.dig("stats", "passing", "passTD") || 0,
          ints: data.dig("stats", "interceptions", "interceptions") || 0,
          qb_rating: data.dig("stats", "passing", "qbRating") || 0,
          receptions: data.dig("stats", "receiving", "receptions") || 0,
          rec_yards: data.dig("stats", "receiving", "recYards") || 0,
          rec_tds: data.dig("stats", "receiving", "recTD") || 0,
          msf_game_id: data.dig("game", "id"),
          msf_player_id: data.dig("player", "id")
        )
      end
    end
  end
end
