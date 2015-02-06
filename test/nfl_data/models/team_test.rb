require 'test_helper'

describe Team do

  before do
    @team = Team.new
  end

  after do
    @team = nil
  end

  it 'has a name' do
    @team.must_respond_to :name
  end

  it 'has a short name' do
    @team.must_respond_to :short_name
  end

  it 'has a schedule' do
    @team.must_respond_to :schedule
  end

  describe 'to_hash' do
    before do
      @team.name = 'Denver Broncos'
      @team.short_name = 'DEN'
      @team.schedule = Team::Schedule.new
    end

    def valid_player_hash
      {
        name: 'Denver Broncos',
        short_name: 'DEN',
        schedule: []
      }
    end

    it 'can return itself as hash' do
      @team.to_hash.must_equal valid_player_hash
    end

  end
end
