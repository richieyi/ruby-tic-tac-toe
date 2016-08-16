require 'player.rb'

describe Player do
  let(:x_marker) { Player::X_MARKER }
  before(:each) { @player = Player.new(x_marker) }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(@player.piece).to eq 'X'
    end

    it 'is initialized with an enemy' do
      expect(@player.enemy).to eq 'O'
    end
  end
end
