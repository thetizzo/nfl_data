RSpec.describe NflData::PlayerParser do
  let(:parser) { described_class.new }

  it 'should know the correct base url' do
    expected_base_url = 'http://www.nfl.com/players/search?category=' \
                        'position&conferenceAbbr=null&playerType=current' \
                        '&conference=ALL&filter='

    expect(parser.base_url).to eq(expected_base_url)
  end

  describe 'get_by_position' do
    it 'should get quarterbacks' do
      VCR.use_cassette('quarterbacks') do
        response = parser.get_by_position(:quarterbacks)

        expect(response.keys).to include(:quarterbacks)
        expect(response[:quarterbacks].count).to be > 0
      end
    end

    it 'should get runningbacks' do
      VCR.use_cassette('runningbacks') do
        response = parser.get_by_position(:runningbacks)

        expect(response.keys).to include(:runningbacks)
        expect(response[:runningbacks].count).to be > 0
      end
    end

    it 'should get wide receivers' do
      VCR.use_cassette('wide_receivers') do
        response = parser.get_by_position(:wide_receivers)

        expect(response.keys).to include(:wide_receivers)
        expect(response[:wide_receivers].count).to be > 0
      end
    end

    it 'should get tight ends' do
      VCR.use_cassette('tight_ends') do
        response = parser.get_by_position(:tight_ends)

        expect(response.keys).to include(:tight_ends)
        expect(response[:tight_ends].count).to be > 0
      end
    end

    it 'should get all the players' do
      VCR.use_cassette('all_players') do
        response = parser.get_by_position(:all)

        [:quarterbacks, :runningbacks, :wide_receivers, :tight_ends].each do |position|
          expect(response.keys).to include(position)
          expect(response[position].count).to be > 0
        end
      end
    end

    it 'should use JAX as Jacksonville abbreviation for all JAX team players' do
      VCR.use_cassette('all_players') do
        response = parser.get_by_position(:all)

        players =
          [response[:quarterbacks], response[:runningbacks],
           response[:wide_receivers], response[:tight_ends]].flatten

        expect(players.any? { |player| player[:team] == 'JAX' }).to be true
        expect(players.none? { |player| player[:team] == 'JAC' }).to be true
      end
    end
  end
end
