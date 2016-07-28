require 'human'

describe Human do
  let(:human) { Human.new("O") }

  context '#initialize' do
    it 'is initialized with a piece' do
      expect(human.piece).to eq "O"
    end
    
    it 'has an enemy' do
      expect(human.enemy).to eq "X"
    end
  end
end
