require_relative 'game'
require_relative 'board'
require_relative 'human'
require_relative 'computer'
require_relative 'ui'

game = Game.new(Board.new, Human.new("X"), Computer.new("O"), UI.new)
game.play
