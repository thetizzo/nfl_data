# frozen_string_literal: true

RSpec.describe NflData::Game do
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
