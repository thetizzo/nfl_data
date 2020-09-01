# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::PlayersFeed do
  subject { described_class.new }

  let(:feed) { subject.feed }

  it "requests the players" do
    VCR.use_cassette("msf_players") do
      expect(subject.feed.first).to resemble_json(
        {
          "player": {
            "id": 13507,
            "firstName": "Manny",
            "lastName": "Abad",
            "primaryPosition": "DB",
            "alternatePositions": Array,
            "jerseyNumber": 38,
            "currentTeam": {
              "id": 67,
              "abbreviation": "TEN",
            },
            "currentRosterStatus": "ROSTER",
            "currentInjury": nil,
            "height": nil,
            "weight": nil,
            "birthDate": "1993-11-23",
            "age": 24,
            "birthCity": nil,
            "birthCountry": nil,
            "rookie": false,
            "highSchool": nil,
            "college": nil,
            "handedness": nil,
            "officialImageSrc": nil,
            "socialMediaAccounts": Array,
            "currentContractYear": nil,
            "drafted": nil,
            "externalMappings": Array,
          },
          "teamAsOfDate": {
            "id": 67,
            "abbreviation": "TEN",
          },
        }
      )
    end
  end
end
