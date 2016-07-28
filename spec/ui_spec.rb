require 'ui.rb'
require 'board.rb'

describe UI do
  let(:board) { Board.new }
  let(:ui) { UI.new }

  context '#print_message' do
    it 'prints the message to the console' do
      expect { ui.print_message('hello world') }.to output("hello world\n").to_stdout
    end
  end

  context '#receive_input' do
    it 'receives the input from the user' do
      allow(ui).to receive(:gets).and_return('hello world')
      expect(ui.receive_input).to eq('hello world')
    end
  end

  context '#board_to_string' do
    it 'converts the board to string with pipes and line breaks' do
      expect(ui.board_to_string(board)).to eq(' 1 | 2 | 3 ' + "\n" \
                                              '-----------' + "\n" \
                                              ' 4 | 5 | 6 ' + "\n" \
                                              '-----------' + "\n" \
                                              ' 7 | 8 | 9 ')
    end
  end

  context '#display_board' do
    it 'prints the board to the console' do
      expect(ui).to receive(:board_to_string).with(board)
      expect(ui).to receive(:print_message)
      ui.display_board(board)
    end
  end

  context '#print_winner' do
    it 'prints the winner of TTT' do
      board.grid = %w(X X O
                      O X O
                      O O X)
      expect { ui.print_winner(board) }.to output("X has won the game!\n").to_stdout
    end
  end

  context '#print_tie' do
    it 'prints tie for tie game' do
      board.grid = %w(X O O
                      O X X
                      X O O)
      expect { ui.print_tie }.to output("Sorry tie game!\n").to_stdout
    end
  end

  context '#receive_turn_preference' do
    it 'prompts user for turn preference and receives input' do
      expect(ui).to receive(:print_message).with('Enter a turn preference (1 or 2): ')
      allow(ui).to receive(:receive_input).and_return('1')
      expect(ui.receive_turn_preference).to eq '1'
    end
  end

  context '#receive_piece_preference' do
    it 'prompts user for piece preference and receives input' do
      expect(ui).to receive(:print_message).with('Enter a piece preference (X or O): ')
      allow(ui).to receive(:receive_input).and_return('X')
      expect(ui.receive_piece_preference).to eq 'X'
    end
  end

  context '#receive_piece_location' do
    it 'prompts user for piece location and receives input' do
      expect(ui).to receive(:print_message).with('Enter a piece location (1-9): ')
      allow(ui).to receive(:receive_input).and_return('1')
      expect(ui.receive_piece_location).to eq '1'
    end
  end
end
