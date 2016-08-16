require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'computer'
require_relative 'ui'

x_marker = Player::X_MARKER
o_marker = Player::O_MARKER
game = Game.new(Board.new, Human.new(x_marker), Computer.new(o_marker), UI.new)
game.play
