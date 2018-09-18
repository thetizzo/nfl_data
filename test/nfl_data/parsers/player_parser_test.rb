require 'test_helper'

describe PlayerParser do
  before do
    @parser = PlayerParser.new
  end

  after do
    @parser = nil
  end

  it 'should know the correct base url' do
    expected_base_url = 'http://www.nfl.com/players/search?category=' \
                        'position&conferenceAbbr=null&playerType=current' \
                        '&conference=ALL&filter='

    @parser.base_url.must_equal expected_base_url
  end

  describe 'get_by_position' do
    it 'should get quarterbacks' do
      VCR.use_cassette('quarterbacks') do
        response = @parser.get_by_position(:quarterbacks)

        response.keys.must_include :quarterbacks
        response[:quarterbacks].count.must_be :>, 0
      end
    end

    it 'should get runningbacks' do
      VCR.use_cassette('runningbacks') do
        response = @parser.get_by_position(:runningbacks)

        response.keys.must_include :runningbacks
        response[:runningbacks].count.must_be :>, 0
      end
    end

    it 'should get wide receivers' do
      VCR.use_cassette('wide_receivers') do
        response = @parser.get_by_position(:wide_receivers)

        response.keys.must_include :wide_receivers
        response[:wide_receivers].count.must_be :>, 0
      end
    end

    it 'should get tight ends' do
      VCR.use_cassette('tight_ends') do
        response = @parser.get_by_position(:tight_ends)

        response.keys.must_include :tight_ends
        response[:tight_ends].count.must_be :>, 0
      end
    end

    it 'should get all the players' do
      VCR.use_cassette('all_players') do
        response = @parser.get_by_position(:all)

        [:quarterbacks, :runningbacks, :wide_receivers, :tight_ends].each do |position|
          response.keys.must_include position
          response[position].count.must_be :>, 0
        end
      end
    end

    it 'should use JAX as Jacksonville abbreviation for all JAX team players' do
      VCR.use_cassette('all_players') do
        response = @parser.get_by_position(:all)

        players =
          [response[:quarterbacks], response[:runningbacks],
           response[:wide_receivers], response[:tight_ends]].flatten

        players.any? { |player| player[:team] == 'JAX' }.must_equal true
        players.none? { |player| player[:team] == 'JAC' }.must_equal true
      end
    end
  end
end
