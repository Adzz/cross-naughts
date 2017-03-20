# should create new states, rather than keep them in the same object.
# The states should be linked by a path, on creation.
# Allows the game_state to be dumb.
# successor should be the responsibility of one abstraction above the game_state
# game state is just game state - a board layout, and a player who's go it is
# game state = board state + active_player

