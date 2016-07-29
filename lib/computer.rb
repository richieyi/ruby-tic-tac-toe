class Computer
  attr_accessor :piece, :enemy, :board
  attr_reader :b_move
  
  def initialize(piece, board)
    @piece = piece
    @enemy = piece == "X" ? "O" : "X"
    @board = board
  end

  def move(board)
    minimax(board, @piece, 0)
    @b_move.to_i
  end

  def minimax(board, current_player, depth)
    depth += 1

    scores = []
    moves = []
    pieces = []
    
    return score(board, depth) if board.game_over?

    board.available_moves.each do |move|

      print "\n"
      print "HELLO I AM MOVE: #{move} using #{current_player}"
      print "\n"
      
      board.set_piece_at(move.to_i, current_player) 
     
      print "HELLO I AM GRID: #{board.grid}"
      print "\n"

      next_player = current_player == @piece ? @enemy : @piece 
      
      scores << minimax(board, next_player, depth)
     
      print "\n"
      moves << move
      pieces << next_player
      print "\n"
      print scores
      print "\n"
      print moves
      print "\n"
      print pieces 
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
    opp = piece == "X" ? "O" : "X"
    if board.winner == piece
      print 'calc pos'
      (10 - depth)
    elsif board.winner == opp
      print 'calc neg'
      (depth - 10)
    else
      0
    end
  end
end
