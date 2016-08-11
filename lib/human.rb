class Human
  attr_accessor :piece, :enemy

  def initialize(piece)
    @piece = piece
    @enemy = piece == 'X' ? 'O' : 'X'
  end

  def move(board, location)
    board.set_piece_at(location.to_i, @piece)
  end
end
