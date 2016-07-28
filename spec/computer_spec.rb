require 'computer.rb'
require 'board.rb'

describe Computer do
  before(:each) do
    @board = Board.new
    @computer = Computer.new("X", @board)
  end

  context '#initialize' do
    it 'is initialized with a piece' do
      expect { @computer }.to_not raise_error
      expect(@computer.piece).to eq "X"
    end

    it 'has an enemy' do
      expect(@computer.enemy).to eq "O"
    end

    it 'has a board' do
      expect(@computer.board).to be_a Board
    end
  end

  context '#score' do
    it 'returns 10 if current player wins' do
      @board.grid = %w(X O X
                       O X O
                       O O X)
      expect(@computer.score(@board)).to eq(10)
    end

    it 'returns 0 if tie' do
      @board.grid = %w(X O X
                       O X O
                       O X O)
      expect(@computer.score(@board)).to eq(0)
    end

    it 'returns 0 if nothing happens' do
      @board.grid = %w(X O 3
                       X 5 6
                       7 8 9)
      expect(@computer.score(@board)).to eq(0)
    end

    it 'returns -10 if current player loses' do
      @board.grid = %w(X O O
                       O X O
                       X X O)
      expect(@computer.score(@board)).to eq(-10)
    end
  end
end
