require 'game.rb'
require 'human.rb'

describe Human do
  let(:game) { Game.new(Board.new, Human.new('X'), Computer.new('O'), UI.new) }
  before(:each) { @human = Human.new('X') }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(@human.piece).to eq 'X'
    end
    
    it 'has an enemy' do
      expect(@human.enemy).to eq 'O'
    end
  end

  context '#move' do
    it 'sets move based on given location' do
      @human.move(game.board, '1')
      expect(game.board.get_piece_at(1)).to eq 'X'
    end
  end
end
