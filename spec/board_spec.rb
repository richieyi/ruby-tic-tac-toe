require 'board.rb'

describe Board do
  it 'is initialized with a grid' do
    board = Board.new
    expect(board.grid).to eq %w(1 2 3 4 5 6 7 8 9)
  end
end
