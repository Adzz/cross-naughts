require_relative './map.rb'

class GameTree
  def initialize(game_state)
    @game_state = game_state
    @routes = Map.new(@game_state.board).routes
  end

  def games
    @routes.map do |route|
      route.each.with_index.with_object([]) do |(move, index), games|
        games << tree[index][move]
      end
    end
  end

  def tree
    @tree ||= [
      game_state.children,
      grand_children,
      great_grand_children,
      great_great_grand_children,
      great_great_great_grand_children,
      great_great_great_great_grand_children,
      great_great_great_great_great_grand_children,
      great_great_great_great_great_great_grand_children,
      great_great_great_great_great_great_great_grand_children
    ]
  end

# recursive metaprogramming blahh
  # def recur(counter=free_spaces)
  #   return if counter < 0
  #   send("#{counter * "great_"}grand_children")
  #   recur(counter-=1)
  # end

  def grand_children
    @grand_children ||= game_state.children.map { |child| child.children }.flatten
  end

  def great_grand_children
    @great_grand_children  ||= grand_children.map { |child| child.children }.flatten
  end

  def great_great_grand_children
    @great_great_grand_children ||= great_grand_children.map { |child| child.children }.flatten
  end

  def great_great_great_grand_children
    @great_great_great_grand_children ||= great_great_grand_children.map { |child| child.children }.flatten
  end

  def great_great_great_great_grand_children
    @great_great_great_great_grand_children ||= great_great_great_grand_children.map { |child| child.children }.flatten
  end

  def great_great_great_great_great_grand_children
    @great_great_great_great_great_grand_children ||= great_great_great_great_grand_children.map { |child| child.children }.flatten
  end

  def great_great_great_great_great_great_grand_children
    @great_great_great_great_great_great_grand_children ||= great_great_great_great_great_grand_children.map { |child| child.children }.flatten
  end

  def great_great_great_great_great_great_great_grand_children
    @great_great_great_great_great_great_great_grand_children ||= great_great_great_great_great_great_grand_children.map { |child| child.children }.flatten
  end

  attr_reader :game_state, :routes

  def board
    game_state.board
  end
end
