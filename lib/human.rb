class Human
  attr_accessor :piece, :enemy
  
  def initialize(piece)
    @piece = piece
    @enemy = piece == "O" ? "X" : "O"
  end
end
