class Computer
  attr_accessor :piece, :enemy, :board
  
  def initialize(piece, board)
    @piece = piece
    @enemy = piece == "X" ? "O" : "X"
    @board = board
  end

  def score(board)
    if board.winner == piece
      10
    elsif board.winner == enemy
      -10
    else
      0
    end
  end
end
