require 'game.rb'
require 'human.rb'
require 'player.rb'

describe Human do
  let(:x_marker) { Player::X_MARKER }
  let(:o_marker) { Player::O_MARKER }
  let(:game) do 
    Game.new(Board.new, Human.new(x_marker), Computer.new(o_marker), UI.new)
  end

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(game.human.piece).to eq 'X'
    end
    
    it 'has an enemy' do
      expect(game.human.enemy).to eq 'O'
    end
  end

  context '#move' do
    it 'sets move based on given location' do
      game.human.move(game.board, '1')
      expect(game.board.get_piece_at(1)).to eq 'X'
    end
  end
end
