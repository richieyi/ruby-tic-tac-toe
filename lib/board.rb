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
    range = Math.sqrt(size) - 1
    diagonal_1 = (0..range).collect { |i| rows[i][i] }
    diagonal_2 = (0..range).collect { |i| rows.reverse[i][i] }
    diagonal_2 = diagonal_2.reverse

    [diagonal_1, diagonal_2]
  end

  def row_win?
    rows.each { |row| return true if row.uniq == ['X'] || row.uniq == ['O'] }
    return false
  end
  
  def column_win?
    columns.each { |col| return true if col.uniq == ['X'] || col.uniq == ['O'] }
    return false
  end
  
  def diagonal_win?
    diagonals.each { |d| return true if d.uniq == ['X'] || d.uniq == ['O'] }
    return false
  end

  def winner?
    row_win? || column_win? || diagonal_win?
  end

  def tie?
    available_moves.length.zero? && !winner?
  end

  def game_over?
    winner? || available_moves.length.zero?
  end

  def winner
    rows.each { |row| return row.uniq.first if row.uniq.length == 1 }
    columns.each { |col| return col.uniq.first if col.uniq.length == 1 }
    diagonals.each { |diag| return diag.uniq.first if diag.uniq.length == 1 }
  end
end
