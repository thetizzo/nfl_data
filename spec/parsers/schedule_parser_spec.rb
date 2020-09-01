# frozen_string_literal: true

RSpec.describe NflData::Parsers::ScheduleParser do
  subject(:parsed) { described_class.new.parse(schedule_data: schedule_data) }

  let(:schedule_data) do
    [
      {
        "id" => 56752,
        "week" => 1,
        "startTime" => "2020-09-11T00:20:00.000Z",
        "endedTime" => nil,
        "awayTeam" => {"id" => 64, "abbreviation" => "HOU"},
        "homeTeam" => {"id" => 73, "abbreviation" => "KC"},
        "venue" => {"id" => 58, "name" => "Arrowhead Stadium"},
        "venueAllegiance" => "HOME",
        "scheduleStatus" => "NORMAL",
        "originalStartTime" => nil,
        "delayedOrPostponedReason" => nil,
        "playedStatus" => "UNPLAYED",
        "attendance" => nil,
        "officials" => [],
        "broadcasters" => ["NBC"],
        "weather" => nil,
      },
    ]
  end

  let(:game) { parsed.games.first }

  it "should return a schedule" do
    expect(parsed).to be_a(NflData::Schedule)
  end

  it "should parse the games" do
    expect(game.week).to eq(1)
    expect(game.away_team).to eq("HOU")
    expect(game.home_team).to eq("KC")
    expect(game.start_time).to eq("2020-09-11T00:20:00.000Z")
  end
end
