class UI
  def print_message(message)
    puts message
  end

  def receive_input
    gets.chomp
  end
 
  def board_to_string(board)
    board_to_s = ''
    board_to_s << " #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]} "
    board_to_s << "\n-----------\n"
    board_to_s << " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]} "
    board_to_s << "\n-----------\n"
    board_to_s << " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]} "
    board_to_s
  end

  def display_board(board)
    print_message(board_to_string(board))
  end

  def print_winner(board)
    print_message("#{board.winner} has won the game!")
  end

  def print_tie
    print_message('Sorry tie game!')
  end

  def receive_turn_preference
    print_message('Enter a turn preference (1 or 2): ')
    receive_input
  end

  def receive_piece_location
    print_message('Enter a piece location (1-9): ')
    receive_input
  end
end
