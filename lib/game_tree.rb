require_relative './map.rb'

class GameTree
  def initialize(game_state)
    @game_state = game_state
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

  private

  def grand_children
    @grand_children ||= game_state.children.map { |child| child.children }.flatten.compact
  end

  def great_grand_children
    @great_grand_children  ||= grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_grand_children
    @great_great_grand_children ||= great_grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_great_grand_children
    @great_great_great_grand_children ||= great_great_grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_great_great_grand_children
    @great_great_great_great_grand_children ||= great_great_great_grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_great_great_great_grand_children
    @great_great_great_great_great_grand_children ||= great_great_great_great_grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_great_great_great_great_grand_children
    @great_great_great_great_great_great_grand_children ||= great_great_great_great_great_grand_children.map { |child| child.children }.flatten.compact
  end

  def great_great_great_great_great_great_great_grand_children
    @great_great_great_great_great_great_great_grand_children ||= great_great_great_great_great_great_grand_children.map { |child| child.children }.flatten.compact
  end

  attr_reader :game_state, :routes

  def board
    game_state.board
  end
end
