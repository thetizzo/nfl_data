# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::ScheduleFeed do
  subject { described_class.new }

  it "requests the season schedule" do
    VCR.use_cassette("msf_schedule") do
      expect(subject.seasonal_games(season_start_year: 2020).size).to eq(10)
    end
  end

  it "should convert year to compatible season slug" do
    expect(subject.season_slug(2020)).to eq("2020-2021-regular")
  end
end
