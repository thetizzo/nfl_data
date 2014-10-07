require 'test_helper'

describe API::Player do
  subject { API::Player }

  it 'should respond to get_all' do
    subject.must_respond_to :get_all
  end

  it 'should respond to get_quarterbacks' do
    subject.must_respond_to :get_quarterbacks
  end

  it 'should respond to get_runningbacks' do
    subject.must_respond_to :get_runningbacks
  end

  it 'should respond to get_wide_receivers' do
    subject.must_respond_to :get_wide_receivers
  end

  it 'should respond to get_tight_ends' do
    subject.must_respond_to :get_tight_ends
  end
end
