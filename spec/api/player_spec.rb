# frozen_string_literal: true

RSpec.describe NflData::Api::Player do
  subject { described_class.new }

  it "provides the players in json" do
    VCR.use_cassette("msf_players") do
      expect(JSON.parse(subject.players)).to resemble_json(
        "players": [
          {
            "first_name": "B",
            "last_name": "2Anger2",
            "full_name": "B 2Anger2",
            "position": "LB",
            "number": 19,
            "team": "JAX",
            "msf_player_id": 19407,
            "image_source": "google.com",
            "current_roster_status": "RETIRED"
          }
        ]
      )
    end
  end
end
