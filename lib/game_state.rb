class GameState
  def initialize(player, board)
    @player = player
    @board = board
  end

  def active_player
    @player
  end

  def board_state
    @board.state
  end
end
