RSpec.describe NflData::Player do
  let(:player) { described_class.new }

  it 'has a first name' do
    expect(player).to respond_to(:first_name)
  end

  it 'has a last name' do
    expect(player).to respond_to(:last_name)
  end

  it 'has a full name' do
    expect(player).to respond_to(:full_name)
  end

  it 'has a position' do
    expect(player).to respond_to(:position)
  end

  it 'has a number' do
    expect(player).to respond_to(:number)
  end

  it 'has a status' do
    expect(player).to respond_to(:status)
  end

  it 'has a team' do
    expect(player).to respond_to(:team)
  end

  it 'has an NFL player ID' do
    expect(player).to respond_to(:nfl_player_id)
  end

  it 'has a picture_link' do
    expect(player).to respond_to(:picture_link)
  end

  describe 'to_hash' do
    before do
      player.first_name = 'John'
      player.last_name = 'Elway'
      player.position = 'QB'
      player.full_name = 'John Elway'
      player.number = 7
      player.status = 'Retired'
      player.team = 'Broncos'
      player.nfl_player_id = '123'
      player.picture_link = 'google.com'
      player.profile_link = 'espn.com'
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
        picture_link: 'google.com',
        profile_link: 'espn.com'
      }
    end

    it 'can return itself as hash' do
      expect(player.to_hash).to eq(valid_player_hash)
    end
  end
end
