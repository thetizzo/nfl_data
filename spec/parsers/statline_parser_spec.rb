# frozen_string_literal: true

RSpec.describe NflData::Parsers::StatlineParser do
  subject(:parsed) { described_class.new.parse(statline_data: statline_data) }

  let(:statline_data) do
    [
      {
        "game" => {
          "id" => 40606
        },
        "player" => {
          "id" => 8640
        },
        "stats" => {
          "passing" => {
            "passAttempts" => 21,
            "passCompletions" => 12,
            "passYards" => 134,
            "passTD" => 2,
            "qbRating" => 92.2
          },
          "rushing" => {
            "rushAttempts" => 10,
            "rushYards" => 60,
            "rushTD" => 0
          },
          "receiving" => {
            "receptions" => 5,
            "recYards" => 30,
            "recTD" => 3
          },
          "interceptions" => {
            "interceptions" => 0
          },
          "fumbles" => {
            "fumbles" => 1
          }
        }
      }
    ]
  end

  let(:statline) { parsed.first }

  it "should return an array of players" do
    expect(parsed).to be_a(Array)
    expect(statline).to be_a(NflData::Statline)
  end

  it "should parse the games" do
    expect(statline.rush_atts).to eq(10)
    expect(statline.rush_yards).to eq(60)
    expect(statline.rush_tds).to eq(0)
    expect(statline.fumbles).to eq(1)
    expect(statline.pass_comp).to eq(12)
    expect(statline.pass_att).to eq(21)
    expect(statline.pass_yards).to eq(134)
    expect(statline.pass_tds).to eq(2)
    expect(statline.ints).to eq(0)
    expect(statline.qb_rating).to eq(92.2)
    expect(statline.receptions).to eq(5)
    expect(statline.rec_yards).to eq(30)
    expect(statline.rec_tds).to eq(3)
    expect(statline.msf_game_id).to eq(40606)
    expect(statline.msf_player_id).to eq(8640)
  end
end
