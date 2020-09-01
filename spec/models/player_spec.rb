RSpec.describe NflData::Player do
  let(:player) { described_class.new }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:position) }
  it { should respond_to(:number) }
  it { should respond_to(:team) }
  it { should respond_to(:msf_player_id) }
  it { should respond_to(:image_source) }

  describe "convert to hash" do
    before do
      player.first_name = "John"
      player.last_name = "Elway"
      player.position = "QB"
      player.full_name = "John Elway"
      player.number = 7
      player.team = "Broncos"
      player.msf_player_id = "123"
      player.image_source = "google.com"
    end

    def valid_player_hash
      {
        first_name: "John",
        last_name: "Elway",
        full_name: "John Elway",
        position: "QB",
        number: 7,
        team: "Broncos",
        msf_player_id: "123",
        image_source: "google.com",
      }
    end

    it "can return itself as hash" do
      expect(player.to_h).to eq(valid_player_hash)
    end
  end
end
