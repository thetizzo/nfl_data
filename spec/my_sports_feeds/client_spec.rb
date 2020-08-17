# frozen_string_literal: true

RSpec.describe NflData::MySportsFeeds::Client do
  subject do
    described_class.new(api_host: "http://api.example.com",
                        api_key: "123",
                        api_version: "v2")
  end

  it "should request json format" do
    expect(subject.format).to eq("json")
  end

  it "should construct the base url" do
    expect(subject.base_url).to eq("http://api.example.com/v2/pull/nfl/")
  end
end
