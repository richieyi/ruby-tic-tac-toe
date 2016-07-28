class Computer
  attr_accessor :piece, :enemy, :board
  attr_reader :b_move
  
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

  def move(board)
    minimax(board, @piece)
    @b_move.to_i
  end

  def minimax(board, current_player)
    return score(board) if board.game_over?

    scores = []
    moves = []

    board.available_moves.each do |move|
      board.set_piece_at(move.to_i, current_player) 
      next_player = current_player == "X" ? "O" : "X"

      scores << minimax(board, next_player)
      moves << move

      board.reset_piece_at(move.to_i)
    end

    if current_player == piece
      max_score_idx = scores.each_with_index.max[1]
      @b_move = moves[max_score_idx]
      return scores[max_score_idx]
    else
      min_score_idx = scores.each_with_index.min[1]
      @b_move = moves[min_score_idx]
      return scores[min_score_idx]
    end
  end
end
