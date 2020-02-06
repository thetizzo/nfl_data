RSpec.describe NflData::TeamParser do
  let(:parser) { described_class.new }

  describe 'get_by_year' do
    it 'should get all the teams for year without schedule' do
      VCR.use_cassette('teams_without_schedule') do
        expect(parser.get_by_year(2014, false).count).to eq(32)
      end
    end

    it 'should get all the teams for year with schedule' do
      VCR.use_cassette('teams_with_schedule') do
        result = parser.get_by_year(2014, true)
        expect(result.count).to eq(32)
        result.each do |team|
          expect(team[:schedule].count).to eq(17) # includes bye weeks
        end
      end
    end

    it 'should use JAX as the abbreviation for Jacksonville' do
      VCR.use_cassette('teams_with_schedule') do
        result = parser.get_by_year(2014, true)
        expect(result.any? { |team| team[:short_name] == 'JAX' }).to eq(true)
        expect(result.none? { |team| team[:short_name] == 'JAC' }).to eq(true)
      end
    end
  end
end
