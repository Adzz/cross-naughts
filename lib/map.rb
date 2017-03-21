class Map
  def initialize(board)
    @board = board
  end

  def paths
    paths = []
    board.free_positions.each_with_index do |_pos, index|
      paths << [*0.. (board.free_positions.count - (index + 1))]
    end
    paths.first.product(*paths[1..-1])
  end

  private

  attr_reader :board
end