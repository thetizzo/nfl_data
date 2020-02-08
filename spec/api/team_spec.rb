RSpec.describe NflData::API::Team do
  subject { described_class }

  it "should respond to get_all" do
    expect(subject).to respond_to(:get_all)
  end

  it "should response to get_all_with_schedule" do
    expect(subject).to respond_to(:get_all_with_schedule)
  end
end
