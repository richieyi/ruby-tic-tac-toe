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
    turn_pref = ''
    until turn_pref == '1' || turn_pref == '2'
      turn_pref = @ui.receive_turn_preference
    end
    set_turn_order(turn_pref)

    until @board.game_over? || @board.tie?
      if @human_turn
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

    @ui.display_board(board)
    evaluate_game
  end

  private

  def set_turn_order(turn_pref)
    @human_turn = true if turn_pref == '1'
  end

  def swap_player_turn
    @human_turn = !@human_turn 
  end

  def evaluate_game
    if @board.tie?
      @ui.print_tie
    else
      @ui.print_winner(board)
    end
  end
end
