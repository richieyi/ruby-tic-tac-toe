class Computer
  attr_accessor :piece, :enemy
  attr_reader :best_move

  STARTING_DEPTH = 0

  def initialize(piece)
    @piece = piece
    @enemy = piece == 'O' ? 'X' : 'O'
  end

  def move(board)
    minimax(board, @piece, STARTING_DEPTH)
    board.set_piece_at(@best_move.to_i, @piece)
  end

  def score(board, depth)
    best_score = board.grid.size + 1

    if board.winner?
      if board.winner == @piece
        return (best_score - depth)
      else
        return (depth - best_score)
      end
    else
      return 0
    end
  end

  private

  def minimax(board, current_player, depth)
    scores = []
    moves = []

    return score(board, depth) if board.game_over?

    board.available_moves.each do |move|
      board.set_piece_at(move.to_i, current_player)

      next_player = current_player == @piece ? @enemy : @piece
      scores << minimax(board, next_player, depth + 1)
      moves << move

      board.reset_piece_at(move.to_i)
    end

    if current_player == @piece
      max_score_idx = scores.each_with_index.max[1]
      @best_move = moves[max_score_idx]
      return scores[max_score_idx]
    else
      min_score_idx = scores.each_with_index.min[1]
      @best_move = moves[min_score_idx]
      return scores[min_score_idx]
    end
  end
end
