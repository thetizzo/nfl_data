require 'test_helper'

describe Player do
  it 'should have a name' do
    player = Player.new
    player.name = "Bob"
    player.name.must_equal "Bob"
  end
end
