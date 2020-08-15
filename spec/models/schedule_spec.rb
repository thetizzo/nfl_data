# frozen_string_literal: true

RSpec.describe NflData::Schedule do
  let(:schedule) { described_class.new }

  it "should have games" do
    expect(schedule).to respond_to(:games)
  end

  it "should return an array of game hashes" do
    game_1 = NflData::Schedule::Game.new(week: 1, away_team: "Raiders")
    game_2 = NflData::Schedule::Game.new(week: 1, away_team: "Broncos")
    schedule.games = [game_1, game_2]

    expect(schedule.to_a).to eq([game_1.to_h, game_2.to_h])
  end

  describe NflData::Schedule::Game do
    let(:game) { described_class.new }

    it { should respond_to :week }
    it { should respond_to :home_team }
    it { should respond_to :away_team }
    it { should respond_to :start_time }

    it "should be able to be initialized with keyword args" do
      game = described_class.new(week: 1)
      expect(game.week).to eq(1)
    end
  end
end
