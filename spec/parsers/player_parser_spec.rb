# frozen_string_literal: true

RSpec.describe NflData::Parsers::PlayerParser do
  subject(:parsed) { described_class.new.parse(player_data: player_data) }

  let(:player_data) do
    [
      {
        "player" => {
          "id" => 13507,
          "firstName" => "Manny",
          "lastName" => "Abad",
          "primaryPosition" => "DB",
          "alternatePositions" => [],
          "jerseyNumber" => 38,
          "currentTeam" => {
            "id" => 67,
            "abbreviation" => "TEN"
          },
          "currentRosterStatus" => "ROSTER",
          "currentInjury" => nil,
          "height" => "5'11\"",
          "weight" => 184,
          "birthDate" => "1993-11-23",
          "age" => 24,
          "birthCity" => nil,
          "birthCountry" => nil,
          "rookie" => false,
          "highSchool" => nil,
          "college" => nil,
          "handedness" => nil,
          "officialImageSrc" => "nfl.com",
          "socialMediaAccounts" => [],
          "currentContractYear" => nil,
          "drafted" => nil,
          "externalMappings" => []
        },
        "teamAsOfDate" => {
          "id" => 67,
          "abbreviation" => "TEN"
        }
      }
    ]
  end

  let(:player) { parsed.first }

  it "should return an array of players" do
    expect(parsed).to be_a(Array)
    expect(player).to be_a(NflData::Player)
  end

  it "should parse the games" do
    expect(player.first_name).to eq("Manny")
    expect(player.last_name).to eq("Abad")
    expect(player.full_name).to eq("Manny Abad")
    expect(player.position).to eq("DB")
    expect(player.number).to eq(38)
    expect(player.team).to eq("TEN")
    expect(player.msf_player_id).to eq(13507)
    expect(player.image_source).to eq("nfl.com")
  end
end
