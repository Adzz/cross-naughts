RSpec.describe GameMap do
  describe '#route' do
    let(:board) { double :board }

    it 'generates the possible routes through a game with one space left' do
      allow(board).to receive(:state).and_return(["X",1,"O"])
      subject = described_class.new(board)
      expect(subject.route).to eq [0]
    end

    it 'generates the correct' do
    end
  end
end
