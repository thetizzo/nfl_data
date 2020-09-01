# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::WeeklyPlayerGamelogs do
  subject { described_class.new }

  it "requests the season schedule" do
    VCR.use_cassette("msf_weekly_gamelogs") do
      expect(subject.feed(season_start_year: 2019, week: 1).first).to resemble_json(
        {
          "game": {
            "id": 40606,
            "week": 17,
            "startTime": "2017-12-31T21:25:00.000Z",
            "awayTeamAbbreviation": "JAX",
            "homeTeamAbbreviation": "TEN",
          },
          "player": {
            "id": 8640,
            "firstName": "Marcus",
            "lastName": "Mariota",
            "position": "QB",
            "jerseyNumber": 8,
          },
          "team": {
            "id": 67,
            "abbreviation": "TEN",
          },
          "stats": {
            "passing": {
              "passAttempts": 21,
              "passCompletions": 12,
              "passPct": 57.1,
              "passYards": 134,
              "passAvg": 6.4,
              "passYardsPerAtt": 6.4,
              "passTD": 1,
              "passTDPct": 4.8,
              "passInt": 0,
              "passIntPct": 0,
              "passLng": 66,
              "pass20Plus": 1,
              "pass40Plus": 1,
              "passSacks": 3,
              "passSackY": 18,
              "qbRating": 92.2,
            },
            "rushing": {
              "rushAttempts": 10,
              "rushYards": 60,
              "rushAverage": 6,
              "rushTD": 0,
              "rushLng": 66,
              "rush1stDowns": 4,
              "rush1stDownsPct": 40,
              "rush20Plus": 0,
              "rush40Plus": 0,
              "rushFumbles": 1,
            },
            "receiving": {
              "targets": 0,
              "receptions": 0,
              "recYards": 0,
              "recAverage": 0,
              "recTD": 0,
              "recLng": 0,
              "rec1stDowns": 0,
              "rec20Plus": 0,
              "rec40Plus": 0,
              "recFumbles": 0,
            },
            "tackles": {
              "tackleSolo": 0,
              "tackleTotal": 0,
              "tackleAst": 0,
              "sacks": 0,
              "sackYds": 0,
              "tacklesForLoss": 0,
            },
            "interceptions": {
              "interceptions": 0,
              "intTD": 0,
              "intYds": 0,
              "intAverage": 0,
              "intLng": 0,
              "passesDefended": 0,
              "stuffs": 0,
              "stuffYds": 0,
              "safeties": 0,
              "kB": 0,
            },
            "fumbles": {
              "fumbles": 1,
              "fumLost": 1,
              "fumForced": 0,
              "fumOwnRec": 0,
              "fumOppRec": 0,
              "fumRecYds": -74,
              "fumTotalRec": 0,
              "fumTD": 0,
            },
            "kickoffReturns": {
              "krRet": 0,
              "krYds": 0,
              "krAvg": 0,
              "krLng": 0,
              "krTD": 0,
              "kr20Plus": 0,
              "kr40Plus": 0,
              "krFC": 0,
              "krFum": 0,
            },
            "puntReturns": {
              "prRet": 0,
              "prYds": 0,
              "prAvg": 0,
              "prLng": 0,
              "prTD": 0,
              "pr20Plus": 0,
              "pr40Plus": 0,
              "prFC": 0,
              "prFum": 0,
            },
            "miscellaneous": {
              "gamesStarted": 1,
            },
            "twoPointAttempts": {
              "twoPtAtt": 0,
              "twoPtMade": 0,
              "twoPtPassAtt": 0,
              "twoPtPassMade": 0,
              "twoPtPassRec": 0,
              "twoPtRushAtt": 0,
              "twoPtRushMade": 0,
            },
          },
        }
      )
    end
  end

  it "should convert year to compatible season slug" do
    expect(subject.season_slug(2020)).to eq("2020-2021-regular")
  end
end
