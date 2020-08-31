# frozen_string_literal: true

RSpec.describe NflData::Schedule do
  let(:schedule) { described_class.new }

  it "should be empty when there are no games" do
    expect(schedule.games).to be_empty
  end

  it "should return an array of game hashes" do
    game_1 = NflData::Game.new(week: 1, away_team: "Raiders")
    game_2 = NflData::Game.new(week: 1, away_team: "Broncos")
    schedule.games = [game_1, game_2]

    expect(schedule.to_h[:games]).to eq([game_1.to_h, game_2.to_h])
  end
end
