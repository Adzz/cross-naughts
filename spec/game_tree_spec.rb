RSpec.describe GameTree do
  describe '#tree' do
    subject { described_class.new(game_state) }

    xcontext 'when the game is over' do
      it 'does not generate further game states' do
        end_states.each do |state|
          expect(described_class.new(state).tree).to eq []
        end
      end

      def end_states
        [
          GameState.new("X", x_won),
          GameState.new("X", o_won)
        ]
      end

      def x_won
        Board.new(state: ["X","X","X",3,4,5,"O","O",8])
      end

      def o_won
        Board.new(state: ["X","X",2,"X",4,5,"O","O","O"])
      end

      # def draw
      #   Board.new(state: ["X","O","X","O","X","O","O","X","O"])
      # end
    end

    context 'one free space' do
      let!(:board) { Board.new(state: ["X","O","X","O","X","O","O","X",8]) }
      let!(:game_state) { GameState.new("O", board) }

      it 'generates the one remaining move' do
        expect(subject.tree.map(&:board_state)).to eq [["X","O","X","O","X","O","O","X","O"]]
      end
    end

    context 'when the game ends' do
      let!(:board) { Board.new(state: ["X","O","X","O","X","O","O",7,8]) }
      let!(:game_state) { GameState.new("X", board) }
      let(:result) do
        [
          ["X","O","X","O","X","O","O","X",8],
          ["X","O","X","O","X","O","O",7,"X"],
          ["X","O","X","O","X","O","O","X","O"]
        ]
      end

      it 'wont calculate moves past the end game state' do
        binding.pry
        expect(subject.tree.count).to eq 3
        expect(subject.tree.map(&:board_state)).to eq result
      end
    end
  end
end
