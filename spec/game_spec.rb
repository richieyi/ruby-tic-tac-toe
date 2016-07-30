require 'game.rb'
require 'board.rb'
require 'human.rb'
require 'computer.rb'
require 'ui.rb'
require 'pry'

describe Game do
  let(:game) { Game.new(Board.new, Human.new("X"), Computer.new("O"), UI.new) }

  context '#initialize' do
    it 'is initialized with a board, human player, computer player, and ui' do
      expect { game }.not_to raise_error
    end
  end
end
