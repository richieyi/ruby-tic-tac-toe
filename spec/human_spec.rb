require 'human.rb'
require 'board.rb'

describe Human do
  let(:board) { Board.new }
  before(:each) { @human = Human.new("X") }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(@human.piece).to eq "X"
    end
    
    it 'has an enemy' do
      expect(@human.enemy).to eq "O"
    end
  end
end
