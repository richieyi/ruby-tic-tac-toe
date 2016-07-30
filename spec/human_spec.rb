require 'human.rb'

describe Human do
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
