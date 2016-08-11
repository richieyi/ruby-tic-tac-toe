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
    set_turn_order

    until @board.game_over? || @board.winner?
      if @human_turn
        @ui.display_board(@board)
        receive_human_move
      else
        receive_computer_move
      end
      swap_current_player
    end

    @ui.display_board(board)
    evaluate_game
  end

  def set_turn_order
    turn_pref = @ui.receive_turn_preference
    if turn_pref == '1'
      @human_turn = true
    elsif turn_pref == '2'
      @human_turn = false
    else
      set_turn_order
    end
  end

  def receive_human_move
    move = @ui.receive_piece_location
    if @board.available_moves.include?(move)
      @human.move(@board, move.to_i)
    else
      receive_human_move
    end
  end

  def receive_computer_move
    @ui.print_message('Computer is thinking...')
    @computer.move(@board)
  end

  def swap_current_player
    @human_turn = !@human_turn
  end

  def evaluate_game
    @board.tie? ? @ui.print_tie : @ui.print_winner(board)
  end
end
