require 'test_helper'

describe Player do
  before do
    @player = Player.new
  end

  after do
    @player = nil
  end

  it 'has a first name' do
    @player.must_respond_to :first_name
  end

  it 'has a last name' do
    @player.must_respond_to :last_name
  end

  it 'has a full name' do
    @player.must_respond_to :full_name
  end

  it 'has a position' do
    @player.must_respond_to :position
  end

  it 'has a number' do
    @player.must_respond_to :number
  end

  it 'has a status' do
    @player.must_respond_to :status
  end

  it 'has a team' do
    @player.must_respond_to :team
  end

  it 'has an NFL player ID' do
    @player.must_respond_to :nfl_player_id
  end

  it 'has a picture_link' do
    @player.must_respond_to :picture_link
  end

  describe 'to_hash' do
    before do
      @player.first_name = 'John'
      @player.last_name = 'Elway'
      @player.position = 'QB'
      @player.full_name = 'John Elway'
      @player.number = 7
      @player.status = 'Retired'
      @player.team = 'Broncos'
      @player.nfl_player_id = '123'
      @player.picture_link = 'google.com'
    end

    def valid_player_hash
      {
        first_name: 'John',
        last_name: 'Elway',
        full_name: 'John Elway',
        position: 'QB',
        number: 7,
        status: 'Retired',
        team: 'Broncos',
        nfl_player_id: '123',
        picture_link: 'google.com'
      }
    end

    it 'can return itself as hash' do
      @player.to_hash.must_equal valid_player_hash
    end
  end
end
