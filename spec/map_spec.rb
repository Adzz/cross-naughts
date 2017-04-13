RSpec.describe Map do
  context '1 X 1 board' do
    it 'should map 1 unique route' do
      game_map = Map.new(Board.new(state: [0]))
      expect(game_map.path_maps.uniq.count).to eq 1
    end
  end

  context '2 X 2 board' do
    let(:result) do
      [
        [0, 0, 0, 0],
        [0, 0, 1, 0],
        [0, 1, 0, 0],
        [0, 1, 1, 0],
        [0, 2, 0, 0],
        [0, 2, 1, 0],
        [1, 0, 0, 0],
        [1, 0, 1, 0],
        [1, 1, 0, 0],
        [1, 1, 1, 0],
        [1, 2, 0, 0],
        [1, 2, 1, 0],
        [2, 0, 0, 0],
        [2, 0, 1, 0],
        [2, 1, 0, 0],
        [2, 1, 1, 0],
        [2, 2, 0, 0],
        [2, 2, 1, 0],
        [3, 0, 0, 0],
        [3, 0, 1, 0],
        [3, 1, 0, 0],
        [3, 1, 1, 0],
        [3, 2, 0, 0],
        [3, 2, 1, 0]
      ]
    end

    it 'should map 128 unique path_maps' do
      game_map = Map.new(Board.new(state: [0,1,2,3]))
      expect(game_map.path_maps.uniq.count).to eq 24
    end

    it 'should map return every combination of path available' do
      game_map = Map.new(Board.new(state: [0,1,2,3]))
      expect(game_map.path_maps.sort).to eq result
    end
  end

  context '3 X 3 board' do
    it 'should map 362880 unique path_maps' do
      game_map = Map.new(Board.new(state: [0,1,2,3,4,5,6,7,8]))
      expect(game_map.path_maps.uniq.count).to eq 362880
    end
  end
end
