RSpec.describe NflData::API::Player do
  subject { described_class }

  it "should respond to get_all" do
    expect(subject).to respond_to(:get_all)
  end

  it "should respond to get_quarterbacks" do
    expect(subject).to respond_to(:get_quarterbacks)
  end

  it "should respond to get_runningbacks" do
    expect(subject).to respond_to(:get_runningbacks)
  end

  it "should respond to get_wide_receivers" do
    expect(subject).to respond_to(:get_wide_receivers)
  end

  it "should respond to get_tight_ends" do
    expect(subject).to respond_to(:get_tight_ends)
  end
end
