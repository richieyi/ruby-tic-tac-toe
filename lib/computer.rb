class Computer
  attr_accessor :piece, :enemy, :board
  attr_reader :b_move
  
  def initialize(piece, board)
    @piece = piece
    @enemy = piece == "O" ? "X" : "O"
    @board = board
  end

  def move(board)
    minimax(board, @piece, 0)
    @b_move.to_i
  end

  def minimax(board, current_player, depth)
    return score(board, depth) if board.game_over?
    depth += 1

    scores = []
    moves = []
    pieces = []

    board.available_moves.each do |move|
      board.set_piece_at(move.to_i, current_player) 
      next_player = current_player == "O" ? "X" : "O"

      scores << minimax(board, next_player, depth)
      moves << move
      pieces << next_player
      print "\n"
      print scores
      print "\n"
      print moves
      print "\n"
      print pieces 
      print "\n"
      board.reset_piece_at(move.to_i)
    end

    if current_player == @piece
      max_score_idx = scores.each_with_index.max[1]
      @b_move = moves[max_score_idx]
      return scores[max_score_idx]
    else
      min_score_idx = scores.each_with_index.min[1]
      @b_move = moves[min_score_idx]
      return scores[min_score_idx]
    end
  end

  def score(board, depth)
    if board.winner == piece
      return (10 - depth)
    elsif board.winner == enemy
      return (depth - 10)
    else
      0
    end
  end
end
