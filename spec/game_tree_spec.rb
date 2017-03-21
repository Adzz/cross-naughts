RSpec.describe GameTree do
  describe '#tree' do
    subject { described_class.new(GameState.new('X', Board.new)) }

    it 'generates the game tree' do
      subject.tree
      expect(subject.game_tree).to eq 1
    end
  end
end

