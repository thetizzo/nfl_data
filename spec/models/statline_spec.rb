RSpec.describe NflData::Statline do
  let(:statline) { described_class.new }

  it { should respond_to(:rush_atts) }
  it { should respond_to(:rush_yards) }
  it { should respond_to(:rush_tds) }
  it { should respond_to(:fumbles) }
  it { should respond_to(:pass_comp) }
  it { should respond_to(:pass_att) }
  it { should respond_to(:pass_yards) }
  it { should respond_to(:pass_tds) }
  it { should respond_to(:ints) }
  it { should respond_to(:qb_rating) }
  it { should respond_to(:receptions) }
  it { should respond_to(:rec_yards) }
  it { should respond_to(:rec_tds) }
  it { should respond_to(:msf_game_id) }
  it { should respond_to(:msf_player_id) }

  describe "convert to hash" do
    before do
      statline.msf_player_id = "123"
      statline.msf_game_id = 17
      statline.rush_atts = 1
      statline.rush_yards = 25
      statline.rush_tds = 1
      statline.fumbles = 0
      statline.pass_comp = 1
      statline.pass_att = 2
      statline.pass_yards = 100
      statline.pass_tds = 1
      statline.ints = 1
      statline.qb_rating = "46.8"
      statline.receptions = 2
      statline.rec_yards = 25
      statline.rec_tds = 1
    end

    def valid_statline_hash
      {
        msf_player_id: "123",
        msf_game_id: 17,
        rush_atts: 1,
        rush_yards: 25,
        rush_tds: 1,
        fumbles: 0,
        pass_comp: 1,
        pass_att: 2,
        pass_yards: 100,
        pass_tds: 1,
        ints: 1,
        qb_rating: "46.8",
        receptions: 2,
        rec_yards: 25,
        rec_tds: 1,
      }
    end

    it "can return itself as hash" do
      expect(statline.to_h).to eq(valid_statline_hash)
    end
  end
end
