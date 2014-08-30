require_relative './test_helper'

describe Player do
  before do
    @player = Player.new
  end

  it 'should have a name' do
    @player.name = "Bob"
    @player.name.must_equal "Bob"
  end

  it 'should have a position' do
    @player.position = "QB"
    @player.position.must_equal "QB"
  end

  it 'should have a team' do
    @player.team = "Broncos"
    @player.team.must_equal "Broncos"
  end

  it 'should have a status' do
    @player.status = "ACT"
    @player.status.must_equal "ACT"
  end

  it 'should have an nfl_player_id' do
    @player.nfl_player_id = 1
    @player.nfl_player_id.must_equal 1
  end

  describe 'to_json' do
    def valid_json_attrs
      {name: "Bob", position: "QB", team: "Broncos", status: "ACT", nfl_player_id: 1}
    end

    def valid_json
      JSON.generate valid_json_attrs
    end

    it 'should turn the player into a json blob' do
      @player.name = "Bob"
      @player.position = "QB"
      @player.team = "Broncos"
      @player.status = "ACT"
      @player.nfl_player_id = 1

      @player.to_json.must_equal valid_json
    end
  end
end
