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

  describe 'to_hash' do
    before do
      statline.nfl_player_id = '123'
      statline.week = 1
      statline.year = 2014
      statline.rush_atts = 1
      statline.rush_yards = 25
      statline.rush_tds = 1
      statline.fumbles = 0
      statline.pass_comp = 1
      statline.pass_att = 2
      statline.pass_yards = 100
      statline.pass_tds = 1
      statline.ints = 1
      statline.qb_rating = '46.8'
      statline.receptions = 2
      statline.rec_yards = 25
      statline.rec_tds = 1
    end

    def valid_statline_hash
      {
        nfl_player_id: '123',
        week: 1,
        year: 2014,
        rush_atts: 1,
        rush_yards: 25,
        rush_tds: 1,
        fumbles: 0,
        pass_comp: 1,
        pass_att: 2,
        pass_yards: 100,
        pass_tds: 1,
        ints: 1,
        qb_rating: '46.8',
        receptions: 2,
        rec_yards: 25,
        rec_tds: 1
      }
    end

    it 'can return itself as hash' do
      expect(statline.to_hash).to eq(valid_statline_hash)
    end
  end
end
