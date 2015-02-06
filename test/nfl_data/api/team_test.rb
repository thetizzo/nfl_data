require 'test_helper'

describe API::Team do
  subject { API::Team }

  it 'should respond to get_all' do
    subject.must_respond_to :get_all
  end

  it 'should response to get_all_with_schedule' do
    subject.must_respond_to :get_all_with_schedule
  end
end
