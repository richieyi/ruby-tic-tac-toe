require_relative 'player'

class Human < Player
  def move(board, location)
    board.set_piece_at(location.to_i, @piece)
  end
end
