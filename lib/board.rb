class Board
    WINNING_LINES = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,4,6],
    [0,4,8],
    [1,4,7],
    [2,5,8]
  ]

  attr_reader :state

  def initialize(state: [*0..8])
    @state = state
  end

  def free_positions
    state - ["X"] - ["O"]
  end

  def end_state?
    free_positions.count == 0 || winning_board_for?("X") || winning_board_for?("O")
  end

  private

  def winning_board_for?(player)
    WINNING_LINES.any? do |line|
      state.values_at(*line) == [player, player, player]
    end
  end
end