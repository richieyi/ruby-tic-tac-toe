class Computer
  attr_accessor :piece, :enemy
  attr_reader :b_move
  
  def initialize(piece)
    @piece = piece
    @enemy = piece == "O" ? "X" : "O"
  end

  def move(board)
    minimax(board, @piece, 0)
    @b_move.to_i
  end

  def minimax(board, current_player, depth)
    scores = []
    moves = []
    
    return score(board, depth) if board.game_over?

    board.available_moves.each do |move|
      board.set_piece_at(move.to_i, current_player) 

      print "\n"
      puts "MOVE: #{move} using #{current_player}"
      puts "GRID: #{board.grid}"

      next_player = current_player == @piece ? @enemy : @piece
      scores << minimax(board, next_player, depth + 1)
      moves << move

      print "\n"
      print scores
      print "\n"
      print moves
      print "\n"
      print "-" * 40
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
    if board.winner?
      if board.winner == @piece
        return (10 - depth)
      else
        return (depth - 10)
      end
    else
      return 0
    end
  end
end
