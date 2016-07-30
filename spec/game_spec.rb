require 'game.rb'
require 'board.rb'
require 'human.rb'
require 'computer.rb'
require 'ui.rb'
require 'pry'

describe Game do
  let(:game) do
    Game.new(Board.new, Human.new("X"), Computer.new("O"), UI.new)
  end

  context '#initialize' do
    it 'is initialized with a board, human player, computer player, and ui' do
    end
  end
end
