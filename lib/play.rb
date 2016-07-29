require_relative 'game'
require_relative 'board'
require_relative 'human'
require_relative 'computer'
require_relative 'ui'

game = Game.new(Board.new, Human.new("O"), Computer.new("X"), UI.new)
game.play
