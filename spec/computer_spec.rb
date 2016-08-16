require 'computer.rb'
require 'player.rb'
require 'board.rb'

describe Computer do
  let(:board) { Board.new }
  let(:o_marker) { Player::O_MARKER }
  before(:each) { @computer = Computer.new(o_marker) }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect { @computer }.to_not raise_error
      expect(@computer.piece).to eq 'O'
    end

    it 'has an enemy' do
      expect(@computer.enemy).to eq 'X'
    end
  end

  context '#move' do
    it 'takes the last move' do
      board.set_piece_at(1, 'X')
      board.set_piece_at(2, 'O')
      board.set_piece_at(3, 'O')
      board.set_piece_at(4, 'O')
      board.set_piece_at(5, 'X')
      board.set_piece_at(6, 'X')
      board.set_piece_at(7, 'X')
      board.set_piece_at(9, 'O')
      @computer.move(board)

      expect(board.get_piece_at(8)).to eq 'O'
    end

    it 'performs a block' do
      board.set_piece_at(9, 'X')
      board.set_piece_at(8, 'O')
      board.set_piece_at(5, 'X')
      @computer.move(board)

      expect(board.get_piece_at(1)).to eq 'O'
    end

    it 'takes the win' do
      board.set_piece_at(1, 'O')
      board.set_piece_at(2, 'X')
      board.set_piece_at(4, 'O')
      board.set_piece_at(5, 'X')
      @computer.move(board)

      expect(board.get_piece_at(7)).to eq 'O'
    end

    it 'takes the win over a block' do
      board.set_piece_at(4, 'O')
      board.set_piece_at(1, 'X')
      board.set_piece_at(5, 'O')
      board.set_piece_at(2, 'X')
      @computer.move(board)

      expect(board.get_piece_at(6)).to eq 'O'
    end
  end
end
