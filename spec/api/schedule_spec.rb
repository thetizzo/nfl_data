# frozen_string_literal: true

RSpec.describe NflData::Api::Schedule do
  subject { described_class.new }

  it "provides the season in json" do
    VCR.use_cassette("msf_seasonal_games") do
      expect(JSON.parse(subject.season(year: 2020))).to resemble_json(
        "games": [
          {
            "week": 1,
            "away_team": "KC",
            "home_team": "DEN",
            "start_time": Time.now
          }
        ]
      )
    end
  end
end
