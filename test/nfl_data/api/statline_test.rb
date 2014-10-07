require 'test_helper'

describe API::Statline do
  subject { API::Statline }

  it 'should respond to get_all_by_week_and_year' do
    subject.must_respond_to :get_all
  end

  it 'should respond to get_passing_by_week_and_year' do
    subject.must_respond_to :get_passing
  end

  it 'should respond to get_rushing_by_week_and_year' do
    subject.must_respond_to :get_rushing
  end

  it 'should respond to get_receiving_by_week_and_year' do
    subject.must_respond_to :get_receiving
  end
end
