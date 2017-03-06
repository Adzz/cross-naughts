require 'spec_helper'

RSpec.describe GameState do
  let(:player) { double :player }
  let(:board) { double :board }

  subject { GameState.new(player, board)  }

  describe "#active_player" do
    it 'returns the active player' do
      expect(subject.active_player).to eq player
    end
  end

  describe '#board_state' do
    it 'returns the given state of the board when there are no players on the board' do
      allow(board).to receive(:state).and_return([*0..8])
      expect(subject.board_state).to eq [0,1,2,3,4,5,6,7,8]
    end
  end
end
