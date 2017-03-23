RSpec.describe GameState do
  describe "#active_player" do
    it 'returns the active player' do
      game_state = GameState.new('X', Board.new)
      expect(game_state.active_player).to eq 'X'
    end
  end

  describe '#board_state' do
    it 'returns the given state of the board when there are no players on the board' do
      game_state = GameState.new('X', Board.new(state: [*0..8]))
      expect(game_state.board_state).to eq [0,1,2,3,4,5,6,7,8]
    end
  end

  context 'children' do
    context "when player is X" do
      it "will generate children for each possible next move" do
        game_state = GameState.new("X", Board.new(state: [0,1]))
        expect(game_state.children.map(&:board_state)).to eq [["X",1],[0,"X"]]
      end

      context "will not generate children:" do
        it 'with an X where an X was' do
          game_state = GameState.new("X", Board.new(state: [0,"X","O",3]))
          expect(game_state.children.map(&:board_state)).to eq [["X","X","O",3],[0,"X","O","X"]]
        end

        it 'with an X where an O was' do
          game_state = GameState.new("X", Board.new(state: ["O","X",2]))
          expect(game_state.children.map(&:board_state)).to eq [["O","X","X"]]
        end

        it "when the board state is an end state" do
          game_state = GameState.new("X", Board.new(state: ["O",1,"O",3,"O",5,"X","X","X"]))
          expect(game_state.children).to be nil
        end
      end
    end

    context "when player is O" do
      it "will generate children for each possible next move" do
        game_state = GameState.new("O", Board.new(state: ["X",1,2]))
        expect(game_state.children.map(&:board_state)).to eq [["X", "O", 2], ["X", 1, "O"]]
      end

      context "will not generate children with an O in an illegal place:" do
        it 'with an O where an X was' do
          game_state = GameState.new("O", Board.new(state: [0,"X"]))
          expect(game_state.children.map(&:board_state)).to eq [["O","X"]]
        end

        it 'with an O where an O was' do
          game_state = GameState.new("O", Board.new(state: ["O","X","X",3]))
          expect(game_state.children.map(&:board_state)).to eq [["O","X","X","O"]]
        end

        it "when the board state is an end state" do
          game_state = GameState.new("O", Board.new(state: ["X",2,"X","X","X",5,"O","O","O"]))
          expect(game_state.children).to be nil
        end
      end
    end
  end
end
