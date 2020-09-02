# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::SeasonalGamesFeed do
  subject { described_class.new }

  it "requests the season schedule" do
    VCR.use_cassette("msf_seasonal_games") do
      expect(subject.feed(season_start_year: 2020).first).to resemble_json(
        "id": 40557,
        "week": 14,
        "startTime": "2017-12-10T18:00:00.000Z",
        "endedTime": nil,
        "awayTeam": {
          "id": 65,
          "abbreviation": "IND"
        },
        "homeTeam": {
          "id": 48,
          "abbreviation": "BUF"
        },
        "venue": {
          "id": 46,
          "name": "New Era Field"
        },
        "venueAllegiance": "NEUTRAL",
        "scheduleStatus": "NORMAL",
        "originalStartTime": nil,
        "delayedOrPostponedReason": nil,
        "playedStatus": "COMPLETED",
        "attendance": nil,
        "officials": Array,
        "broadcasters": Array,
        "weather": nil
      )
    end
  end

  it "should convert year to compatible season slug" do
    expect(subject.season_slug(2020)).to eq("2020-2021-regular")
  end
end
