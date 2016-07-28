class Board
  attr_accessor :size, :grid

  def initialize(dimensions = 3)
    @size = dimensions * dimensions
    @grid = ('1'..size.to_s).to_a
  end

end
