RSpec.describe NflData::API::Statline do
  subject { described_class }

  it 'should respond to get_all_by_week_and_year' do
    expect(subject).to respond_to(:get_all)
  end

  it 'should respond to get_passing_by_week_and_year' do
    expect(subject).to respond_to(:get_passing)
  end

  it 'should respond to get_rushing_by_week_and_year' do
    expect(subject).to respond_to(:get_rushing)
  end

  it 'should respond to get_receiving_by_week_and_year' do
    expect(subject).to respond_to(:get_receiving)
  end
end
