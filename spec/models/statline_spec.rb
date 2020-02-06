RSpec.describe NflData::Statline do
  let(:statline) { described_class.new }

  it 'has a week' do
    expect(statline).to respond_to(:week)
  end

  it 'has a year' do
    expect(statline).to respond_to(:year)
  end

  it 'has rush attempts' do
    expect(statline).to respond_to(:rush_atts)
  end

  it 'has rush yards' do
    expect(statline).to respond_to(:rush_yards)
  end

  it 'has rush touchdowns' do
    expect(statline).to respond_to(:rush_tds)
  end

  it 'has fumbles' do
    expect(statline).to respond_to(:fumbles)
  end

  it 'has pass completions' do
    expect(statline).to respond_to(:pass_comp)
  end

  it 'has pass attempts' do
    expect(statline).to respond_to(:pass_att)
  end

  it 'has pass yards' do
    expect(statline).to respond_to(:pass_yards)
  end

  it 'has pass touchdowns' do
    expect(statline).to respond_to(:pass_tds)
  end

  it 'has interceptions' do
    expect(statline).to respond_to(:ints)
  end

  it 'has QB rating' do
    expect(statline).to respond_to(:qb_rating)
  end

  it 'has receptions' do
    expect(statline).to respond_to(:receptions)
  end

  it 'has receiving yards' do
    expect(statline).to respond_to(:rec_yards)
  end

  it 'has receiving touchdowns' do
    expect(statline).to respond_to(:rec_tds)
  end

  it 'has an NFL player id' do
    expect(statline).to respond_to(:nfl_player_id)
  end
end
