require 'test_helper'

describe StatlineParser do
  before do
    @parser = StatlineParser.new
  end

  after do
    @parser = nil
  end

  describe 'get' do
    it 'should get passing statlines' do
      VCR.use_cassette('passing') do
        response = @parser.get(4, 2014, :passing)
        response.count.must_equal 34
      end
    end

    it 'should get rushing statlines' do
      VCR.use_cassette('rushing') do
        response = @parser.get(4, 2014, :rushing)
        response.count.must_equal 106
      end
    end

    it 'should get receiving statlines' do
      VCR.use_cassette('receiving') do
        response = @parser.get(4, 2014, :receiving)
        response.count.must_equal 210
      end
    end

  end
end
