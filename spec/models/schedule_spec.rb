RSpec.describe NflData::Schedule do
  let(:schedule) { described_class.new }

  it "should have games" do
    expect(schedule).to respond_to(:games)
  end

  it "should return an array of game hashes" do
    game_1 = NflData::Schedule::Game.new(week: 1, opponent: "Raiders")
    game_2 = NflData::Schedule::Game.new(week: 1, opponent: "Broncos")
    schedule.games = [game_1, game_2]

    expect(schedule.to_a).to eq([game_1.to_h, game_2.to_h])
  end

  describe NflData::Schedule::Game do
    let(:game) { described_class.new }

    Game = Struct.new(:week, :opponent, :date, :home_game, keyword_init: true)
    it "should respond to week" do
      expect(game).to respond_to :week
    end

    it "should respond to opponent" do
      expect(game).to respond_to :opponent
    end

    it "should respond to date" do
      expect(game).to respond_to :date
    end

    it "should respond to home_game" do
      expect(game).to respond_to :home_game
    end

    it "should be able to be initialized with keyword args" do
      game = described_class.new(week: 1)
      expect(game.week).to eq(1)
    end
  end
end
