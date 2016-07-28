require 'human.rb'
require 'board.rb'

describe Human do
  before(:each) do
    @board = Board.new
    @human = Human.new("O", @board)
  end

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(@human.piece).to eq "O"
    end
    
    it 'has an enemy' do
      expect(@human.enemy).to eq "X"
    end

    it 'has a board' do
      expect(@human.board).to be_a Board
    end
  end
end
