class Map
  def initialize(board)
    @board = board
  end

  def path_maps
    routes = []
    board.free_positions.each_with_index do |_pos, index|
      routes << [*0.. (board.free_positions.count - (index + 1))]
    end
    # what happens when routes is nil. how do we ensure it never will be
    routes.first.product(*routes[1..-1])
  end

  private

  attr_reader :board
end
