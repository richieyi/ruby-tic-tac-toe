require_relative 'board'
require_relative 'human'
require_relative 'computer'
require_relative 'ui'

class Game
  attr_accessor :board, :human, :computer, :ui, :human_turn

  def initialize(board, human, computer, ui)
    @board = board
    @human = human
    @computer = computer
    @ui = ui
    @human_turn = false
  end
  
  def play
    # set turn order
    turn_pref = ''
    until turn_pref == '1' || turn_pref == '2'
      turn_pref = @ui.receive_turn_preference
    end
    set_turn_order(turn_pref)
    
    # set player pieces
    piece_pref = ''
    until piece_pref == 'X' || piece_pref == 'O'
      piece_pref = @ui.receive_piece_preference
    end
    set_player_pieces(piece_pref)

    # game loop
    until @board.game_over? || @board.tie?
      if human_turn
        @ui.display_board(@board)
        location = ''
        until @board.available_moves.include?(location)
          location = @ui.receive_piece_location
        end
        piece = human.piece
      else
        @ui.print_message("Computer is thinking...")
        location = computer.move(@board)
        piece = computer.piece
      end

      @board.set_piece_at(location.to_i, piece)
      swap_player_turn
    end

    # display @board after game over
    @ui.display_board(board)
    
    # game state evaluate
    if @board.tie?
      @ui.print_tie
    else
      @ui.print_winner(board)
    end
  end

  private
  
  def set_player_pieces(human_piece)
    @human.piece = human_piece
    if human_piece == 'X'
      @computer.piece = 'O'
    else
      @computer.piece = 'X'
    end
  end

  def set_turn_order(turn_pref)
    @human_turn = true if turn_pref == '1'
  end

  def swap_player_turn
    @human_turn = !@human_turn 
  end
end
