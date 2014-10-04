require 'test_helper'

describe PlayerParser do
  before do
    @parser = PlayerParser.new
  end

  after do
    @parser = nil
  end

  it 'should know the correct base url' do
    @parser.base_url.must_equal "http://www.nfl.com/players/search?category=position&conferenceAbbr=null&playerType=current&conference=ALL&filter="
  end
end
