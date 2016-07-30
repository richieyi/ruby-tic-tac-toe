require 'computer.rb'
require 'board.rb'

describe Computer do
  let(:board) { Board.new }
  before(:each) { @computer = Computer.new("O") }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect { @computer }.to_not raise_error
      expect(@computer.piece).to eq "O"
    end

    it 'has an enemy' do
      expect(@computer.enemy).to eq "X"
    end
  end

  context '#move' do
    it 'takes the last move' do
      board.set_piece_at(1, "X")
      board.set_piece_at(2, "O")
      board.set_piece_at(3, "O")
      board.set_piece_at(4, "O")
      board.set_piece_at(5, "X")
      board.set_piece_at(6, "X")
      board.set_piece_at(7, "X")
      board.set_piece_at(9, "O")
      expect(@computer.move(board)).to eq 8
    end

    it 'performs a block' do
      board.set_piece_at(9, "X")
      board.set_piece_at(8, "O")
      board.set_piece_at(5, "X")
      expect(@computer.move(board)).to eq 1
    end

    it 'takes the win' do
      board.set_piece_at(1, "O")
      board.set_piece_at(2, "X")
      board.set_piece_at(4, "O")
      board.set_piece_at(5, "X")
      expect(@computer.move(board)).to eq 7
    end
    
    it 'takes the win over a block' do
      board.set_piece_at(4, "O")
      board.set_piece_at(1, "X")
      board.set_piece_at(5, "O")
      board.set_piece_at(2, "X")
      expect(@computer.move(board)).to eq 6
    end
  end

  context '#score' do
    it 'returns 10 if current player wins' do
      board.grid = %w(X O O
                      O X O
                      X X O)
      expect(@computer.score(board, 0)).to eq(10)
    end

    it 'returns 0 if tie' do
      board.grid = %w(X O X
                      O X O
                      O X O)
      expect(@computer.score(board, 0)).to eq(0)
    end

    it 'returns 0 if nothing happens' do
      board.grid = %w(X O 3
                      X 5 6
                      7 8 9)
      expect(@computer.score(board, 0)).to eq(0)
    end

    it 'returns -10 if current player loses' do
      board.grid = %w(X O X
                      O X O
                      O O X)
      expect(@computer.score(board, 0)).to eq(-10)
    end
  end
end
