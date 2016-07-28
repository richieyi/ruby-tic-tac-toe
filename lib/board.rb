class Board
  attr_accessor :size, :grid

  def initialize(dimensions = 3)
    @size = dimensions * dimensions
    @grid = ('1'..size.to_s).to_a
  end

  def available_moves
    grid.reject { |piece| piece == 'X' || piece == 'O' }
  end

  def get_piece_at(location)
    grid[location - 1]
  end

  def set_piece_at(location, piece)
    grid[location - 1] = piece
  end

  def reset_piece_at(location)
    grid[location - 1] = location.to_s
  end

  def rows
    grid.each_slice(Math.sqrt(size)).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [[grid[0], grid[4], grid[8]], [grid[2], grid[4], grid[6]]]
  end
end
