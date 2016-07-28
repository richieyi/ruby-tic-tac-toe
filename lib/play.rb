require_relative 'game'
require_relative 'board'
require_relative 'human'
require_relative 'computer'
require_relative 'ui'

board = Board.new
game = Game.new(board, Human.new("O", board), Computer.new("X", board), UI.new)
game.play
