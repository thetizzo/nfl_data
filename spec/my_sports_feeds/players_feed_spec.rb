# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::PlayersFeed do
  subject { described_class.new }

  let(:feed) { subject.feed }

  it "requests the players" do
    VCR.use_cassette("msf_players") do
      expect(subject.feed.find { |player| player.dig("player", "id") == 6826 }).to resemble_json(
        {
          "player" => {
            "id" => 6826,
            "firstName" => "Ameer",
            "lastName" => "Abdullah",
            "primaryPosition" => "RB",
            "alternatePositions" => [],
            "jerseyNumber" => 31,
            "currentTeam" => {"id" => 63, "abbreviation" => "MIN"},
            "currentRosterStatus" => "ROSTER",
            "currentInjury" => nil,
            "height" => "5'9\"",
            "weight" => 203,
            "birthDate" => "1993-06-13",
            "age" => 27,
            "birthCity" => "Mobile, AL",
            "birthCountry" => "USA",
            "rookie" => false,
            "highSchool" => nil,
            "college" => "Nebraska",
            "handedness" => nil,
            "officialImageSrc" => "http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/ABD647726.png",
            "socialMediaAccounts" => [],
            "currentContractYear" => nil,
            "drafted" => {"year" => 2015, "team" => {"id" => 61, "abbreviation" => "DET"},
                          "pickTeam" => {"id" => 61, "abbreviation" => "DET"},
                          "round" => 2,
                          "roundPick" => 22,
                          "overallPick" => 54},
            "externalMappings" => [{"source" => "NFL.com Stats Leaders", "id" => "ABD647726"}]
          },
          "teamAsOfDate" => {
            "id" => 63,
            "abbreviation" => "MIN"
          }
        }
      )
    end
  end
end
