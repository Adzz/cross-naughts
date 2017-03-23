class GameState
  attr_reader :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def active_player
    @player
  end

  def board_state
    board.state
  end

  def children
    board.free_positions.map do |position|
      return [] if game_over?
      child_state = board_state.dup
      child_state[position] = active_player
      GameState.new(other_player, Board.new(state: child_state))
    end
  end

  def other_player
    active_player == "O" ? "X" : "O"
  end

  def free_spaces
    board.free_positions.count
  end

  private

  def game_over?
    board.end_state?
  end
end

