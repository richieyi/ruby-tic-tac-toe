require 'game.rb'
require 'board.rb'
require 'human.rb'
require 'computer.rb'
require 'ui.rb'
require 'pry'

describe Game do
  let(:board) { Board.new }
  let(:game) do
    Game.new(board, Human.new("O", board), Computer.new("X", board), UI.new)
  end

  context '#initialize' do
    it 'is initialized with a board, human player, computer player, and ui' do
      expect(game.board).to be_a Board
    end
  end
end
