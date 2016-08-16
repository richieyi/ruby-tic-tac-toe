class Player
  attr_accessor :piece, :enemy

  X_MARKER = 'X'
  O_MARKER = 'O'

  def initialize(piece)
    @piece = piece
    @enemy = piece == X_MARKER ? O_MARKER : X_MARKER 
  end
end
