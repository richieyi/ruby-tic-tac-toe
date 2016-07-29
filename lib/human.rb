class Human
  attr_accessor :piece, :enemy, :board
  
  def initialize(piece, board)
    @piece = piece
    @enemy = piece == "X" ? "O" : "X"
    @board = board
  end
end
