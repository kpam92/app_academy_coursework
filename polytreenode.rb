require "byebug"
class PolyTreeNode

  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if target_value == self.value
    @children.each do |child|
      current_child = child.dfs(target_value)
      unless current_child.nil?

        return current_child
      end
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_number = queue.shift

      return current_number if target_value == current_number.value
      queue += current_number.children
    end
    nil
  end


end
