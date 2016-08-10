require 'board.rb'

describe Board do
  let(:board) { Board.new }

  context '#initialize' do
    it 'is has a size' do
      expect(board.size).to eq(9)
    end
    
    it 'is initialized with a grid' do
      expect(board.grid).to eq %w(1 2 3 4 5 6 7 8 9)
    end
  end

  context '#available_moves' do
    it 'returns an array of available moves' do
      board.grid = %w(1 2 X 4 5 O 7 8 X)
      expect(board.available_moves).to eq %w(1 2 4 5 7 8)
    end
  end

  context '#get_piece_at' do
    it 'returns the piece at given location 'do
      board.grid = %w(1 2 X 4 5 O 7 8 X)
      expect(board.get_piece_at(3)).to eq 'X'
    end
  end

  context '#set_piece_at' do
    it 'sets piece at given location' do
      board.grid = %w(1 2 X 4 5 O 7 8 X)
      board.set_piece_at(1, 'X')
      expect(board.grid).to eq %w(X 2 X 4 5 O 7 8 X)
    end
  end

  context '#reset_piece_at' do
    it 'resets piece at given location' do
      board.grid = %w(1 2 X 4 5 O 7 8 X)
      board.reset_piece_at(3)
      expect(board.grid).to eq %w(1 2 3 4 5 O 7 8 X)
    end
  end

  context '#rows' do
    it 'returns the rows from a 3x3 board' do
      expect(board.rows).to eq [%w(1 2 3), %w(4 5 6), %w(7 8 9)]
    end
    
    it 'returns the rows from a 4x4 board' do
      board = Board.new(4)
      expect(board.rows).to eq [%w(1 2 3 4),
                                %w(5 6 7 8),
                                %w(9 10 11 12),
                                %w(13 14 15 16)]
    end
  end

  context '#columns' do
    it 'returns the columns from a 3x3 board' do
      expect(board.columns).to eq [%w(1 4 7), %w(2 5 8), %w(3 6 9)]
    end
    
    it 'returns the columns from a 4x4 board' do
      board = Board.new(4)
      expect(board.columns).to eq [%w(1 5 9 13),
                                   %w(2 6 10 14),
                                   %w(3 7 11 15),
                                   %w(4 8 12 16)]
    end
  end

  context '#diagonals' do
    it 'returns the diagonals from a 3x3 board' do
      expect(board.diagonals).to eq [%w(1 5 9), %w(3 5 7)]
    end

    it 'returns the diagonals from a 4x4 board' do
      board = Board.new(4)
      expect(board.diagonals).to eq [%w(1 6 11 16), %w(4 7 10 13)]
    end
  end

  context '#row_win?' do
    it 'returns true for a row win' do
      board.grid = %w(O X O
                      X X X
                      X O O)
      expect(board.row_win?).to be_truthy
    end
    
    it 'returns false if not a row win' do
      board.grid = %w(O X O
                      O X X
                      X O O)
      expect(board.row_win?).to be_falsey
    end
  end
  
  context '#column_win?' do
    it 'returns true for a column win' do
      board.grid = %w(O X O
                      O X X
                      X X O)
      expect(board.column_win?).to be_truthy
    end
    
    it 'returns false if not a column win' do
      board.grid = %w(O X O
                      O X X
                      X O O)
      expect(board.column_win?).to be_falsey
    end
  end
  
  context '#diagonal_win?' do
    it 'returns true for a diagonal win' do
      board.grid = %w(O O X
                      O X X
                      X O O)
      expect(board.diagonal_win?).to be_truthy
    end
    
    it 'returns false if not a diagonal win' do
      board.grid = %w(O X O
                      O X X
                      X O O)
      expect(board.diagonal_win?).to be_falsey
    end
  end

  context '#winner?' do
    it 'returns true if there is a winner' do
      board.grid = %w(O X O
                      O O X
                      X X O)
      expect(board.winner?).to be_truthy
    end

    it 'returns false if there is no winner' do
      board.grid = %w(O X O
                      O X X
                      X O O)
      expect(board.winner?).to be_falsey
    end
  end
  
  context '#tie?' do
    it 'returns true if there is a tie' do
      board.grid = %w(X X O
                      O O X
                      X X O)
      expect(board.tie?).to be_truthy
    end

    it 'returns false if there is no tie' do
      board.grid = %w(O X O
                      X X X
                      X O O)
      expect(board.tie?).to be_falsey
    end
  end
  
  context '#game_over?' do
    it 'returns true if the game is over' do
      board.grid = %w(X X O
                      O O X
                      X X O)
      expect(board.game_over?).to be_truthy
    end

    it 'returns false if game is not over' do
      board.grid = %w(X X O
                      O O X
                      X 8 O)
      expect(board.game_over?).to be_falsey
    end
  end

  context '#winner' do
    it 'returns the winner of TTT' do
      board.grid = %w(O X O
                      X O O
                      X X X)
      expect(board.winner).to eq 'X'

      board.grid = %w(O X X
                      X O X
                      O O X)
      expect(board.winner).to eq 'X'

      board.grid = %w(X O O
                      O O X
                      O X X)
      expect(board.winner).to eq 'O'
    end
  end
end
