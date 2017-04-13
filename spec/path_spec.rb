RSpec.describe Path do
  let(:game_tree) { GameTree.new(GameState.new("X", board)) }
  let(:board) { Board.new }
  let(:map) { Map.new(board) }

  it 'represents a' do
    binding.pry
    described_class.new(game_tree, map)
  end
end
