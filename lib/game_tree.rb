require_relative './map.rb'

class GameTree
  attr_reader :game_tree

  def initialize(game_state)
    @game_state = game_state
    @game_tree = []
    @routes = Map.new(@game_state.board).routes
  end

  def tree
    @routes.each_with_object([]) do |route, paths|
      game_states = [
        @game_state.children[route.first]
      ]

      route.drop(1).each do |game_state_location|
        first_game_state = game_states.pop
        game_states.push(first_game_state)
        next_game_state = first_game_state.children[game_state_location]
        game_states.push(next_game_state)
      end
    end
  end


#  this is currying. we curry the function nine levels deep?
#  can we curry it dynamically - i.e only 4 levels deep if the board is smaller etc
#  To DO : Curry dat function
@game_state.children.map do |a|
  a.children.map do |b|
    b.children.map do |d|
      d.children.map do |e|
        e.children.map do |f|
          f.children.map do |e|
            e.children.map do |f|
              f.children.map do |g|
                g.children
              end
            end
          end
        end
      end
    end
  end
end

  private

  def other_player
    @game_state.other_player
  end

  def board
    @game_state.board
  end
end
