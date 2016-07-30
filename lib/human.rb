class Human
  attr_accessor :piece, :enemy
  
  def initialize(piece)
    @piece = piece
    @enemy = piece == "X" ? "O" : "X"
  end
end
