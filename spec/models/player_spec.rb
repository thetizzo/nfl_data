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
end
