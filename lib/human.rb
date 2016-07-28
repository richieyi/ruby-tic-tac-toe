class Human
  attr_accessor :piece, :enemy, :board
  
  def initialize(piece, board)
    @piece = piece
    @enemy = piece == "O" ? "X" : "O"
    @board = board
  end
end
