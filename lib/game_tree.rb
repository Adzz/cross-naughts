class GameTree
  attr_reader :game_tree

  def initialize(game_state)
    @game_state = game_state
    @game_tree = []
  end

# the number of levels is the number of free spaces
# while loop - while 

  def tree
  end

  private

  def other_player
    @game_state.other_player
  end

  def board
    @game_state.board
  end
end