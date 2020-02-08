RSpec.describe NflData::Team do
  let(:team) { described_class.new }

  it "has a name" do
    expect(team).to respond_to(:name)
  end

  it "has a short name" do
    expect(team).to respond_to(:short_name)
  end

  it "has a schedule" do
    expect(team).to respond_to(:schedule)
  end

  describe "to_hash" do
    before do
      team.name = "Denver Broncos"
      team.short_name = "DEN"
      team.schedule = NflData::Team::Schedule.new
    end

    def valid_player_hash
      {
        name: "Denver Broncos",
        short_name: "DEN",
        schedule: [],
      }
    end

    it "can return itself as hash" do
      expect(team.to_hash).to eq(valid_player_hash)
    end
  end
end
