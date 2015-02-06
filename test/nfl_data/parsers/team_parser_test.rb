require 'test_helper'

describe TeamParser do
  before do
    @parser = TeamParser.new
  end

  after do
    @parser = nil
  end

  it 'should know the correct base url' do
    @parser.base_url.must_equal "http://www.nfl.com/standings?category=league&split=Overall&season="
  end

  describe 'get_by_year' do
    it 'should get all the teams for that year' do
      VCR.use_cassette('teams') do
        @parser.get_by_year(2014).count.must_equal 32
      end
    end
  end
end
