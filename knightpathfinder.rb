require_relative 'polytreenode'
class KnightPathFinder

  attr_reader :visited_positions

  ALLOWED_MOVE_DIRECTIONS = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]]

  def initialize(pos = [0,0])
    @board = Array.new(8) {Array.new(8)}
    populate_board
    @pos = pos
    @visited_positions = [@pos]
    @current_node = @board[pos]
  end

  def populate_board
    (0..7).each do |row|
      (0..7).each do |col|
        @board[[row, col]].value = [row, col]
      end
    end
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def self.valid_moves(pos)
    board = Array.new(8) {Array.new(8) { PolyTreeNode.new("HI")}}
    spaces = ALLOWED_MOVE_DIRECTIONS.map do |delta_arr|
      row = pos[0] + delta_arr[0]
      col = pos[1] + delta_arr[1]
      [row,col]
    end
    spaces.select do |position|
      (0..7).cover?(position[0]) && (0..7).cover?(position[1])
    end
  end

  def new_move_positions(pos)
    new_positions = self.class.valid_moves(pos).reject do |move|
      @visited_positions.include?(move)
    end
    @visited_positions += new_positions
    new_positions
  end

  def build_move_tree
    children_positions = new_move_positions(@pos)
    children_positions.each {|pos| @board[pos].parent = self}
  end

end
