# frozen_string_literal: true

module NflData
  module Parsers
    class PlayerParser
      def parse(player_data:)
        player_data.map { |data| data["player"] }.map do |data|
          init_player(data)
        end
      end

      private

      def init_player(data)
        Player.new(
          first_name: data["firstName"],
          last_name: data["lastName"],
          full_name: "#{data["firstName"]} #{data["lastName"]}".chomp,
          position: data["primaryPosition"],
          number: data["jerseyNumber"],
          team: data.dig("currentTeam", "abbreviation").to_s,
          msf_player_id: data["id"],
          image_source: data["officialImageSrc"].to_s
        )
      end
    end
  end
end
