RSpec.describe NflData::StatlineParser do
  let(:parser) { described_class.new }

  describe "get" do
    it "should get passing statlines" do
      VCR.use_cassette("passing") do
        response = parser.get(4, 2014, :passing)
        expect(response.count).to eq(34)
      end
    end

    it "should get rushing statlines" do
      VCR.use_cassette("rushing") do
        response = parser.get(4, 2014, :rushing)
        expect(response.count).to eq(106)
      end
    end

    it "should get receiving statlines" do
      VCR.use_cassette("receiving") do
        response = parser.get(4, 2014, :receiving)
        expect(response.count).to eq(210)
      end
    end
  end
end
