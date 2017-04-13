class Path
  def initialize(game_tree, map)
    @game_tree = game_tree
    @path_maps = map.path_maps
  end

  def paths
    @path_maps.map do |path_map|
      path_map.each.with_index do |destination, index|
        tree[index][move]
      end
    end
  end

  private

  def tree
    @game_tree.tree
  end

  attr_reader :path_maps
end
