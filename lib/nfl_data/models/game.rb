# frozen_string_literal: true

module NflData
  Game = Struct.new(:week, :away_team, :home_team, :start_time, keyword_init: true)
end
