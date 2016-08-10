require 'game.rb'
require 'board.rb'
require 'human.rb'
require 'computer.rb'
require 'ui.rb'
require 'pry'

describe Game do
  let(:game) { Game.new(Board.new, Human.new('X'), Computer.new('O'), UI.new) }
  before(:each) do
    @ui = double
    @board = double
  end

  context '#initialize' do
    it 'is initialized with a board, human player, computer player, and ui' do
      expect { game }.not_to raise_error
    end
  end

  context '#play' do
    it 'breaks game loop and shows a winner' do
      allow(@ui).to receive(:receive_turn_preference).and_return('1')
      allow(@board).to receive(:winner?).and_return([false, false, false, false, true])
      expect(@ui).to receive(:display_board).once
      allow(@board).to receive(:game_over?).and_return(true)
      allow(@board).to receive(:tie?).and_return(false)
      expect(@ui).to receive(:print_winner).once

      game = Game.new(@board, Human.new('X'), Computer.new('O'), @ui)
      game.play
    end
    
    it 'breaks game loop and shows a tie' do
      allow(@ui).to receive(:receive_turn_preference).and_return('1')
      allow(@board).to receive(:game_over?).and_return(true)
      expect(@ui).to receive(:display_board).once
      allow(@board).to receive(:tie?).and_return(true)
      expect(@ui).to receive(:print_tie).once

      game = Game.new(@board, Human.new('X'), Computer.new('O'), @ui)
      game.play
    end
  end

  context '#set_turn_order' do
    it 'sets human as first if requested' do
      allow(game.ui).to receive(:receive_turn_preference).and_return('1')
      game.set_turn_order

      expect(game.human_turn).to be_truthy
    end
    
    it 'sets human as second if requested' do
      allow(game.ui).to receive(:receive_turn_preference).and_return('2')
      game.set_turn_order

      expect(game.human_turn).to be_falsey
    end
  end

  context '#receive_human_move' do
    it 'receives move from human player' do
      allow(game.ui).to receive(:receive_piece_location).and_return('1')
      expect(game.human).to receive(:move)

      game.receive_human_move
    end
  end

  context '#receive_computer_move' do
    it 'receives move from computer player' do
      expect(game.ui).to receive(:print_message)
      expect(game.computer).to receive(:move)

      game.receive_computer_move
    end
  end

  context '#swap_current_player' do
    it 'swaps the current players turn' do
      expect(game.human_turn).to be_falsey
      
      game.swap_current_player
      expect(game.human_turn).to be_truthy
    end
  end

  context '#evaluate_game' do
    it 'prints winner if a player has won' do
      game.board.set_piece_at(1, 'X')
      game.board.set_piece_at(2, 'X')
      game.board.set_piece_at(3, 'X')
      game.board.set_piece_at(4, 'O')
      game.board.set_piece_at(5, 'O')

      expect(game.ui).to receive(:print_winner)

      game.evaluate_game
    end

    it 'prints tie if game is tied' do
      game.board.set_piece_at(1, 'O')
      game.board.set_piece_at(2, 'X')
      game.board.set_piece_at(3, 'X')
      game.board.set_piece_at(4, 'X')
      game.board.set_piece_at(5, 'O')
      game.board.set_piece_at(6, 'O')
      game.board.set_piece_at(7, 'O')
      game.board.set_piece_at(8, 'X')
      game.board.set_piece_at(9, 'X')

      expect(game.ui).to receive(:print_tie)

      game.evaluate_game
    end
  end
end
