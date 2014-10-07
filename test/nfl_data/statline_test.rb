require 'test_helper'

describe Statline do
  before do
    @statline = Statline.new
  end

  after do
    @statline = nil
  end

  it 'has a week' do
    @statline.must_respond_to :week
  end

  it 'has a year' do
    @statline.must_respond_to :year
  end

  it 'has rush attempts' do
    @statline.must_respond_to :rush_atts
  end

  it 'has rush yards' do
    @statline.must_respond_to :rush_yards
  end

  it 'has rush touchdowns' do
    @statline.must_respond_to :rush_tds
  end

  it 'has fumbles' do
    @statline.must_respond_to :fumbles
  end

  it 'has pass completions' do
    @statline.must_respond_to :pass_comp
  end

  it 'has pass attempts' do
    @statline.must_respond_to :pass_att
  end

  it 'has pass yards' do
    @statline.must_respond_to :pass_yards
  end

  it 'has pass touchdowns' do
    @statline.must_respond_to :pass_tds
  end

  it 'has interceptions' do
    @statline.must_respond_to :ints
  end

  it 'has QB rating' do
    @statline.must_respond_to :qb_rating
  end

  it 'has receptions' do
    @statline.must_respond_to :receptions
  end

  it 'has receiving yards' do
    @statline.must_respond_to :rec_yards
  end

  it 'has receiving touchdowns' do
    @statline.must_respond_to :rec_tds
  end

  it 'has an NFL player id' do
    @statline.must_respond_to :nfl_player_id
  end

  it 'has sacks' do
    @statline.must_respond_to :sacks
  end

  describe 'to_hash' do
    before do
        @statline.nfl_player_id = '123'
        @statline.week = 1
        @statline.year = 2014
        @statline.rush_atts = 1
        @statline.rush_yards = 25
        @statline.rush_tds = 1
        @statline.fumbles = 0
        @statline.pass_comp = 1
        @statline.pass_att = 2
        @statline.pass_yards = 100
        @statline.pass_tds = 1
        @statline.ints = 1
        @statline.qb_rating = "46.8"
        @statline.receptions = 2
        @statline.rec_yards = 25
        @statline.rec_tds = 1
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
        qb_rating: "46.8",
        receptions: 2,
        rec_yards: 25,
        rec_tds: 1
      }
    end

    it 'can return itself as hash' do
      @statline.to_hash.must_equal valid_statline_hash
    end

  end
end
