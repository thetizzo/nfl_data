# frozen_string_literal: true

RSpec.describe NflData::Api::Statline do
  subject { described_class.new }

  it "provides the players in json" do
    VCR.use_cassette("msf_weekly_gamelogs") do
      expect(JSON.parse(subject.statlines(year: 2019, week: 1))).to resemble_json(
        "statlines": [
          {
            "rush_atts": 1,
            "rush_yards": 6,
            "rush_tds": 0,
            "fumbles": 0,
            "pass_comp": 0,
            "pass_att": 0,
            "pass_yards": 0,
            "pass_tds": 0,
            "ints": 0,
            "qb_rating": 0.0,
            "receptions": 0,
            "rec_yards": 0,
            "rec_tds": 0,
            "msf_game_id": 51465,
            "msf_player_id": 6826,
          },
        ]
      )
    end
  end
end
